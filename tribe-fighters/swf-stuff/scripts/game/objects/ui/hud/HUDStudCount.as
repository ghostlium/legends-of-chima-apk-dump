package game.objects.ui.hud
{
   import game.GameRes;
   import game.Util;
   import game.objects.ui.UIComponent;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.world.EventUpdate;
   
   public class HUDStudCount extends UIComponent
   {
       
      
      public var _pHudScoreScene:GlaControllerScene;
      
      public var _vStudPos:Vec2F;
      
      public var _vScorePos:Vec2F;
      
      public var _pStudAnim:GlaControllerScene;
      
      public var _uStuds:uint;
      
      public var _studText:String;
      
      private var _tf:TextField;
      
      public function HUDStudCount()
      {
         super();
         this._uStuds = 0;
         this._studText = "";
         setSlideDir(eUISlideLeft);
         this._pHudScoreScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("hud_score"));
         this._vStudPos = this._pHudScoreScene.getRectangle("hud_score_stud").getPosition();
         this._vScorePos = this._pHudScoreScene.getRectangle("hud_score_text").getPosition();
         this._pStudAnim = new GlaControllerScene(null,null,GameRes.get()._pPickupSet.findScene("silverstud_static"));
         this._pStudAnim.playAnimation(true,1);
         this.addChild(this._pStudAnim);
         this._tf = new TextField(200,34,"",GameRes.get()._pScoreFont,32,16777215);
         this._tf.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._tf.touchable = false;
         this._tf.autoScale = true;
         this._tf.hAlign = HAlign.LEFT;
         this._tf.vAlign = VAlign.CENTER;
         this._tf.x = this._vScorePos.x;
         this._tf.y = this._vScorePos.y + 2;
         this.addChild(this._tf);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._tf);
         this._tf.dispose();
         this._tf = null;
         this._pHudScoreScene.dispose();
         this._pHudScoreScene = null;
         this.removeChild(this._pStudAnim);
         this._pStudAnim.dispose();
         this._pStudAnim = null;
      }
      
      public function getStuds() : uint
      {
         return this._uStuds;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._tf.text = this._studText;
         this._pStudAnim.x = this._vStudPos.x;
         this._pStudAnim.y = this._vStudPos.y;
         this._pStudAnim.updateAnimation();
      }
      
      public function setStuds(param1:uint) : void
      {
         this._uStuds = param1;
         this.updateStudText();
      }
      
      public function addStuds(param1:uint) : void
      {
         this._uStuds += param1;
         this.updateStudText();
      }
      
      public function updateStudText() : void
      {
         this._studText = Util.getFormattedNumber(this._uStuds);
      }
      
      public function getStudPos() : Vec2F
      {
         return this._vStudPos;
      }
      
      public function getStudScale() : Number
      {
         return this._pStudAnim.getScale().x;
      }
   }
}
