package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.math.FlxMath;
import flixel.ui.FlxBar;

class PlayState extends FlxState
{
	var _player:Player;
	var _hud:HUD;
	var _score:Int=0;
	var _stamina:Int = 100;
	var _timer:FlxTimer;
	var _stamBar:FlxBar;
	override public function create():Void
	{
		//define the position of the player wrt the screen
		_player = new Player(20, 20);
		_stamBar = new FlxBar(0, 0, LEFT_TO_RIGHT, 100, 10);
		_stamBar.percent = _stamina;
	    add(_player);
		add(_stamBar);
		_stamBar.screenCenter();
		//creates a hud and timer
		_hud = new HUD();
		_timer = new FlxTimer();
		_timer.start();
		//change .time to however long the player has
		_timer.time = 100;
		add(_hud);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (_timer.timeLeft <= .1){
			FlxG.switchState(new GameOverState());
			return;
		}
		if (_player._rush&& _player._canRush&&_stamina>0){
			_stamina -= 1;
		}
		else if (_player._rush && _stamina == 0){
			_player.updateRush(false);
		}
		else if(_stamina!=100){
			_stamina += 1;
		}
		else if (_stamina == 100){
			_player.updateRush(true);
		}
		_stamBar.percent = _stamina;
		_stamBar.x = _player.x;
		_stamBar.y = _player.y + 100;
		_hud.updateHUD(FlxMath.roundDecimal(_timer.timeLeft, 0), _score, _stamina);
		super.update(elapsed);
	}

}
