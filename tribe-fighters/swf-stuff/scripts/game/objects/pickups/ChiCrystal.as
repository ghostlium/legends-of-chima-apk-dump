package game.objects.pickups
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.Player;
   import game.objects.misc.PlayerMagnet;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.StateManager;
   import zufflin.math.AABox2f;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   
   public class ChiCrystal extends Pickup
   {
      
      public static const kfChiCrystalMinLerpRate:Number = 3;
      
      public static const kfChiCrystalMaxLerpRate:Number = 6;
      
      public static const kfChiCrystalAddCharge1:Number = 0.167;
      
      public static const kfChiCrystalAddCharge2:Number = 0.2;
      
      public static const kfChiCrystalAddCharge3:Number = 0.25;
      
      public static const kfChiCrystalAddCharge4:Number = 0.334;
      
      public static const kfPickupSpeed:Number = 3;
       
      
      public var _state:StateManager;
      
      public var _fDt:Number;
      
      public var _vVelocity:Vec2F;
      
      public var _fLerpRate:Number;
      
      public var _fPickupProgress:Number;
      
      public var _vStartPos:Vec2F;
      
      public var _vEndPos:Vec2F;
      
      public var _bPickedUp:Boolean;
      
      public function ChiCrystal(param1:int, param2:Vec2F, param3:Vec2F)
      {
         super(param1,param2,"chi_crystal");
         this._vVelocity = new Vec2F(param3.x,param3.y);
         this._fLerpRate = Random.RandomFloatRangeUniform(kfChiCrystalMinLerpRate,kfChiCrystalMaxLerpRate);
         this._fPickupProgress = 0;
         this._vStartPos = new Vec2F();
         this._vEndPos = new Vec2F();
         setScaleF(0.8);
         addComponent(new PlayerMagnet());
         this._bPickedUp = false;
         this._state = new StateManager();
         this._state.setOwner(this);
         this._state.gotoState(this.StateNormal);
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._fDt = param1.getTime().dt;
         this._state.update();
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         if(param1.getOtherObject() is Player && !this._bPickedUp)
         {
            this._bPickedUp = true;
            this._state.gotoState(this.StatePickedUp);
         }
      }
      
      public function StateNormal(param1:int, param2:int) : uint
      {
         var _loc3_:Vec2F = null;
         var _loc4_:AABox2f = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               break;
            case StateManager.Z_ACTION_UPDATE:
               _loc3_ = getPosition();
               _loc3_.x += this._vVelocity.x * this._fDt;
               _loc3_.y += this._vVelocity.y * this._fDt;
               _loc3_.y += GameWorld.get().getGroundSpeed() * this._fDt;
               setPosition(_loc3_);
               this._vVelocity.x = MathsHelper.Lerp(this._vVelocity.x,0,this._fLerpRate * this._fDt);
               this._vVelocity.y = MathsHelper.Lerp(this._vVelocity.y,0,this._fLerpRate * this._fDt);
               (_loc4_ = _pAnims[CHAR_ANIM_STATIC].getLocalBounds()).translate(getPosition());
               if(_loc4_.min.y > LegoChima.Instance().zGetScreenHeight())
               {
                  deleteThis();
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StatePickedUp(param1:int, param2:int) : uint
      {
         var _loc3_:Player = null;
         var _loc4_:Number = NaN;
         var _loc5_:Vec2F = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._fPickupProgress = 0;
               this._vStartPos.x = getPosition().x;
               this._vStartPos.y = getPosition().y;
               this._vEndPos.x = GameWorld.get().getHUD().getChimaButton().getButtonPosition().x;
               this._vEndPos.y = GameWorld.get().getHUD().getChimaButton().getButtonPosition().y;
               playSfxExt(GameRes.get()._pChiCrystalSound,0,1,1,false);
               _bAutoDepth = false;
               setDepth(GameConsts.DEPTH_STUDS_PICKED_UP);
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._fPickupProgress += kfPickupSpeed * this._fDt;
               if(this._fPickupProgress >= 1)
               {
                  _loc3_ = GameWorld.get().getPlayer();
                  if(_loc3_ != null)
                  {
                     _loc4_ = 0;
                     if(_loc3_.isChiUpgradeActive(2))
                     {
                        _loc4_ = kfChiCrystalAddCharge4;
                     }
                     else if(_loc3_.isChiUpgradeActive(1))
                     {
                        _loc4_ = kfChiCrystalAddCharge3;
                     }
                     else if(_loc3_.isChiUpgradeActive(0))
                     {
                        _loc4_ = kfChiCrystalAddCharge2;
                     }
                     else
                     {
                        _loc4_ = kfChiCrystalAddCharge1;
                     }
                     GameWorld.get().getHUD().getChimaButton().addCharge(_loc4_);
                  }
                  deleteThis();
               }
               else
               {
                  this._vStartPos.y += GameWorld.get().getGroundSpeed() * this._fDt;
                  (_loc5_ = new Vec2F()).x = MathsHelper.Lerp(this._vStartPos.x,this._vEndPos.x,this._fPickupProgress);
                  _loc5_.y = MathsHelper.Lerp(this._vStartPos.y,this._vEndPos.y,this._fPickupProgress);
                  setPosition(_loc5_);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
   }
}
