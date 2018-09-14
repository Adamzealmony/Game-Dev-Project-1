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
		 public var _up2:Bool = false;
		 public var _up3:Bool = false;	 
	     public  var _down:Bool = false;
		 public  var _down2:Bool = false;
		 public  var _down3:Bool = false;
	     public  var _left:Bool = false;
		 public  var _left2:Bool = false;
		 public  var _left3:Bool = false;
	     public  var _right:Bool = false;
		 public  var _right2:Bool = false;
		 public  var _right3:Bool = false;
		 public var _rush:Bool = false;
		 public var _canRush:Bool = true;
		 public var _swing:Bool = false;
		 public var _stamina:Int = 100;
		 public var _player = new FlxSprite ();
		
		 
		 override public function update(elapsed:Float):Void 
		 {
			movement();
			updateRush();
			super.update(elapsed);
			
			 
			 
		 }
		 
		 
		 
		 
     public function new(?X:Float=0, ?Y:Float=0)
     {
        super(X, Y);
		
     
		
		_player.loadGraphic("assets/images/Walk.png", true, 100, 100);
		add(_player);
	
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
		  _up2 = FlxG.keys.anyJustPressed([UP, W]);
		  _up3 = FlxG.keys.anyJustReleased([UP, W]);
		 _down = FlxG.keys.anyPressed([DOWN, S]);
	     _down2 = FlxG.keys.anyJustPressed([DOWN, S]);
		 _down3 = FlxG.keys.anyJustReleased([DOWN, S]);
		 _left = FlxG.keys.anyPressed([LEFT, A]);
		 _left2 = FlxG.keys.anyJustPressed([LEFT, A]);
		 _left3 = FlxG.keys.anyJustReleased([LEFT, A]);
		 _right = FlxG.keys.anyPressed([RIGHT, D]);
		 _right2 = FlxG.keys.anyJustPressed([RIGHT, D]);
		 _right3 = FlxG.keys.anyJustReleased([RIGHT, D]);
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

		  if (!_swing && _up2 ) 
		  {
			  loadGraphic("assets/images/Walk.png", true, 100, 100);
			  graphicLoaded();
			  centerOffsets(true);
			
		       animation.add("WalkUD", [0, 1, 0, 2], 5, true);
		  animation.play("WalkUD"); 
		  
		  }
			   else if (_up3)
			   {
				   animation.finish();
			   }
			  
		  
		  
		  
		    if (!_swing &&_down2 )
		  {
			  loadGraphic("assets/images/Walk.png", true, 100, 100);
			  graphicLoaded();
			  centerOffsets(true);
			
				 animation.add("WalkUD", [0, 1, 0, 2], 5, true);
			     animation.play("WalkUD");  
		  }
		   else if (_down3)
			   {
				   animation.finish();
			   }
		   if (!_swing && _left2 )
		  {
			  loadGraphic("assets/images/Walk.png", true, 100, 100);
			  graphicLoaded();
			  centerOffsets(true);
			  animation.add("WalkLR", [3, 4, 3, 5], 5, true);
			  animation.play("WalkLR");
		  }
		   else if (_left3)
			   {
				   animation.finish();
			   }
		    if (!_swing && _right2  )
		  {
			  loadGraphic("assets/images/Walk.png", true, 100, 100);
			  graphicLoaded();
			  centerOffsets(true);
			  animation.add("WalkLR", [3, 4, 3, 5], 5, true);
			  animation.play("WalkLR");
		  }
		   else if (_right3)
			   {
				   animation.finish();
			   }
		  
		 
	 }
	 public function updateRush():Void{
		if (_rush&& _canRush&&_stamina>0){
			_stamina -= 1;
		}
		else if(_stamina!=100){
			_stamina += 1;
			_canRush = false;
		}
		else if (_stamina == 100){
			_canRush = true;
		}
	 }
	
	 
	 }
	 
	 
	 
 
 