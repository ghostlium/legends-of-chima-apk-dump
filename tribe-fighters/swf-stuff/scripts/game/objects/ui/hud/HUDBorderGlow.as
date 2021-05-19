package game.objects.ui.hud
{
   import game.objects.ui.CustomBorder;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import zufflin.core.StateManager;
   import zufflin.world.EventUpdate;
   
   public class HUDBorderGlow extends UIComponent
   {
      
      public static const kfInnerDistanceMult:Number = 0.1;
      
      public static const kfCycleSpeed:Number = 1;
       
      
      public var _state:StateManager;
      
      public var _fDt:Number;
      
      public var _fFadeAlpha:Number;
      
      public var _fCycle:Number;
      
      public var _pTweener:cTweener;
      
      public var _cb:CustomBorder;
      
      public function HUDBorderGlow()
      {
         super();
         this._state = new StateManager();
         this._fDt = 0;
         this._fFadeAlpha = 0;
         this._fCycle = 0;
         this._state.setOwner(this);
         this._pTweener = new cTweener();
         this.gotoStateForceHide();
         this._cb = new CustomBorder(768,1024,16711680,768 * kfInnerDistanceMult);
         this._cb.touchable = false;
         this._cb.visible = false;
         this.addChild(this._cb);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._cb,true);
         this._cb = null;
         this._pTweener.dispose();
         this._pTweener = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._fDt = param1.getTime().dt;
         this._state.update();
         this._pTweener.tick(this._fDt);
         this._fCycle += kfCycleSpeed * this._fDt;
         if(this._fCycle >= 1)
         {
            this._fCycle = this._fCycle - 1;
         }
         var _loc2_:Number = 0.6 * this._fFadeAlpha * (Math.sin(this._fCycle * Math.PI) * Math.sin(this._fCycle * Math.PI));
         if(_loc2_ <= 0)
         {
            this._cb.visible = false;
         }
         else
         {
            this._cb.visible = true;
         }
         this._cb.alpha = _loc2_;
      }
      
      public function gotoStateShow() : void
      {
         if(this._state.getCurState() != this.StateShow)
         {
            this._state.gotoState(this.StateShow);
         }
      }
      
      public function gotoStateHide() : void
      {
         if(this._state.getCurState() != this.StateHide)
         {
            this._state.gotoState(this.StateHide);
         }
      }
      
      public function gotoStateForceShow() : void
      {
         if(this._state.getCurState() != this.StateForceShow)
         {
            this._state.gotoState(this.StateForceShow);
         }
      }
      
      public function gotoStateForceHide() : void
      {
         if(this._state.getCurState() != this.StateForceHide)
         {
            this._state.gotoState(this.StateForceHide);
         }
      }
      
      public function StateShow(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pTweener.addTween(this,"cHUDBorderGlow::_fFadeAlpha","_fFadeAlpha",this._fFadeAlpha,1,1,0,cTweener.CUBIC);
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateHide(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pTweener.addTween(this,"cHUDBorderGlow::_fFadeAlpha","_fFadeAlpha",this._fFadeAlpha,0,1,0,cTweener.CUBIC);
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateForceShow(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pTweener.reset();
               this._fFadeAlpha = 1;
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateForceHide(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pTweener.reset();
               this._fFadeAlpha = 0;
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      override public function show() : void
      {
         this.gotoStateShow();
      }
      
      override public function hide() : void
      {
         this.gotoStateHide();
      }
      
      override public function forceShow() : void
      {
         this.gotoStateForceShow();
      }
      
      override public function forceHide() : void
      {
         this.gotoStateForceHide();
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fFadeAlpha > 0)
         {
            return true;
         }
         return false;
      }
   }
}
