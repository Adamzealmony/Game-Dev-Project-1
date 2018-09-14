package;

import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.addons.editors.tiled.*;
import flixel.tile.FlxTilemap;
import flixel.math.FlxMath;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;


class PlayState extends FlxState
{
	public var level:TiledLevel;
	public var _win:Bool = false;
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
	  
		_stamBar = new FlxBar(0, 0, LEFT_TO_RIGHT, 100, 10, _player, "_stamina");
		_stamBar.percent = _stamina;
		_stamBar.trackParent(0, 100);
		_stamBar.createColoredFilledBar(FlxColor.BLUE);
		_stamBar.createColoredEmptyBar(FlxColor.BLACK);
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
			gameOver();
			FlxG.switchState(new GameOverState(_win));
			return;
		}
		FlxG.camera.follow(_player);
		_hud.updateHUD(FlxMath.roundDecimal(_timer.timeLeft, 0), _score);
		super.update(elapsed);
		FlxG.collide(_player, level.foregroundTiles);
	}
	public function gameOver():Void
	{
		if (_score >= 100){
			_win = true;
		}
		else{
			_win = false;
		}
	}

}

