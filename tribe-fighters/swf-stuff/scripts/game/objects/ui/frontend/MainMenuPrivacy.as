package game.objects.ui.frontend
{
   import game.GameRes;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.world.EventUpdate;
   
   public class MainMenuPrivacy extends UIComponent
   {
       
      
      public var _pScene:GlaControllerScene;
      
      public var _pBack:GlaControllerButton;
      
      public var _fBackAlpha:Number;
      
      public var _html:String;
      
      public var _pTweener:cTweener;
      
      public function MainMenuPrivacy()
      {
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         super();
         this._fBackAlpha = 0;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_privacy"));
         this._pScene.setPosition(new Vec2F());
         var _loc1_:Vec2F = this._pScene.getRectangle("screen_centre").getPosition();
         var _loc2_:Vec2F = this._pScene.getRectangle("screen_bottom_centre").getPosition();
         this._pBack = this._pScene.getButton("back_button");
         var _loc3_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         _loc4_ = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),Number(LegoChima.Instance().zGetScreenHeight()));
         _loc5_ = this._pBack.getPosition();
         _loc5_.x -= _loc2_.x;
         _loc5_.y -= _loc2_.y;
         _loc5_.x += _loc4_.x;
         _loc5_.y += _loc4_.y;
         this._pBack.setPosition(_loc5_);
         this._pTweener = new cTweener();
         this.addChild(this._pScene);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._pScene);
         this._pTweener.dispose();
         this._pTweener = null;
         this._pScene.dispose();
         this._pScene = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc3_:GlaMsg = null;
         this.touchable = _bActive;
         this._pTweener.tick(param1.getTime().dt);
         var _loc2_:uint = uint(255 * this._fBackAlpha);
         this._pBack.setAlpha(_loc2_);
         if(!_bActive)
         {
            return;
         }
         this._pScene.update();
         while(this._pScene.hasMsg())
         {
            _loc3_ = this._pScene.popMsg();
            if(_loc3_.getText() == "back")
            {
               (getWorldObj() as MainMenu).gotoHelp();
            }
         }
      }
      
      override public function show() : void
      {
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",0,1,0.25,0,cTweener.LINEAR);
         _bActive = true;
      }
      
      override public function hide() : void
      {
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",1,0,0.25,0,cTweener.LINEAR);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         this._pTweener.reset();
         this._fBackAlpha = 1;
         this._pBack.setAlpha(255);
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         this._pTweener.reset();
         this._fBackAlpha = 0;
         this._pBack.setAlpha(0);
         _bActive = false;
      }
      
      override public function showAdditionals() : void
      {
      }
      
      override public function hideAdditionals() : void
      {
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fBackAlpha > 0)
         {
            return true;
         }
         return false;
      }
   }
}
