package game.objects.ui.hud
{
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ui.UIComponent;
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.world.EventUpdate;
   
   public class HUDHealthBar extends UIComponent
   {
      
      public static const kfHealthBarLerpRate:Number = 12;
      
      public static const kfHealthBarFlashSpeed:Number = 3;
      
      public static const kfHealthBarAlphaSpeed:Number = 3;
      
      public static const kuMaxHearts:uint = 5;
       
      
      public var _pAnim:GlaControllerScene;
      
      public var _uNumHearts:uint;
      
      public var _activeFlash:String;
      
      public var _fHealth:Number;
      
      public var _fDisplayHealth:Number;
      
      public var _fFlashTimer:Number;
      
      public var _fFlashAlpha:Number;
      
      public function HUDHealthBar()
      {
         super();
         this._fHealth = 1;
         this._fDisplayHealth = 1;
         this._uNumHearts = 5;
         this._activeFlash = "flash0";
         this._fFlashTimer = 0;
         this._fFlashAlpha = 0;
         setSlideDir(eUISlideLeft);
         this._pAnim = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("hud_healthbar"));
         this.addChild(this._pAnim);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._pAnim);
         this._pAnim.dispose();
         this._pAnim = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:GlaControllerSprite = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(_bActive)
         {
            this._fFlashTimer += param1.getTime().dt * kfHealthBarFlashSpeed;
            if(this._fFlashTimer >= 1)
            {
               this._fFlashTimer = this._fFlashTimer - 1;
            }
            if(this._fHealth <= 1 / Number(this._uNumHearts))
            {
               this._fFlashAlpha += param1.getTime().dt * kfHealthBarAlphaSpeed;
               GameWorld.get().getHUD().getBorderGlow().gotoStateShow();
            }
            else
            {
               this._fFlashAlpha -= param1.getTime().dt * kfHealthBarAlphaSpeed;
               GameWorld.get().getHUD().getBorderGlow().gotoStateHide();
            }
            this._fFlashAlpha = MathsHelper.Clamp(this._fFlashAlpha,0,1);
            _loc2_ = 255 * this._fFlashAlpha * Math.sin(this._fFlashTimer * Math.PI) * Math.sin(this._fFlashTimer * Math.PI);
            this._pAnim.getSprite(this._activeFlash).setAlpha(uint(_loc2_));
            this._fDisplayHealth = MathsHelper.Lerp(this._fDisplayHealth,this._fHealth,param1.getTime().dt * kfHealthBarLerpRate);
            _loc3_ = 0;
            while(_loc3_ < this._uNumHearts)
            {
               _loc4_ = "heart" + _loc3_.toString();
               _loc5_ = this._pAnim.getSprite(_loc4_);
               _loc6_ = 1 / Number(this._uNumHearts);
               if(_loc5_)
               {
                  _loc7_ = (this._fDisplayHealth - _loc6_ * Number(_loc3_)) / _loc6_;
                  _loc7_ = MathsHelper.Clamp(_loc7_,0,1);
                  _loc5_.setScale(new Vec2F(_loc7_,_loc7_));
               }
               _loc3_++;
            }
         }
      }
      
      public function setNumHearts(param1:uint) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:GlaControllerSprite = null;
         this._pAnim.getSprite("flash0").setAlpha(0);
         this._pAnim.getSprite("flash1").setAlpha(0);
         this._pAnim.getSprite("flash2").setAlpha(0);
         switch(param1)
         {
            case 3:
               this._activeFlash = "flash2";
               this._pAnim.getSprite("bar0").setAlpha(0);
               this._pAnim.getSprite("bar1").setAlpha(0);
               this._pAnim.getSprite("bar2").setAlpha(255);
               break;
            case 4:
               this._activeFlash = "flash1";
               this._pAnim.getSprite("bar0").setAlpha(0);
               this._pAnim.getSprite("bar1").setAlpha(255);
               this._pAnim.getSprite("bar2").setAlpha(0);
               break;
            case 5:
            default:
               this._activeFlash = "flash0";
               this._pAnim.getSprite("bar0").setAlpha(255);
               this._pAnim.getSprite("bar1").setAlpha(0);
               this._pAnim.getSprite("bar2").setAlpha(0);
         }
         this._uNumHearts = param1;
         _loc2_ = 0;
         while(_loc2_ < kuMaxHearts)
         {
            _loc3_ = "heart" + _loc2_.toString();
            _loc4_ = this._pAnim.getSprite(_loc3_);
            if(_loc2_ < this._uNumHearts)
            {
               _loc4_.setScale(new Vec2F(1,1));
            }
            else
            {
               _loc4_.setScale(new Vec2F(0,0));
            }
            _loc2_++;
         }
      }
      
      public function setHealth(param1:Number) : void
      {
         this._fHealth = param1;
      }
   }
}
