package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class EndLevelTwoState extends FlxState
{
	var _playAgainButton:FlxButton;
	var _nextLevelButton:FlxButton;
	var _gameOverTxt:FlxText;
	var _win:Bool = false;
	public function new(Win:Bool){
		_win = Win;
		super();
	}
	
	override public function create():Void
	{
		
			_playAgainButton  = new FlxButton(0, 0, "Play Again", clickPlayAgain);
		if (_win){
			_gameOverTxt = new FlxText(0, 2, 0, "You Win!!", 24);
		}
		else{
			_gameOverTxt = new FlxText(0, 2, 0, "You Lose.", 24);
		}
			_playAgainButton.screenCenter();
			_playAgainButton.y += 100;
			add(_playAgainButton);
		_gameOverTxt.screenCenter();
		add(_gameOverTxt);
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