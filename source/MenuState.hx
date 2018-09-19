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
	var _titleText:FlxText;
	var _story:FlxText;
	var _exitInfoButton:FlxButton;
	
	override public function create():Void
	{
		FlxG.sound.playMusic("assets/music/GrassSong.wav", 1);
		
		FlxG.camera.bgColor = 0xff131c1b;
		_playButton  = new FlxButton(0, 0, "Play", clickPlay);
		_playButton.onUp.sound =FlxG.sound.load("assets/sounds/GrassCut.wav", 1);
		_infoButton = new FlxButton(0, 0, "Info", clickInfo);
		_infoButton.onUp.sound =FlxG.sound.load("assets/sounds/GrassCut.wav", 1);
		_playButton.screenCenter();
		_infoButton.screenCenter();
		_infoButton.x += _playButton.width / 2 + 10;
		_playButton.x -= _infoButton.width / 2 + 10;
		_titleText = new FlxText(0, 0, 0, "Grassanova", 24);
		_titleText.screenCenter();
		_titleText.y -= 100;
		_story = new FlxText(0, 0, 600, "Recently some mutant fast growing grass was discovered in a local farmer's field. You've been sent to do some initial scouting and cleanup of this invasive grass. Left unchecked, this grass could grow over an entire town in a matter of days. Luckily, once it's cut down to the ground, it doesn't seem to grow back. Your mission is to clear out as much grass as possible before the second team arrives.", 16);
		_story.screenCenter();
		_story.y += 100;
		_exitInfoButton = new FlxButton(0, 0, "Exit Info", exitInfo);
		_exitInfoButton.screenCenter();
		_exitInfoButton.y += 100;
		_infoText = new FlxText(0, 0, 0, "Use arrow keys or WASD to move the player.\n\nPress shift to move faster if you have enough stamina.\n\nPress space to swing the scythe.", 16);
		_infoText.screenCenter();
		_infoText.y -= 50;
		add(_playButton);
		add(_infoButton);
		add(_exitInfoButton);
		add(_titleText);
		add(_story);
		add(_infoText);
		_exitInfoButton.visible = false;
		_infoText.visible = false;
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
		_story.visible = false;
		_infoText.visible = true;
		_exitInfoButton.visible = true;
		_titleText.visible = false;
	}
	function exitInfo():Void{
		_exitInfoButton.visible = false;
		_playButton.visible = true;
		_infoButton.visible = true;
		_story.visible = true;
		_titleText.visible = true;
		_infoText.visible = false;
	}
	
}