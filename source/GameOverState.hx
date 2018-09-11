package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class GameOverState extends FlxState
{
	var _playAgainButton:FlxButton;
	var _gameOverTxt:FlxText;
	
	override public function create():Void
	{
		_playAgainButton  = new FlxButton(0, 0, "Play", clickPlayAgain);
		_gameOverTxt = new FlxText(0, 2, 0, "Game Over", 24);
		_playAgainButton.screenCenter();
		_gameOverTxt.screenCenter();
		_playAgainButton.y += 100;
		add(_gameOverTxt);
		add(_playAgainButton);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function clickPlayAgain():Void
	{
		//switch to menu
		FlxG.switchState(new MenuState());
	}
	
}