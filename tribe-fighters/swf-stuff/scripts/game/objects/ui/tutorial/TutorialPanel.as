package game.objects.ui.tutorial
{
   import game.GameRes;
   import game.GameWorld;
   import game.tween.cTweener;
   import starling.display.BlendMode;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.Vec2F;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.Renderable2;
   
   public class TutorialPanel extends Renderable2
   {
      
      public static const kfEdgeLen:Number = 12;
      
      public static const kfTextOffsetX:Number = 12;
      
      public static const kfTextOffsetY:Number = 10;
       
      
      public var _text:String;
      
      public var _box:AABox2f;
      
      public var _vPos:Vec2F;
      
      public var _fAlpha:Number;
      
      public var _pTweener:cTweener;
      
      public var _bPulseText:Boolean;
      
      private var _tf:TextField;
      
      private var _tickCount:int;
      
      public function TutorialPanel(param1:String, param2:AABox2f, param3:Vec2F, param4:Boolean = false)
      {
         super();
         this._bPulseText = param4;
         this._text = param1;
         this._box = param2;
         this._vPos = param3;
         this._fAlpha = 0;
         this._tickCount = 0;
         this._pTweener = new cTweener();
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this._tf = new TextField(this._box.getSizeX() - 2 * kfEdgeLen,this._box.getSizeY(),"",GameRes.get()._pScoreFont,24,16777215);
         this._tf.autoScale = true;
         this._tf.touchable = false;
         this._tf.alignPivot();
         this._tf.hAlign = HAlign.CENTER;
         this._tf.vAlign = VAlign.CENTER;
         this._tf.x = this._vPos.x;
         this._tf.y = this._vPos.y;
         this.addChild(this._tf);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._tf,true);
         this._tf = null;
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this._pTweener.dispose();
         this._pTweener = null;
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Number = NaN;
         this._pTweener.tick(param1.getTime().dt);
         if(this._bPulseText)
         {
            ++this._tickCount;
            _loc2_ = (1 - (Math.sin(this._tickCount * 0.1) + 1) * 0.12 * 2) * this._fAlpha;
            this._tf.alpha = _loc2_;
         }
         else
         {
            this._tf.blendMode = BlendMode.NORMAL;
            this._tf.alpha = Math.min(this._fAlpha * 1.5,1);
         }
         this._tf.text = GameWorld.get().getLanguage().getString(this._text);
      }
      
      public function setAlpha(param1:Number) : void
      {
         this._pTweener.reset();
         this._pTweener.addTween(this,"tutorialpanel","_fAlpha",this._fAlpha,param1,0.25,0,cTweener.LINEAR);
      }
   }
}
