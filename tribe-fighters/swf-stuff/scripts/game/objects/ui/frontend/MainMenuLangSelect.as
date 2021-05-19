package game.objects.ui.frontend
{
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.core.zSprite;
   import zufflin.world.EventUpdate;
   
   public class MainMenuLangSelect extends UIComponent
   {
      
      public static const NUM_LANGUAGE_FLAG_BUTTONS:int = 18;
      
      private static var names:Vector.<String> = new <String>["en","cs","da","de","es","fi","fr","hu","it","ja","ko","nl","no","pl","ru","sv","zh","pt"];
       
      
      public var _pScene:GlaControllerScene;
      
      public var _pFlagScene:GlaControllerScene;
      
      public var _pBack:GlaControllerButton;
      
      public var _pFlagButtons:Vector.<GlaControllerButton>;
      
      public var _fAlpha:Number;
      
      public var _pTweener:cTweener;
      
      public function MainMenuLangSelect()
      {
         var _loc2_:Vec2F = null;
         super();
         this._pFlagButtons = new Vector.<GlaControllerButton>(NUM_LANGUAGE_FLAG_BUTTONS,true);
         this._fAlpha = 0;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_language"));
         this._pScene.setPosition(new Vec2F());
         var _loc1_:Vec2F = this._pScene.getRectangle("screen_centre").getPosition();
         _loc2_ = this._pScene.getRectangle("screen_bottom_centre").getPosition();
         this._pBack = this._pScene.getButton("back_button");
         var _loc3_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc4_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc5_:Vec2F = this._pBack.getPosition();
         _loc5_.x -= _loc2_.x;
         _loc5_.y -= _loc2_.y;
         _loc5_.x += _loc4_.x;
         _loc5_.y += _loc4_.y;
         this._pBack.setPosition(_loc5_);
         this.setupFlagButtons(_loc1_,_loc3_);
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
      
      public function setupFlagButtons(param1:Vec2F, param2:Vec2F) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:zSprite = null;
         var _loc5_:Vec2F = null;
         this._pFlagScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_language_flags"));
         _loc3_ = 0;
         while(_loc3_ < NUM_LANGUAGE_FLAG_BUTTONS)
         {
            this._pFlagButtons[_loc3_] = this._pScene.findButton(names[_loc3_]);
            if(this._pFlagButtons[_loc3_])
            {
               _loc4_ = this._pFlagScene.getSprite(names[_loc3_]).getSprite();
               this._pFlagButtons[_loc3_].getScene().findSprite("flag").setSprite(_loc4_);
               this._pFlagButtons[_loc3_].getPressedScene().findSprite("flag").setSprite(_loc4_);
               _loc5_ = this._pFlagButtons[_loc3_].getPosition();
               _loc5_.x -= param1.x;
               _loc5_.y -= param1.y;
               _loc5_.x += param2.x;
               _loc5_.y += param2.y;
               this._pFlagButtons[_loc3_].setPosition(_loc5_);
            }
            _loc3_++;
         }
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:GlaMsg = null;
         this.touchable = _bActive;
         this._pTweener.tick(param1.getTime().dt);
         this._pBack.setAlpha(uint(255 * this._fAlpha));
         _loc2_ = 0;
         while(_loc2_ < NUM_LANGUAGE_FLAG_BUTTONS)
         {
            this._pFlagButtons[_loc2_].setAlpha(uint(255 * this._fAlpha));
            _loc2_++;
         }
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
               (getWorldObj() as MainMenu).gotoOptions();
            }
            else
            {
               this.processFlagButtonMsgs(_loc3_);
            }
         }
      }
      
      public function processFlagButtonMsgs(param1:GlaMsg) : void
      {
         var _loc2_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < NUM_LANGUAGE_FLAG_BUTTONS)
         {
            if(param1.getText() == names[_loc2_])
            {
               GameWorld.get().getLanguage().load(names[_loc2_]);
               GameWorld.get().getSaveData().setLanguageCode(names[_loc2_]);
               (getWorldObj() as MainMenu).gotoOptions();
            }
            _loc2_++;
         }
      }
      
      override public function show() : void
      {
         this._pTweener.addTween(this,"backButtonAlpha","_fAlpha",0,1,0.25,0,cTweener.LINEAR);
         _bActive = true;
      }
      
      override public function hide() : void
      {
         this._pTweener.addTween(this,"backButtonAlpha","_fAlpha",1,0,0.25,0,cTweener.LINEAR);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         var _loc1_:uint = 0;
         this._pTweener.reset();
         this._fAlpha = 1;
         this._pBack.setAlpha(255);
         _loc1_ = 0;
         while(_loc1_ < NUM_LANGUAGE_FLAG_BUTTONS)
         {
            this._pFlagButtons[_loc1_].setAlpha(255);
            _loc1_++;
         }
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         var _loc1_:uint = 0;
         this._pTweener.reset();
         this._fAlpha = 0;
         this._pBack.setAlpha(0);
         _loc1_ = 0;
         while(_loc1_ < NUM_LANGUAGE_FLAG_BUTTONS)
         {
            this._pFlagButtons[_loc1_].setAlpha(0);
            _loc1_++;
         }
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
