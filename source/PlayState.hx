package;

import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.addons.editors.tiled.*;
import flixel.tile.FlxTilemap;
import flixel.math.FlxMath;
import flixel.FlxG;
import flixel.ui.FlxBar;

class PlayState extends FlxState
{
	public var level:TiledLevel;
	
	public var _player:Player;
	public var floor:FlxObject;
	var _map:TiledMap;
	var _mWalls:FlxTilemap;
	var _hud:HUD;
	var _score:Int=0;
	var _stamina:Int = 100;
	var _timer:FlxTimer;
	var _stamBar:FlxBar;
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		 
		level = new TiledLevel("assets/tiled/map_1.tmx", this);
		add(level.backgroundLayer);
		add(level.foregroundTiles);
		add(level.imagesLayer);
		add(level.objectsLayer);
		//define the position of the player wrt the screen
		_player = new Player(105, 105);
		_stamBar = new FlxBar(0, 0, LEFT_TO_RIGHT, 100, 10);
		_stamBar.percent = _stamina;
		_stamBar.screenCenter();
		_stamBar.y += 50;
		_stamBar.scrollFactor.set(0, 0);
	    add(_player);
		add(_stamBar);
		//creates a hud and timer
		_hud = new HUD();
		_timer = new FlxTimer();
		_timer.start();
		//change .time to however long the player has
		_timer.time = 100;
		add(_hud);
		
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (_timer.timeLeft <= .1){
			FlxG.switchState(new GameOverState());
			return;
		}
		if (_player._rush&& _player._canRush&&_stamina>0){
			_stamina -= 1;
		}
		else if(_stamina!=100){
			_stamina += 1;
			_player.updateRush(false);
		}
		else if (_stamina == 100){
			_player.updateRush(true);
		}
		_stamBar.percent = _stamina;
		FlxG.camera.follow(_player);
		_hud.updateHUD(FlxMath.roundDecimal(_timer.timeLeft, 0), _score);
		super.update(elapsed);
		FlxG.collide(_player, level.foregroundTiles);
	}

}
