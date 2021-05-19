package game.objects.ui.frontend
{
   import game.GameRes;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import starling.display.Quad;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.world.EventUpdate;
   
   public class MainMenuFrame extends UIComponent
   {
       
      
      public var _pScene:GlaControllerScene;
      
      public var _vFrameTopStart:Vec2F;
      
      public var _vFrameTopEnd:Vec2F;
      
      public var _vFrameBottomStart:Vec2F;
      
      public var _vFrameBottomEnd:Vec2F;
      
      public var _vFrameTopPos:Vec2F;
      
      public var _vFrameBottomPos:Vec2F;
      
      public var _vLogoPos:Vec2F;
      
      public var _fAlpha:Number;
      
      public var _fRectAlpha:Number;
      
      public var _pFrameTop:GlaControllerSprite;
      
      public var _pFrameBottom:GlaControllerSprite;
      
      public var _pTweener:cTweener;
      
      public var q:Quad;
      
      public function MainMenuFrame()
      {
         super();
         this.q = new Quad(LegoChima.Instance().zGetScreenWidth(),LegoChima.Instance().zGetScreenHeight());
         this.q.color = 0;
         this.q.touchable = false;
         this._fAlpha = 1;
         this._fRectAlpha = 1;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_frame"));
         this._pScene.setPosition(new Vec2F());
         this._pFrameTop = this._pScene.getSprite("frame_top");
         this._pFrameBottom = this._pScene.getSprite("frame_bottom");
         this._pFrameTop.alignPivot();
         this._pFrameBottom.alignPivot();
         this._pTweener = new cTweener();
         this._vFrameTopEnd = new Vec2F();
         this._vFrameTopEnd.x = 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
         this._vFrameTopEnd.y = 0.5 * Number(this._pFrameTop.getSprite().getHeight());
         this._vFrameBottomEnd = new Vec2F();
         this._vFrameBottomEnd.x = 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
         this._vFrameBottomEnd.y = Number(LegoChima.Instance().zGetScreenHeight()) - 0.5 * Number(this._pFrameBottom.getSprite().getHeight());
         this._vFrameTopStart = new Vec2F(this._vFrameTopEnd.x,this._vFrameTopEnd.y);
         this._vFrameTopStart.y -= this._pFrameTop.getSprite().getHeight();
         this._vFrameBottomStart = new Vec2F(this._vFrameBottomEnd.x,this._vFrameBottomEnd.y);
         this._vFrameBottomStart.y += Number(this._pFrameBottom.getSprite().getHeight());
         this._vFrameTopPos = new Vec2F(this._vFrameTopStart.x,this._vFrameTopStart.y);
         this._vFrameBottomPos = new Vec2F(this._vFrameBottomStart.x,this._vFrameBottomStart.y);
         this.show();
         this._pFrameTop.setPosition(this._vFrameTopPos);
         this._pFrameBottom.setPosition(this._vFrameBottomPos);
         this.addChild(this.q);
         this.addChild(this._pScene);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this.q);
         this.q.dispose();
         this.q = null;
         this.removeChild(this._pScene);
         this._pScene.dispose();
         this._pScene = null;
         this._pTweener.dispose();
         this._pTweener = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._pTweener.tick(param1.getTime().dt);
         this._pFrameTop.setPosition(this._vFrameTopPos);
         this._pFrameBottom.setPosition(this._vFrameBottomPos);
         this._pFrameTop.setAlpha(uint(this._fAlpha * 255));
         this._pFrameBottom.setAlpha(uint(this._fAlpha * 255));
         var _loc2_:Number = this._fRectAlpha * this._fAlpha;
         if(_loc2_ > 0)
         {
            this.q.visible = true;
            this.q.alpha = _loc2_ * 0.5;
         }
         else
         {
            this.q.visible = false;
         }
      }
      
      override public function show() : void
      {
         this._fAlpha = 1;
         this._pTweener.addTween(this._vFrameTopPos,"FrameTop","y",this._vFrameTopStart.y,this._vFrameTopEnd.y,1,0,cTweener.BOUNCE,cTweener.EASE_OUT);
         this._pTweener.addTween(this._vFrameBottomPos,"FrameBottom","y",this._vFrameBottomStart.y,this._vFrameBottomEnd.y,1,0,cTweener.BOUNCE,cTweener.EASE_OUT);
         this._pTweener.addTween(this,"FrameRectAlpha","_fRectAlpha",0,1,0.5,0,cTweener.LINEAR);
         _bActive = true;
      }
      
      override public function hide() : void
      {
         this._pTweener.addTween(this,"FrameAlpha","_fAlpha",1,0,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         this._pTweener.reset();
         this._pFrameTop.setPosition(this._vFrameTopEnd);
         this._pFrameBottom.setPosition(this._vFrameBottomEnd);
         this._fAlpha = 1;
         this._fRectAlpha = 1;
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         this._pTweener.reset();
         this._fAlpha = 0;
         this._fRectAlpha = 0;
         _bActive = false;
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fAlpha * this._fRectAlpha > 0)
         {
            return true;
         }
         return false;
      }
   }
}
