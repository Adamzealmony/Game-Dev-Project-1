package;

import flixel.FlxState;

class PlayState extends FlxState
{
	    var _player:Player;
	override public function create():Void
	{
		//define the position of the player wrt the screen
		_player = new Player(20, 20);
	    add(_player);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
