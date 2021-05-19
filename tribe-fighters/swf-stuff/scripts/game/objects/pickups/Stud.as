package game.objects.pickups
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.Player;
   import game.objects.events.EventStudCollected;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.math.AABox2f;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   
   public class Stud extends Pickup
   {
      
      public static const STUD_NORMAL:int = 0;
      
      public static const STUD_PICKED_UP:int = 1;
      
      public static const kfStudMinLerpRate:Number = 3;
      
      public static const kfStudMaxLerpRate:Number = 6;
      
      public static const kfStudMaxPickupSpeed:Number = 1.5;
      
      public static const kfStudMinPickupSpeed:Number = 0.75;
       
      
      public var _studState:int;
      
      public var _uValue:uint;
      
      public var _vVelocity:Vec2F;
      
      public var _fLerpRate:Number;
      
      public var _fPickupProgress:Number;
      
      public var _fPickupSpeed:Number;
      
      public var _vPickupStart:Vec2F;
      
      public var _vPickupEnd:Vec2F;
      
      public var _fScaleStart:Number;
      
      public var _fScaleEnd:Number;
      
      public function Stud(param1:int, param2:uint, param3:Vec2F, param4:Vec2F, param5:String)
      {
         this._vPickupStart = new Vec2F();
         this._vPickupEnd = new Vec2F();
         super(param1,param3,param5);
         this._studState = STUD_NORMAL;
         this._uValue = param2;
         this._vVelocity = new Vec2F(param4.x,param4.y);
         this._fLerpRate = Random.RandomFloatRangeUniform(kfStudMinLerpRate,kfStudMaxLerpRate);
         setScaleF(0.67);
         _pAnims[CHAR_ANIM_STATIC].setFrame(Random.RandomNumberRange(0,10000) % _pAnims[CHAR_ANIM_STATIC].getNumFrames());
         _pAnims[CHAR_ANIM_STATIC].play(true,1);
         setEnableShadow(false);
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Vec2F = null;
         var _loc3_:AABox2f = null;
         var _loc4_:Vec2F = null;
         var _loc5_:Number = NaN;
         switch(this._studState)
         {
            case STUD_NORMAL:
               _loc2_ = getPosition();
               _loc2_.x += this._vVelocity.x * param1.getTime().dt;
               _loc2_.y += this._vVelocity.y * param1.getTime().dt;
               _loc2_.y += GameWorld.get().getGroundSpeed() * param1.getTime().dt;
               setPosition(_loc2_);
               this._vVelocity.x = MathsHelper.Lerp(this._vVelocity.x,0,this._fLerpRate * param1.getTime().dt);
               this._vVelocity.y = MathsHelper.Lerp(this._vVelocity.y,0,this._fLerpRate * param1.getTime().dt);
               if(_loc2_.y > LegoChima.Instance().zGetScreenHeight())
               {
                  _loc3_ = _pAnims[CHAR_ANIM_STATIC].getLocalBounds();
                  _loc3_.translate(getPosition());
                  if(_loc3_.min.y > LegoChima.Instance().zGetScreenHeight())
                  {
                     deleteThis();
                  }
               }
               break;
            case STUD_PICKED_UP:
               this._fPickupProgress += this._fPickupSpeed * param1.getTime().dt;
               if(this._fPickupProgress >= 1)
               {
                  GameWorld.get().getHUD().getScore().addStuds(this._uValue);
                  Main.Instance().m_app.dispatchEvent(new EventStudCollected(EventStudCollected.EVENT_STUD_COLLECTED,false,this._uValue));
                  deleteThis();
               }
               else
               {
                  this._vPickupStart.y += GameWorld.get().getGroundSpeed() * param1.getTime().dt;
                  (_loc4_ = new Vec2F()).x = MathsHelper.Lerp(this._vPickupStart.x,this._vPickupEnd.x,this._fPickupProgress);
                  _loc4_.y = MathsHelper.Lerp(this._vPickupStart.y,this._vPickupEnd.y,this._fPickupProgress);
                  setPosition(_loc4_);
                  _loc5_ = MathsHelper.Lerp(this._fScaleStart,this._fScaleEnd,this._fPickupProgress);
                  setScaleF(_loc5_);
               }
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         if(param1.getOtherObject() is Player && this._studState != STUD_PICKED_UP)
         {
            this.pickupSound();
            this._studState = STUD_PICKED_UP;
            this._vPickupStart.x = getPosition().x;
            this._vPickupStart.y = getPosition().y;
            this._vPickupEnd.x = GameWorld.get().getHUD().getScore().getStudPos().x;
            this._vPickupEnd.y = GameWorld.get().getHUD().getScore().getStudPos().y;
            this._fScaleStart = getScale().x;
            this._fScaleEnd = GameWorld.get().getHUD().getScore().getStudScale();
            this._fPickupProgress = 0;
            this._fPickupSpeed = Random.RandomFloatRangeUniform(kfStudMinPickupSpeed,kfStudMaxPickupSpeed);
            _bAutoDepth = false;
            setDepth(GameConsts.DEPTH_STUDS_PICKED_UP);
         }
      }
      
      public function pickupSound() : void
      {
         playSfxExt(GameRes.get()._pStudCollectSounds.rand_element(),0,1,1,false);
         playSfxExt(GameRes.get()._pCoinSound,0,1,1,false);
      }
   }
}
