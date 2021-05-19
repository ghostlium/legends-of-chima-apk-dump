package game.objects.ui.hud
{
   import game.GameRes;
   import game.objects.ui.UIComponent;
   import starling.display.Image;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.core.zSprite;
   
   public class HUDPortrait extends UIComponent
   {
       
      
      public var _pPortraitLayoutScene:GlaControllerScene;
      
      public var _pPortraitSpriteScene:GlaControllerScene;
      
      public var _pCurrPortrait:zSprite;
      
      public var _vPos:Vec2F;
      
      private var _pi:Image;
      
      public function HUDPortrait()
      {
         super();
         setSlideDir(eUISlideLeft);
         this._pPortraitLayoutScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("hud_portrait"));
         this._pPortraitSpriteScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("character_portraits"));
         this._vPos = this._pPortraitLayoutScene.getRectangle("portrait").getPosition();
         this._pCurrPortrait = null;
         this._pi = null;
      }
      
      override public function dispose() : void
      {
         if(this._pi != null)
         {
            this.removeChild(this._pi,true);
            this._pi = null;
         }
         this._pPortraitLayoutScene.dispose();
         this._pPortraitLayoutScene = null;
         this._pPortraitSpriteScene.dispose();
         this._pPortraitSpriteScene = null;
         super.dispose();
      }
      
      public function setPortrait(param1:String) : void
      {
         var _loc2_:GlaControllerSprite = this._pPortraitSpriteScene.findSprite(param1);
         if(_loc2_)
         {
            if(this._pCurrPortrait != _loc2_.getSprite())
            {
               this._pCurrPortrait = _loc2_.getSprite();
            }
            if(this._pi != null)
            {
               this.removeChild(this._pi,true);
               this._pi = null;
            }
            if(this._pCurrPortrait != null)
            {
               this._pi = new Image(this._pCurrPortrait._tex);
               this._pi.alignPivot();
               this._pi.touchable = false;
               this._pi.x = this._vPos.x;
               this._pi.y = this._vPos.y;
               this.addChild(this._pi);
            }
         }
      }
   }
}
