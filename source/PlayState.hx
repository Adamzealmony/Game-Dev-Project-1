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
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;


class PlayState extends FlxState
{
	public var level:TiledLevel;
	public var _win:Bool = false;
	public var _player:Player;
	public var floor:FlxObject;
	public var index:Int = 0;
	public var type:Int = 0;
	public var grass_1:Grass_1;
	public var grass_2:Grass_2;
	public var grass_3:Grass_3;
	var grass_array:Array<FlxPoint>;
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
		 
		level = new TiledLevel("assets/tiled/field_one.tmx", this);
				
		add(level.backgroundLayer);
		add(level.foregroundTiles);
		add(level.imagesLayer);
		add(level.objectsLayer);	  
		
		//Grass growing place
		grass_array = level.grass_coords;
		
		for (i in 0...50){
			index = FlxG.random.int(0, grass_array.length - 1);
			type = FlxG.random.int(0, 2);
			if (type == 0){
				add(new Grass_1(grass_array[index].x, grass_array[index].y));
			}
			else if (type == 1){
				add(new Grass_2(grass_array[index].x, grass_array[index].y));
			}
			else if (type == 2){
				add(new Grass_3(grass_array[index].x, grass_array[index].y));
			}
		}
		
	    
		//place player at 1000,1000 on the screen
		_player = new Player (1000, 1000);
		_stamBar = new FlxBar(0, 0, LEFT_TO_RIGHT, 100, 10, _player, "_stamina");
		grass_1 = new Grass_1(1200,1000);
		grass_2 = new Grass_2(1300,1000);
		grass_3 = new Grass_3(1400,1000);
		_stamBar.percent = _stamina;
		_stamBar.createColoredFilledBar(FlxColor.BLUE);
		_stamBar.createColoredEmptyBar(FlxColor.BLACK);
		_stamBar.trackParent(0, 100);
		add(_player);
		add(_stamBar);
		add(grass_1);
		add(grass_2);
		add(grass_3);
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
	{ FlxG.overlap(_player  , grass_1 , onOverlap);
	  FlxG.overlap(_player  , grass_2, onOverlap2);
	  FlxG.overlap(_player  , grass_3 , onOverlap3);
	 
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
	 function onOverlap(_player:Player, grass_1:Grass_1 ):Void
	 {    if (_player._swing ==true)
		   grass_1.kill();
	 }
	  function onOverlap2(_player:Player, grass_2:Grass_2 ):Void
	 {    if (_player._swing ==true)
		   grass_2.kill();
		   //grass_1 = new Grass_1(1300,1000);
		   //add(grass_1);
		   
	 }
	  function onOverlap3(_player:Player, grass_3:Grass_3 ):Void
	 {    if (_player._swing ==true)
		   grass_3.kill();
		  // grass_2 = new Grass_2(1400,1000);
		   //add(grass_2);
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

