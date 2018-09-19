package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class EndLevelOneState extends FlxState
{
	var _playAgainButton:FlxButton;
	var _nextLevelButton:FlxButton;
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
			_nextLevelButton  = new FlxButton(0, 0, "Investigate", clickNextLevel);
			_gameOverTxt = new FlxText(0, 0, 600, "As the second team arrives, you get reports of more grass growing in a nearby forest. You decide to investigate this new area while the second team finishes up here. \nYour Score: " + Std.string(_score), 24);
			_gameOverTxt.screenCenter();
			_gameOverTxt.y -= 250;
			_nextLevelButton.screenCenter();
			_nextLevelButton.y += 100;
			add(_nextLevelButton);
		}
		else{
			_playAgainButton  = new FlxButton(0, 0, "Main Menu", clickPlayAgain);
			_gameOverTxt = new FlxText(0, 0, 600, "You are too slow and the grass grows over your body and you can't move. By the time the second team arrives it is too late. \nYour Score" + Std.string(_score), 24);
			_gameOverTxt.screenCenter();
			_gameOverTxt.y -= 250;
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
	
	function clickNextLevel():Void
	{
		//switch to menu
		FlxG.switchState(new PlayState_2());
	}
}