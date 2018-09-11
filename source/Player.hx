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
		
	
		animation.add("Walk", [0, 1, 0, 2], 5, false);
	
		 //slow down the player when it is not being moved 
		 drag.x = drag.y = 1600;
	  
		 
	 }
		  
	 public  function movement():Void 
	 {
		  _up = FlxG.keys.anyPressed([UP, W]);
		 _down = FlxG.keys.anyPressed([DOWN, S]);
		 _left = FlxG.keys.anyPressed([LEFT, A]);
		 _right = FlxG.keys.anyPressed([RIGHT, D]);
		 _rush = FlxG.keys.anyPressed([SHIFT]);
		 //cancel the effect of opposing input 
		 if (_up && _down)
		 _up = _down = false;
		 if (_left && _right)
		 _left = _right = false;
		 //if player is acturally moving 
		 if (_up || _down || _left || _right)
		 {
	     //creat a variable to hold the angle of our player
		 animation.play("Walk");
		 var mA:Float = 0;
		
		 if(_up)
		 {
			mA = -90;
	       facing = FlxObject.UP;
		 }
		 else if (_down)
		 {
			 mA = 90;
			 facing = FlxObject.DOWN;
		 }
		 else if (_left )
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
		 if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE) // if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
         {
         switch (facing)
         {
         case FlxObject.LEFT:
             animation.play("WALK");
		 case  FlxObject.RIGHT:
             animation.play("WALK");
         case FlxObject.UP:
             animation.play("WALK");
         case FlxObject.DOWN:
             animation.play("WALK");
         }
         }
		   if (_rush) 
		 {
		 velocity.set(speed * 5, 0);
		 velocity.rotate(FlxPoint.weak(0,0),mA);
		 
		 }
		 
		 
		 }
		 
		
		 
		 
	 }
	 
	 }
	 
	 
	 
 
 