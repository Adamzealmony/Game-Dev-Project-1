package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class EndLevelTwoState extends FlxState
{
	var _playAgainButton:FlxButton;
	var _gameOverTxt:FlxText;
	var _win:Bool = false;
	var _score:Int;
	public function new(Win:Bool, Score:Int){
		_score = Score;
		_win = Win;
		super();
	}
	
	override public function create():Void
	{
		
		if (_win){
			_playAgainButton  = new FlxButton(0, 0, "Main Menu", clickPlayAgain);
			_gameOverTxt = new FlxText(0, 0, 600, "As you take a moment to wipe the sweat off your brow, you see the second team emerge into the clearing. They give you a pat on the back and send you back to base as they finish what you started. \nYourScore: " + Std.string(_score), 24);
			_gameOverTxt.screenCenter();
			_gameOverTxt.y -= 300;
			_playAgainButton.screenCenter();
			_playAgainButton.y += 100;
			add(_playAgainButton);
		}
		else{
			_playAgainButton  = new FlxButton(0, 0, "Main Menu", clickPlayAgain);
			_gameOverTxt = new FlxText(0, 0, 600, "You are too slow and the grass grows over your body and you can't move. By the time the second team arrives it is too late. \nYour Score: " + Std.string(_score), 24);
			_gameOverTxt.screenCenter();
			_gameOverTxt.y -= 300;
			_playAgainButton.screenCenter();
			_playAgainButton.y += 100;
			add(_playAgainButton);
		}
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