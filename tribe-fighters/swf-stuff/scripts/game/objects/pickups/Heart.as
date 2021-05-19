package game.objects.pickups
{
   import game.GameWorld;
   import game.objects.Player;
   import game.objects.misc.PlayerMagnet;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.math.AABox2f;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   
   public class Heart extends Pickup
   {
      
      public static const kfHeartMinLerpRate:Number = 3;
      
      public static const kfHeartMaxLerpRate:Number = 6;
       
      
      public var _vVelocity:Vec2F;
      
      public var _fLerpRate:Number;
      
      public function Heart(param1:int, param2:Vec2F, param3:Vec2F)
      {
         super(param1,param2,"heart");
         this._vVelocity = new Vec2F(param3.x,param3.y);
         this._fLerpRate = Random.RandomFloatRangeUniform(kfHeartMinLerpRate,kfHeartMaxLerpRate);
         setEnableShadow(false);
         addComponent(new PlayerMagnet());
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Vec2F = getPosition();
         _loc2_.x += this._vVelocity.x * param1.getTime().dt;
         _loc2_.y += this._vVelocity.y * param1.getTime().dt;
         _loc2_.y += GameWorld.get().getGroundSpeed() * param1.getTime().dt;
         setPosition(_loc2_);
         this._vVelocity.x = MathsHelper.Lerp(this._vVelocity.x,0,this._fLerpRate * param1.getTime().dt);
         this._vVelocity.y = MathsHelper.Lerp(this._vVelocity.y,0,this._fLerpRate * param1.getTime().dt);
         var _loc3_:AABox2f = _pAnims[CHAR_ANIM_STATIC].getLocalBounds();
         _loc3_.translate(getPosition());
         if(_loc3_.min.y > LegoChima.Instance().zGetScreenHeight())
         {
            deleteThis();
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         if(param1.getOtherObject() is Player)
         {
            GameWorld.get().getPlayer().addHealth(1);
            deleteThis();
         }
      }
   }
}
