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

    public function new()
    {
        super();
		//_sprBack taken from the tutorial link above
        _sprBack = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
        _sprBack.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
        _txtTimer = new FlxText(0, 2, 0, "Time: 100", 8);
        _txtScore = new FlxText(0, 2, 0, "Score: 0", 8);
        _txtScore.x = FlxG.camera.width-10-_txtScore.width;
		_sprBack.scrollFactor.set(0, 0);
		_txtTimer.scrollFactor.set(0, 0);
		_txtScore.scrollFactor.set(0, 0);
        add(_sprBack);
        add(_txtTimer);
        add(_txtScore);
    }

     public function updateHUD(Timer:Float = 0, Score:Int = 0):Void
     {
         _txtTimer.text = "Time: " + Std.string(Timer);
         _txtScore.text = "Score: " + Std.string(Score);
     }
 }