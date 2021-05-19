package game.objects.ui.frontend
{
   import game.GameRes;
   import game.GameWorld;
   import game.SaveData;
   import game.Util;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.world.EventUpdate;
   
   public class MainMenuCharSelectUnlock extends UIComponent
   {
       
      
      public var _pScene:GlaControllerScene;
      
      public var _pDialog:GlaControllerSprite;
      
      public var _pClose:GlaControllerButton;
      
      public var _pConfirm:GlaControllerButton;
      
      public var _vTextPos:Vec2F;
      
      public var _fConfirmAlpha:Number;
      
      public var _fAlpha:Number;
      
      public var _fScale:Number;
      
      public var _pTweener:cTweener;
      
      private var _tf1:TextField;
      
      private var _tf2:TextField;
      
      public function MainMenuCharSelectUnlock()
      {
         super();
         this._fAlpha = 0;
         this._fScale = 0.5;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_unlock_dialog"));
         this._pScene.setPosition(new Vec2F());
         var _loc1_:Vec2F = this._pScene.getRectangle("screen_centre").getPosition();
         var _loc2_:Vec2F = this._pScene.getRectangle("screen_bottom_centre").getPosition();
         var _loc3_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc4_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),Number(LegoChima.Instance().zGetScreenHeight()));
         this._pDialog = this._pScene.getSprite("dialog");
         this._pClose = this._pScene.getButton("close");
         this._pConfirm = this._pScene.getButton("confirm");
         this._pClose.AddFakedTouchable();
         var _loc5_:Vec2F;
         (_loc5_ = this._pDialog.getPosition()).y = 0;
         _loc5_.x -= _loc1_.x;
         _loc5_.y -= _loc1_.y;
         _loc5_.x += _loc3_.x;
         _loc5_.y += _loc3_.y;
         this._pDialog.setPosition(_loc5_);
         _loc5_ = this._pClose.getPosition();
         _loc5_.x -= _loc1_.x;
         _loc5_.y -= _loc1_.y;
         _loc5_.x += _loc3_.x;
         _loc5_.y += _loc3_.y;
         this._pClose.setPosition(_loc5_);
         _loc5_ = this._pConfirm.getPosition();
         _loc5_.x -= _loc1_.x;
         _loc5_.y -= _loc1_.y;
         _loc5_.x += _loc3_.x;
         _loc5_.y += _loc3_.y;
         this._pConfirm.setPosition(_loc5_);
         this._vTextPos = new Vec2F(this._pScene.getRectangle("text").getPosition().x,this._pScene.getRectangle("text").getPosition().y);
         this._vTextPos.x -= _loc1_.x;
         this._vTextPos.y -= _loc1_.y;
         this._vTextPos.x += _loc3_.x;
         this._vTextPos.y += _loc3_.y;
         this._pTweener = new cTweener();
         this.addChild(this._pScene);
         this._tf1 = new TextField(320,400,"",GameRes.get()._pArialUnicode32,32,16777215);
         this._tf1.hAlign = HAlign.LEFT;
         this._tf1.vAlign = VAlign.TOP;
         this._tf1.touchable = false;
         this._tf1.autoScale = true;
         this._tf1.x = this._vTextPos.x;
         this._tf1.y = this._vTextPos.y;
         this.addChild(this._tf1);
         this._tf2 = new TextField(320,200,"",GameRes.get()._pArialUnicode32,32,16777215);
         this._tf2.alignPivot();
         this._tf2.hAlign = HAlign.CENTER;
         this._tf2.vAlign = VAlign.CENTER;
         this._tf2.touchable = false;
         this._tf2.autoScale = true;
         this._tf2.x = this._pConfirm.x;
         this._tf2.y = this._pConfirm.y;
         this.addChild(this._tf2);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._tf2,true);
         this.removeChild(this._tf1,true);
         this._tf2 = null;
         this._tf1 = null;
         this.removeChild(this._pScene);
         this._pTweener.dispose();
         this._pTweener = null;
         this._pScene.dispose();
         this._pScene = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc5_:GlaMsg = null;
         var _loc2_:String = GameWorld.get().getLanguage().getString("charselect_unlock");
         var _loc3_:String = Util.getFormattedNumber(GameWorld.get().getUnlockCharCost());
         _loc2_ = _loc2_.replace("$(STUDS)",_loc3_);
         this._tf1.text = _loc2_;
         this._tf1.x = this._vTextPos.x;
         this._tf1.y = this._vTextPos.y;
         this._tf1.alpha = this._fAlpha;
         this._tf2.text = GameWorld.get().getLanguage().getString("charselect_unlock_confirm");
         this._tf2.alpha = this._fAlpha * this._fConfirmAlpha;
         this._pClose.visible = false;
         this.touchable = _bActive;
         this._pTweener.tick(param1.getTime().dt);
         this._pDialog.setAlpha(uint(255 * this._fAlpha));
         this._pClose.setAlpha(uint(255 * this._fAlpha));
         this._fConfirmAlpha = 0.5;
         var _loc4_:SaveData;
         if((_loc4_ = GameWorld.get().getSaveData()).getStudsCollected() >= GameWorld.get().getUnlockCharCost())
         {
            this._fConfirmAlpha = 1;
         }
         this._pConfirm.setAlpha(uint(255 * this._fAlpha * this._fConfirmAlpha));
         if(!_bActive)
         {
            return;
         }
         this._pScene.update();
         while(this._pScene.hasMsg())
         {
            if((_loc5_ = this._pScene.popMsg()).getText() == "confirm")
            {
               if(_loc4_.getStudsCollected() >= GameWorld.get().getUnlockCharCost())
               {
                  (getWorldObj() as MainMenu).gotoCharacterSelect();
                  (getWorldObj() as MainMenu).getCharacterSelect().selectLastSelectedForUnlock();
                  _loc4_.subtractFromStudsCollected(GameWorld.get().getUnlockCharCost());
               }
            }
            else if(_loc5_.getText() == "close")
            {
               (getWorldObj() as MainMenu).gotoCharacterSelect();
               (getWorldObj() as MainMenu).getCharacterSelect().selectLastSelected();
            }
         }
      }
      
      override public function show() : void
      {
         this._pTweener.addTween(this,"unlockAlpha","_fAlpha",0,1,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"unlockScale","_fScale",0.5,1,0.5,0,cTweener.CUBIC);
         _bActive = true;
      }
      
      override public function hide() : void
      {
         this._pTweener.addTween(this,"unlockAlpha","_fAlpha",1,0,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"unlockScale","_fScale",1,0.5,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         this._pTweener.reset();
         this._fAlpha = 1;
         this._fScale = 1;
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         this._pTweener.reset();
         this._fAlpha = 0;
         this._fScale = 0.5;
         _bActive = false;
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fAlpha > 0)
         {
            return true;
         }
         return false;
      }
   }
}
