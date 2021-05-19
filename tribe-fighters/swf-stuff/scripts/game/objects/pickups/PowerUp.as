package game.objects.pickups
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.Player;
   import game.objects.events.EventPowerUpCollected;
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.math.AABox2f;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   
   public class PowerUp extends Pickup
   {
      
      public static const kfTimerSpeed:Number = 3;
      
      public static const kfIndicatorTimerSpeed:Number = 1;
      
      public static const kfIndicatorMaxScale:Number = 3;
       
      
      public var _fTimer:Number;
      
      public var _fIndicatorTimer:Number;
      
      public var _bPickedUp:Boolean;
      
      public function PowerUp(param1:int, param2:Vec2F, param3:String)
      {
         super(param1,param2,param3);
         this._fTimer = 0;
         this._fIndicatorTimer = 0;
         this._bPickedUp = false;
         setEnableShadow(false);
      }
      
      public function activate() : void
      {
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:AABox2f = null;
         this._fTimer += kfTimerSpeed * param1.getTime().dt;
         if(this._fTimer >= 1)
         {
            this._fTimer = this._fTimer - 1;
         }
         var _loc2_:uint = uint(255 * Math.sin(this._fTimer * Math.PI) * Math.sin(this._fTimer * Math.PI));
         _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].getController().getSprite("highlight").setAlpha(_loc2_);
         var _loc3_:Vec2F = getPosition();
         _loc3_.y += GameWorld.get().getGroundSpeed() * param1.getTime().dt;
         setPosition(_loc3_);
         if(this._bPickedUp)
         {
            this._fIndicatorTimer += kfIndicatorTimerSpeed * param1.getTime().dt;
            if(this._fIndicatorTimer >= 1)
            {
               deleteThis();
            }
            else
            {
               setScaleF(1 + this._fIndicatorTimer * kfIndicatorMaxScale);
               if(this._fIndicatorTimer > 0.8)
               {
                  _loc4_ = 1 - (this._fIndicatorTimer - 0.8) * 5;
                  _pAnims[CHAR_ANIM_STATIC].setColor(new RGBA(255,255,255,_loc4_ * 255));
               }
            }
         }
         else
         {
            (_loc5_ = _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].getLocalBounds()).translate(getPosition());
            if(_loc5_.min.y > LegoChima.Instance().zGetScreenHeight())
            {
               deleteThis();
            }
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         if(!this._bPickedUp && param1.getOtherObject() is Player)
         {
            playSfxExt(GameRes.get()._pPickedUpPowerUp,0,1,1,false);
            _loc2_ = _name.search("_");
            if(_loc2_ < 0)
            {
               _loc2_ = _name.length;
            }
            _loc3_ = _name.slice(0,_loc2_);
            Main.Instance().m_app.dispatchEvent(new EventPowerUpCollected(EventPowerUpCollected.EVENT_POWERUP_COLLECTED,false,_loc3_));
            this.activate();
            this._bPickedUp = true;
            this._fIndicatorTimer = 0;
            setDepthOffset(GameConsts.DEPTH_OFFSET_PICKUP_INDICATOR);
         }
      }
   }
}
