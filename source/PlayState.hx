package;

import flixel.FlxState;
import flixel.util.FlxTimer;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	var _hud:HUD;
	var _score:Int=0;
	var _stamina:Int = 100;
	var _timer:FlxTimer;
	override public function create():Void
	{
		_hud = new HUD();
		_timer = new FlxTimer();
		_timer.start();
		_timer.time = 100;
		add(_hud);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		_hud.updateHUD(FlxMath.roundDecimal(_timer.timeLeft, 0), _score, _stamina);
		super.update(elapsed);
	}
}
