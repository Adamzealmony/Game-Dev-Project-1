package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint; 
import flixel.util.FlxTimer;

class Grass_1 extends FlxSprite
{

	
	
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		
		loadGraphic("assets/tiled/grass_ht_1_s_sprite.png", true, 100, 100);
	}
	override public function update(elapsed:Float):Void{
	
	}
}