package game.objects.ui.hud
{
   import game.objects.ui.CustomBorder;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import zufflin.world.EventUpdate;
   
   public class HUDDamageFlash extends UIComponent
   {
      
      public static const kfInnerDistanceMult:Number = 0.1;
       
      
      public var _fFadeAlpha:Number;
      
      public var _fCycle:Number;
      
      public var _fAlpha:Number;
      
      public var _pTweener:cTweener;
      
      public var _pCycleTweener:cTweener;
      
      public var _cb:CustomBorder;
      
      public function HUDDamageFlash()
      {
         super();
         this._fFadeAlpha = 0;
         this._fCycle = 0;
         this._fAlpha = 0;
         this._pTweener = new cTweener();
         this._pCycleTweener = new cTweener();
         this._cb = new CustomBorder(768,1024,16711680,kfInnerDistanceMult * 768);
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
         this._pCycleTweener.dispose();
         this._pCycleTweener = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Number = param1.getTime().dt;
         this._pTweener.tick(_loc2_);
         this._pCycleTweener.tick(_loc2_);
         if(this._fAlpha <= 0)
         {
            this._cb.visible = false;
         }
         else
         {
            this._cb.visible = true;
         }
         this._cb.alpha = 0.6 * this._fFadeAlpha * this._fAlpha / 255;
      }
      
      public function doFlash() : void
      {
         this._pCycleTweener.reset();
         this._pCycleTweener.addTween(this,"damagealpha","_fAlpha",0,255,0.1,0,cTweener.CIRC,cTweener.EASE_OUT);
         this._pCycleTweener.addTween(this,"damagealpha","_fAlpha",255,0,0.3,0.1,cTweener.LINEAR);
      }
      
      override public function show() : void
      {
         this._pTweener.reset();
         this._pTweener.addTween(this,"damageflashfade","_fFadeAlpha",this._fFadeAlpha,1,0.1,0,cTweener.LINEAR);
         _bActive = true;
      }
      
      override public function hide() : void
      {
         this._pTweener.reset();
         this._pTweener.addTween(this,"damageflashfade","_fFadeAlpha",this._fFadeAlpha,0,0.1,0,cTweener.LINEAR);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         this._pTweener.reset();
         this._fFadeAlpha = 1;
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         this._pTweener.reset();
         this._fFadeAlpha = 0;
         _bActive = false;
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
