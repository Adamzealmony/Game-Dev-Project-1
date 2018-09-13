package;

import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.FlxG;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
		//Use this line if the resizing is needed
		//FlxG.resizeWindow(1000, 1000);
	}
}
