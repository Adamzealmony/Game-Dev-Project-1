package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.system.FlxSound;

class MenuState extends FlxState
{
	var _playButton:FlxButton;
	var _infoButton:FlxButton;
	var _infoText:FlxText;
	var _exitInfoButton:FlxButton;
	
	override public function create():Void
	{
		FlxG.sound.playMusic("assets/music/GrassSong.wav", 1);
		
		FlxG.camera.bgColor = 0xff131c1b;
		_playButton  = new FlxButton(0, 0, "Play", clickPlay);
		_infoButton = new FlxButton(0, 0, "Info", clickInfo);
		_playButton.screenCenter();
		_infoButton.screenCenter();
		_infoButton.x += _playButton.width / 2 + 10;
		_playButton.x -= _infoButton.width / 2 + 10;
		_exitInfoButton = new FlxButton(0, 0, "Exit Info", exitInfo);
		_exitInfoButton.screenCenter();
		_exitInfoButton.y += 100;
		add(_playButton);
		add(_infoButton);
		add(_exitInfoButton);
		_exitInfoButton.visible = false;
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function clickPlay():Void
	{
		// switch to play scene!
		//code taken from class.
		FlxG.switchState(new PlayState());
	}
	function clickInfo():Void{
		_playButton.visible = false;
		_infoButton.visible = false;
		_exitInfoButton.visible = true;
	}
	function exitInfo():Void{
		_exitInfoButton.visible = false;
		_playButton.visible = true;
		_infoButton.visible = true;
	}
	
}