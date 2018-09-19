 package;

 //note: used http://haxeflixel.com/documentation/ui-and-combat/ as a guide for creating the hud class
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.group.FlxGroup.FlxTypedGroup;
 import flixel.text.FlxText;
 import flixel.util.FlxColor;
 using flixel.util.FlxSpriteUtil;

 class HUD extends FlxTypedGroup<FlxSprite>
 {
    var _sprBack:FlxSprite;
    var _txtTimer:FlxText;
    var _txtScore:FlxText;
	var _txtReq:FlxText;
	var _reqScore:Int;

    public function new(?Score:Int=500)
    {
		_reqScore = Score;
        super();
		//_sprBack taken from the tutorial link above
        _sprBack = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
        _sprBack.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
        _txtTimer = new FlxText(0, 2, 0, "Time: 100", 8);
        _txtScore = new FlxText(0, 2, 0, "Score: 0", 8);
		_txtReq = new FlxText(0, 2, 0, "Score Left: " + Std.string(_reqScore), 8);
		_txtReq.x = FlxG.camera.width/2 - _txtReq.width/2+10;
        _txtScore.x = FlxG.camera.width-10-_txtScore.width;
		_sprBack.scrollFactor.set(0, 0);
		_txtTimer.scrollFactor.set(0, 0);
		_txtScore.scrollFactor.set(0, 0);
		_txtReq.scrollFactor.set(0, 0);
        add(_sprBack);
        add(_txtTimer);
        add(_txtScore);
		add(_txtReq);
    }

     public function updateHUD(Timer:Float = 0, Score:Int = 0):Void
     {
         _txtTimer.text = "Time: " + Std.string(Timer);
         _txtScore.text = "Score: " + Std.string(Score);
		 _txtReq.text = "Score Left: " + Std.string(_reqScore-Score);
		 _txtScore.x = FlxG.camera.width - 10 - _txtScore.width;
		 _txtReq.x = FlxG.camera.width/2 - _txtReq.width+10;

     }
 }