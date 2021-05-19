package game.objects.ui.frontend
{
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import game.GameRes;
   import game.GameWorld;
   import game.SaveData;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerToggleButton;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.core.MusicSystem;
   import zufflin.core.zSprite;
   import zufflin.world.EventUpdate;
   
   public class MainMenuOptions extends UIComponent
   {
       
      
      public var _pScene:GlaControllerScene;
      
      public var _pFlagScene:GlaControllerScene;
      
      public var _pMusic:GlaControllerToggleButton;
      
      public var _pSfx:GlaControllerToggleButton;
      
      public var _pLanguage:GlaControllerButton;
      
      public var _pBack:GlaControllerButton;
      
      public var _fToggleAlpha:Number;
      
      public var _fToggleScale:Number;
      
      public var _fBackAlpha:Number;
      
      public var _bUnsavedChanges:Boolean;
      
      public var _uCheatToggle:uint;
      
      public var _uCheatCount:uint;
      
      public var _pTweener:cTweener;
      
      public function MainMenuOptions()
      {
         var _loc5_:Vec2F = null;
         super();
         this._fToggleAlpha = 0;
         this._fToggleScale = 0;
         this._fBackAlpha = 0;
         this._bUnsavedChanges = false;
         this._uCheatToggle = 0;
         this._uCheatCount = 0;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_options"));
         this._pScene.setPosition(new Vec2F());
         this._pFlagScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_language_flags"));
         var _loc1_:Vec2F = this._pScene.getRectangle("screen_centre").getPosition();
         var _loc2_:Vec2F = this._pScene.getRectangle("screen_bottom_centre").getPosition();
         this._pMusic = this._pScene.getToggleButton("music_toggle");
         this._pSfx = this._pScene.getToggleButton("sfx_toggle");
         this._pLanguage = this._pScene.getButton("language_button");
         this._pBack = this._pScene.getButton("back_button");
         var _loc3_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc4_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),Number(LegoChima.Instance().zGetScreenHeight()));
         _loc5_ = this._pMusic.getPosition();
         _loc5_.x -= _loc1_.x;
         _loc5_.y -= _loc1_.y;
         _loc5_.x += _loc3_.x;
         _loc5_.y += _loc3_.y;
         this._pMusic.setPosition(_loc5_);
         _loc5_ = this._pSfx.getPosition();
         _loc5_.x -= _loc1_.x;
         _loc5_.y -= _loc1_.y;
         _loc5_.x += _loc3_.x;
         _loc5_.y += _loc3_.y;
         this._pSfx.setPosition(_loc5_);
         _loc5_ = this._pLanguage.getPosition();
         _loc5_.x -= _loc2_.x;
         _loc5_.y -= _loc2_.y;
         _loc5_.x += _loc4_.x;
         _loc5_.y += _loc4_.y;
         this._pLanguage.setPosition(_loc5_);
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
         this._pFlagScene.dispose();
         this._pFlagScene = null;
         this.removeChild(this._pScene);
         this._pTweener.dispose();
         this._pTweener = null;
         this._pScene.dispose();
         this._pScene = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:GlaMsg = null;
         this.touchable = _bActive;
         this._pTweener.tick(param1.getTime().dt);
         this._pMusic.setAlpha(uint(255 * this._fToggleAlpha));
         this._pMusic.setScale(new Vec2F(this._fToggleScale,this._fToggleScale));
         this._pSfx.setAlpha(uint(255 * this._fToggleAlpha));
         this._pSfx.setScale(new Vec2F(this._fToggleScale,this._fToggleScale));
         this._pLanguage.setAlpha(uint(255 * this._fToggleAlpha));
         this._pLanguage.setScale(new Vec2F(this._fToggleScale,this._fToggleScale));
         this._pBack.setAlpha(uint(255 * this._fBackAlpha));
         if(!_bActive)
         {
            return;
         }
         this._pScene.update();
         while(this._pScene.hasMsg())
         {
            _loc2_ = this._pScene.popMsg();
            if(_loc2_.getText() == "back")
            {
               (getWorldObj() as MainMenu).gotoTitleScreen();
            }
            else if(_loc2_.getText() == "music")
            {
               this._bUnsavedChanges = true;
               if(this._pMusic.isTicked())
               {
                  MusicSystem.getSingleton().setVolume(1);
               }
               else
               {
                  MusicSystem.getSingleton().setVolume(0);
               }
               if(this._uCheatToggle == 0)
               {
                  this._uCheatToggle = 1;
                  ++this._uCheatCount;
               }
               else
               {
                  this._uCheatToggle = 1;
               }
            }
            else if(_loc2_.getText() == "sfx")
            {
               this._bUnsavedChanges = true;
               if(this._pSfx.isTicked())
               {
                  SoundMixer.soundTransform = new SoundTransform(1);
               }
               else
               {
                  SoundMixer.soundTransform = new SoundTransform(0);
               }
               if(this._uCheatToggle == 1)
               {
                  this._uCheatToggle = 0;
                  ++this._uCheatCount;
               }
               else
               {
                  this._uCheatToggle = 0;
               }
            }
            else if(_loc2_.getText() == "language")
            {
               (getWorldObj() as MainMenu).gotoLangSelect();
            }
         }
         if(this._uCheatCount >= 6)
         {
            this._uCheatCount = 0;
         }
      }
      
      override public function show() : void
      {
         this._uCheatToggle = 0;
         this._uCheatCount = 0;
         this.loadOptions();
         this._pTweener.addTween(this,"optionsToggleAlpha","_fToggleAlpha",0,1,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"optionsToggleScale","_fToggleScale",0.5,1,0.5,0,cTweener.CUBIC);
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",0,1,0.25,0,cTweener.LINEAR);
         _bActive = true;
         this.updateLanguageButton();
      }
      
      override public function hide() : void
      {
         this.saveOptions();
         this._pTweener.addTween(this,"optionsToggleAlpha","_fToggleAlpha",1,0,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"optionsToggleScale","_fToggleScale",1,0.5,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",1,0,0.25,0,cTweener.LINEAR);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         this._uCheatToggle = 0;
         this._uCheatCount = 0;
         this.loadOptions();
         this._pTweener.reset();
         this._fToggleAlpha = 1;
         this._fToggleScale = 1;
         this._fBackAlpha = 1;
         this._pMusic.setAlpha(255);
         this._pMusic.setScale(new Vec2F(1,1));
         this._pSfx.setAlpha(255);
         this._pSfx.setScale(new Vec2F(1,1));
         this._pBack.setAlpha(255);
         _bActive = true;
         this.updateLanguageButton();
      }
      
      override public function forceHide() : void
      {
         this.saveOptions();
         this._pTweener.reset();
         this._fToggleAlpha = 0;
         this._fToggleScale = 0;
         this._fBackAlpha = 0;
         this._pMusic.setAlpha(0);
         this._pMusic.setScale(new Vec2F(0,0));
         this._pSfx.setAlpha(0);
         this._pSfx.setScale(new Vec2F(0,0));
         this._pBack.setAlpha(0);
         _bActive = false;
      }
      
      public function loadOptions() : void
      {
         var _loc1_:SaveData = GameWorld.get().getSaveData();
         this._pMusic.setTicked(_loc1_.getMusicEnabled());
         this._pSfx.setTicked(_loc1_.getSfxEnabled());
         this._bUnsavedChanges = false;
      }
      
      public function saveOptions() : void
      {
         var _loc1_:SaveData = null;
         if(this._bUnsavedChanges)
         {
            _loc1_ = GameWorld.get().getSaveData();
            _loc1_.setMusicEnabled(this._pMusic.isTicked());
            _loc1_.setSfxEnabled(this._pSfx.isTicked());
            GameWorld.get().getSaveData().save();
            this._bUnsavedChanges = false;
         }
      }
      
      public function updateLanguageButton() : void
      {
         var _loc1_:zSprite = this._pFlagScene.getSprite(GameWorld.get().getSaveData().getLanguageCode()).getSprite();
         this._pLanguage.getScene().getSprite("flag").setSprite(_loc1_);
         this._pLanguage.getPressedScene().getSprite("flag").setSprite(_loc1_);
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fToggleAlpha > 0 || this._fBackAlpha > 0)
         {
            return true;
         }
         return false;
      }
   }
}
