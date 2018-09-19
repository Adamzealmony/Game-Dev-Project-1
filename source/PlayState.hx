package;

import flixel.FlxSprite;
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
	public static var grow1:Bool = false;
	public static var g1Grow:Grass_1;
	public static var grow2:Bool = false;
	public static var g2Grow:Grass_2;
	var grass_array:Array<FlxPoint>;
	var exist_array:Array<Int>;
	var grass1_array:Array<Grass_1>;
	var grass2_array:Array<Grass_2>;
	var grass3_array:Array<Grass_3>;
	var _map:TiledMap;
	var _mWalls:FlxTilemap;
	var _hud:HUD;
	var _score:Int=0;
	var _stamina:Int = 100;
	var _timer:FlxTimer;
	//var _growtimer:FlxTimer;
	//var _growtimer2:FlxTimer;
	var _stamBar:FlxBar;
	var cnt:Int = 0;
	//change this variable below to whatever the required score is to win!!
	var reqScore = 800;
	
	 
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		 
		level = new TiledLevel("assets/tiled/field_one.tmx", this);
				
		add(level.backgroundLayer);
		add(level.foregroundTiles);
		add(level.imagesLayer);
		add(level.objectsLayer);	  
		
		//Grass growing place
		exist_array = new Array<Int>();
		grass_array = level.grass_coords;
		grass1_array = new Array<Grass_1>();
		grass2_array = new Array<Grass_2>();
		grass3_array = new Array<Grass_3>();
		
		for (i in 0...200){
			index = FlxG.random.int(0, grass_array.length - 1, exist_array);
			type = FlxG.random.int(0, 2);
			if (type == 0){
				grass_1 = new Grass_1(grass_array[index].x, grass_array[index].y);
				exist_array.push(index);
				grass1_array.push(grass_1);
				add(grass_1);
			}
			else if (type == 1){
				grass_2 = new Grass_2(grass_array[index].x, grass_array[index].y);
				exist_array.push(index);
				grass2_array.push(grass_2);
				add(grass_2);
			}
			else if (type == 2){
				grass_3 = new Grass_3(grass_array[index].x, grass_array[index].y);
				exist_array.push(index);
				grass3_array.push(grass_3);
				add(grass_3);
			}
		}
		
	    
		//place player at 1000,1000 on the screen
		_player = new Player (1700, 1600);
		_stamBar = new FlxBar(0, 0, LEFT_TO_RIGHT, 100, 10, _player, "_stamina");
		_stamBar.percent = _stamina;
		_stamBar.createColoredFilledBar(FlxColor.BLUE);
		_stamBar.createColoredEmptyBar(FlxColor.BLACK);
		_stamBar.trackParent(0, 100);
		add(_player);
		add(_stamBar);
		//creates a hud and timer
		_hud = new HUD(reqScore);
		_timer = new FlxTimer();
		_timer.start();
		//change .time to however long the player has
		_timer.time = 100;
		//_growtimer = new FlxTimer();
		//_growtimer.time = 20;
		//trace(_growtimer.timeLeft);
		//_growtimer.start(20);
		//trace(_growtimer.timeLeft);
		//_growtimer2 = new FlxTimer();
		//_growtimer2.time = 40;
		//_growtimer2.start(40);
		
		
		add(_hud);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{   grass_1Col();
		grass_2Col();
		grass_3Col();
		  //  trace(_growtimer.timeLeft);
	 
		if (_timer.timeLeft <= .1){
			gameOver();
			FlxG.switchState(new EndLevelOneState(_win, _score));
			return;
		}
		/*
	  	if (_growtimer.timeLeft <=.1)
		{  for ( grass in grass1_array)
			{	     
			grass1_array.remove(grass);
			//trace(_growtimer.timeLeft);
			grass.kill();
		grass_2= new Grass_2(grass.x, grass.y);
		grass2_array.push(grass_2);
		add(grass_2);
	      
			}
			_growtimer.reset();
		}
		if (_growtimer2.timeLeft <=0.1)
		{  for ( grass in grass2_array)
			{	   
			grass2_array.remove(grass);
			//trace(_growtimer2.timeLeft);
			grass.kill();
		grass_3= new Grass_3(grass.x, grass.y);
		grass3_array.push(grass_3);
		add(grass_3);
	      
			}
			 _growtimer2.reset();
		}
		*/
		
		FlxG.camera.follow(_player);
		_hud.updateHUD(FlxMath.roundDecimal(_timer.timeLeft, 0), _score);
		super.update(elapsed);
		FlxG.collide(_player, level.foregroundTiles);
		
		if (grow1 == true){
			grass_2= new Grass_2(g1Grow.x, g1Grow.y);
			grass2_array.push(grass_2);
			replace(g1Grow, grass_2);
			g1Grow.kill();
			grow1 = false;
			members.remove(_hud);
		    members.push(_hud);
		}
		if (grow2 == true){
			grass_3= new Grass_3(g2Grow.x, g2Grow.y);
			grass3_array.push(grass_3);
			replace(g2Grow, grass_3);
			g2Grow.kill();
			grow2 = false;
			members.remove(_hud);
		    members.push(_hud);
		}
	}
	 function onOverlap(_player:Player, grass_1:Grass_1 ):Void
	 {
		 if (_player._swing == true){
			//change number to whatever score is desired
			grass1_array.remove(grass_1);
		   grass_1.kill();
		   _score+= 10;
		}
	 }
	  function onOverlap2(_player:Player, grass_2:Grass_2 ):Void
	 {    if (_player._swing ==true){
		 grass_1 = new Grass_1(grass_2.x, grass_2.y);
		 grass1_array.push(grass_1);
		 replace(grass_2, grass_1);
		 grass_2.kill();
		   members.remove(_hud);
		   members.push(_hud);
		   	//change number to whatever score is desired, if we are spawning grass 1 in the same place then comment out the line below
		   //_score+= 10;
		   //grass_1 = new Grass_1(1300,1000);
		   //add(grass_1);
		}
		   
	 }
	  function onOverlap3(_player:Player, grass_3:Grass_3 ):Void
	 {    if (_player._swing == true){
		 grass_2 = new Grass_2(grass_3.x, grass_3.y);
		 grass2_array.push(grass_2);
		 replace(grass_3, grass_2);
		 grass_3.kill();
		   members.remove(_hud);
		   members.push(_hud);
		   //change number to whatever score is desired, if we are spawning grass 2 in the same place then comment out the line below
		   //_score+= 5;
		  // grass_2 = new Grass_2(1400,1000);
		   //add(grass_2);
		}
	 }
	
	public function gameOver():Void
	{
		if (_score >= reqScore){
			_win = true;
		}
		else{
			_win = false;
		}
	}
	function grass_1Col(){
		for ( grass in grass1_array){
			FlxG.overlap(_player  , grass , onOverlap);
		}
		
	}
	function grass_2Col(){
		for ( grass in grass2_array){
			FlxG.overlap(_player  , grass , onOverlap2);
		}
		
	}
	function grass_3Col(){
		for ( grass in grass3_array){
			FlxG.overlap(_player  , grass , onOverlap3);
		}
		
	}

}

