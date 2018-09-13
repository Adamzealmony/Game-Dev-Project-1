 package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint; 

 class Player extends FlxSprite
	 {
		 
		 //player speed
		 public var speed:Float = 200;
		 public  var _up:Bool = false;
	     public  var _down:Bool = false;
	     public  var _left:Bool = false;
	     public  var _right:Bool = false;
		 public var _rush:Bool = false;
		 public var _canRush:Bool = true;
		 public var _swing:Bool = false;
		 
		 override public function update(elapsed:Float):Void 
		 {
			movement();
			super.update(elapsed);
			
			 
			 
		 }
		 
		 
		 
		 
     public function new(?X:Float=0, ?Y:Float=0)
     {
        super(X, Y);
		
		loadGraphic("assets/images/Walk.png", true, 100, 100);
		setFacingFlip(FlxObject.UP, false, false);
		setFacingFlip(FlxObject.DOWN, true, true);
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, true);
	
		
	
		animation.add("WalkUD", [0, 1, 0, 2], 5, false);
		animation.add("WalkLR", [3, 4, 3, 5], 5, false);
	
		
	
	
		 //slow down the player when it is not being moved 
		 drag.x = drag.y = 1600;
		 //setting the hitbox, needed to be adjusted later
		 setSize(8, 14);
		 offset.set(4, 2);
	  
		 
	 }
		  
	 public  function movement():Void 
	 {
		  _up = FlxG.keys.anyPressed([UP, W]);
		 _down = FlxG.keys.anyPressed([DOWN, S]);
		 _left = FlxG.keys.anyPressed([LEFT, A]);
		 _right = FlxG.keys.anyPressed([RIGHT, D]);
		 _rush = FlxG.keys.anyPressed([SHIFT]);
		 _swing = FlxG.keys.anyJustPressed([SPACE]);
		 //cancel the effect of opposing input 
		 if (_up && _down)
		 _up = _down = false;
		 if (_left && _right)
		 _left = _right = false;
		 //if player is acturally moving 
		 if (_up || _down || _left || _right)
		 {
	     //creat a variable to hold the angle of our player
	
		 var mA:Float = 0;
		
		 if(_up )
		 {
			mA = -90;
	     facing = FlxObject.UP;
		 }
		 else if (_down )
		 {
			 mA = 90;
		 facing = FlxObject.DOWN;
		 }
		 else if (_left)
		 {
			 mA = 180;
			 facing = FlxObject.LEFT;
		 }
		 else if (_right)
		 {
			 mA = 0;
			facing = FlxObject.RIGHT;
		 }
		
		 //setting velocity.x to speed and velocity.y to 0 
		 velocity.set(speed, 0);
		 //rotate that point around(0,0) by mA degrees
		 //a weak FlxPoint is recycled once it is used in a haxeflixel function
		 velocity.rotate(FlxPoint.weak(0, 0), mA);
	
		   if (_rush&&_canRush) 
		 {
		 velocity.set(speed * 5, 0);
		 velocity.rotate(FlxPoint.weak(0,0),mA);
		 
		 }
		
		 
		 }
	
		  if (_swing && (facing == FlxObject.UP))
		  {
	    loadGraphic("assets/images/SwingUD.png", true, 100, 200);
		graphicLoaded();
		centerOffsets(true);
		
		animation.add("SwingUD", [0, 1, 2, 3, 4, 3, 2, 1, 0],30, false);
		animation.play("SwingUD");
		  
		  }
		 if (_swing &&( facing == FlxObject.DOWN))
		  {
	    loadGraphic("assets/images/SwingUD.png", true, 100, 200);
		graphicLoaded();
		centerOffsets(true);
	
		animation.add("SwingUD", [0, 1, 2, 3, 4, 3, 2, 1, 0],30, false);
		animation.play("SwingUD");
		
		  }
		   if (_swing &&( facing == FlxObject.LEFT))
		  {
	    loadGraphic("assets/images/SwingLR.png", true, 200, 100);
		graphicLoaded();
		centerOffsets(true);
	
		animation.add("SwingLR", [0, 1, 2, 3, 4, 3, 2, 1, 0],30, false);
		animation.play("SwingLR");
		
		  }
		     if (_swing &&( facing == FlxObject.RIGHT))
		  {
	    loadGraphic("assets/images/SwingLR.png", true, 200, 100);
		graphicLoaded();
		centerOffsets(true);
	
		animation.add("SwingLR", [0, 1, 2, 3, 4, 3, 2, 1, 0],30, false);
		animation.play("SwingLR");
		
		  }

		   if (!_swing && _up) 
		  {
			  loadGraphic("assets/images/Walk.png", true, 100, 100);
			  graphicLoaded();
			  centerOffsets(true);
			
		       animation.add("WalkUD", [0, 1, 0, 2], 5, false);
			   animation.play("WalkUD"); 
			  
		  }
		    if (!_swing &&_down )
		  {
			  loadGraphic("assets/images/Walk.png", true, 100, 100);
			  graphicLoaded();
			  centerOffsets(true);
			
				 animation.add("WalkUD", [0, 1, 0, 2], 5, false);
			     animation.play("WalkUD");
			 
			 
			  
		  }
		   if (!_swing && _left )
		  {
			  loadGraphic("assets/images/Walk.png", true, 100, 100);
			  graphicLoaded();
			  centerOffsets(true);
			  animation.add("WalkLR", [3, 4, 3, 5], 5, false);
			  animation.play("WalkLR");
			  
		  }
		    if (!_swing && _right  )
		  {
			  loadGraphic("assets/images/Walk.png", true, 100, 100);
			  graphicLoaded();
			  centerOffsets(true);
			  animation.add("WalkLR", [3, 4, 3, 5], 5, false);
			  animation.play("WalkLR");
			  
		  }
		  
		 
	 }
	 public function updateRush(rush:Bool):Void{
		 _canRush = rush;
	 }
	
	 
	 }
	 
	 
	 
 
 