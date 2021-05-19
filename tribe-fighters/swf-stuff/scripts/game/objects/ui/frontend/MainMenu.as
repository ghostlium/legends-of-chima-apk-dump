package game.objects.ui.frontend
{
   import game.objects.ui.UIComponent;
   import game.objects.ui.UIMenu;
   import util.SpriteExt;
   import zufflin.core.StateManager;
   import zufflin.world.EventUpdate;
   
   public class MainMenu extends UIMenu
   {
       
      
      public var _state:StateManager;
      
      public var _pFrame:MainMenuFrame;
      
      public var _pTitleScreen:MainMenuTitleScreen;
      
      public var _pOptions:MainMenuOptions;
      
      public var _pLanguage:MainMenuLangSelect;
      
      public var _pHelp:MainMenuHelp;
      
      public var _pCredits:MainMenuCredits;
      
      public var _pPrivacy:MainMenuPrivacy;
      
      public var _pTerms:MainMenuTerms;
      
      public var _pFlagSelect:MainMenuFlagSelect;
      
      public var _pCharSelect:MainMenuCharSelect;
      
      public var _pCharSelectUnlock:MainMenuCharSelectUnlock;
      
      public var _pUpgradeConfirm:MainMenuUpgradeConfirm;
      
      public function MainMenu()
      {
         super();
         this._state = new StateManager();
         this._state.setOwner(this);
         this._pFrame = new MainMenuFrame();
         addComponent(this._pFrame);
         this._pTitleScreen = new MainMenuTitleScreen();
         addComponent(this._pTitleScreen);
         this._pOptions = new MainMenuOptions();
         addComponent(this._pOptions);
         this._pLanguage = new MainMenuLangSelect();
         addComponent(this._pLanguage);
         this._pHelp = new MainMenuHelp();
         addComponent(this._pHelp);
         this._pCredits = new MainMenuCredits();
         addComponent(this._pCredits);
         this._pPrivacy = new MainMenuPrivacy();
         addComponent(this._pPrivacy);
         this._pTerms = new MainMenuTerms();
         addComponent(this._pTerms);
         this._pFlagSelect = new MainMenuFlagSelect();
         addComponent(this._pFlagSelect);
         this._pCharSelect = new MainMenuCharSelect();
         addComponent(this._pCharSelect);
         this._pCharSelectUnlock = new MainMenuCharSelectUnlock();
         addComponent(this._pCharSelectUnlock);
         this._pUpgradeConfirm = new MainMenuUpgradeConfirm();
         addComponent(this._pUpgradeConfirm);
         this.reset();
      }
      
      public function getTitleScreen() : MainMenuTitleScreen
      {
         return this._pTitleScreen;
      }
      
      public function getCharacterSelect() : MainMenuCharSelect
      {
         return this._pCharSelect;
      }
      
      public function getUpgradeConfirm() : MainMenuUpgradeConfirm
      {
         return this._pUpgradeConfirm;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._state.update();
      }
      
      public function gotoTitleScreen() : void
      {
         this._state.gotoState(this.StateTitleScreen);
      }
      
      public function gotoOptions() : void
      {
         this._state.gotoState(this.StateOptions);
      }
      
      public function gotoLangSelect() : void
      {
         this._state.gotoState(this.StateLangSelect);
      }
      
      public function gotoHelp() : void
      {
         this._state.gotoState(this.StateHelp);
      }
      
      public function gotoCredits() : void
      {
         this._state.gotoState(this.StateCredits);
      }
      
      public function gotoPrivacy() : void
      {
         this._state.gotoState(this.StatePrivacy);
      }
      
      public function gotoTerms() : void
      {
         this._state.gotoState(this.StateTerms);
      }
      
      public function gotoFlagSelect() : void
      {
         this._state.gotoState(this.StateFlagSelect);
      }
      
      public function gotoCharacterSelect() : void
      {
         this._state.gotoState(this.StateCharacterSelect);
      }
      
      public function gotoCharacterSelectUnlock() : void
      {
         this._state.gotoState(this.StateCharacterSelectUnlock);
      }
      
      public function gotoUpgradeConfirm() : void
      {
         this._state.gotoState(this.StateUpgradeConfirm);
      }
      
      public function gotoHidden() : void
      {
         this._state.gotoState(this.StateHidden);
      }
      
      public function StateTitleScreen(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pTitleScreen.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pTitleScreen.hide();
         }
         return 0;
      }
      
      public function StateOptions(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pOptions.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pOptions.hide();
         }
         return 0;
      }
      
      public function StateLangSelect(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pLanguage.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pLanguage.hide();
         }
         return 0;
      }
      
      public function StateHelp(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pHelp.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pHelp.hide();
         }
         return 0;
      }
      
      public function StateCredits(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pCredits.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pCredits.hide();
         }
         return 0;
      }
      
      public function StatePrivacy(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pPrivacy.show();
               this._pPrivacy.showAdditionals();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pPrivacy.hide();
               this._pPrivacy.hideAdditionals();
         }
         return 0;
      }
      
      public function StateTerms(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pTerms.show();
               this._pTerms.showAdditionals();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pTerms.hide();
               this._pTerms.hideAdditionals();
         }
         return 0;
      }
      
      public function StateFlagSelect(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pFlagSelect.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pFlagSelect.hide();
         }
         return 0;
      }
      
      public function StateCharacterSelect(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pCharSelect.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pCharSelect.hide();
         }
         return 0;
      }
      
      public function StateCharacterSelectUnlock(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pCharSelectUnlock.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pCharSelectUnlock.hide();
         }
         return 0;
      }
      
      public function StateUpgradeConfirm(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pUpgradeConfirm.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pUpgradeConfirm.hide();
         }
         return 0;
      }
      
      public function StateHidden(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pFrame.hide();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function reset() : void
      {
         var _loc3_:int = 0;
         var _loc1_:SpriteExt = this.getComponents_Layer();
         var _loc2_:int = _loc1_.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc1_.getChildAt(_loc3_) is UIComponent)
            {
               (_loc1_.getChildAt(_loc3_) as UIComponent).reset();
            }
            _loc3_++;
         }
         this._pFrame.show();
         this._pTitleScreen.show();
         this._pTitleScreen.slideLowerButtonsOn();
         this._pOptions.forceHide();
         this._pLanguage.forceHide();
         this._pHelp.forceHide();
         this._pCredits.forceHide();
         this._pPrivacy.forceHide();
         this._pTerms.forceHide();
         this._pFlagSelect.forceHide();
         this._pCharSelect.forceHide();
         this._pCharSelectUnlock.forceHide();
         this._pUpgradeConfirm.forceHide();
         this.gotoTitleScreen();
      }
   }
}
