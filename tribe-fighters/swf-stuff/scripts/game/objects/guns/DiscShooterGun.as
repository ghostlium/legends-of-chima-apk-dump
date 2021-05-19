package game.objects.guns
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.Player;
   import game.objects.bullets.Bullet;
   import game.objects.bullets.DiscFireBullet;
   import game.objects.bullets.DiscIceBullet;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.world.WorldLayer;
   
   public class DiscShooterGun extends Gun
   {
      
      public static const kfBulletVel:Number = 1000;
      
      public static const kfGunOffsetY:Number = 50;
      
      public static const kfMaxGunAngle:Number = 30;
       
      
      public function DiscShooterGun(param1:int, param2:Vec2F)
      {
         super(param1,param2);
      }
      
      override public function fire() : void
      {
         var _loc1_:WorldLayer = getLayer();
         if(_loc1_ == null)
         {
            trace("SCG: Disc shooter gun, no layer, no fire.");
            return;
         }
         var _loc2_:int = GameConsts.eEnemyBulletCollisionCat;
         var _loc3_:* = GameConsts.ePlayerCollisionCat | GameConsts.ePlayerBulletCollisionCat;
         var _loc4_:Bullet = null;
         var _loc5_:Vec2F = new Vec2F(getPosition().x,getPosition().y);
         var _loc6_:int = (getWorldObj() as ChimaGameObject).getClassType();
         var _loc7_:Number = this.getAngleToPlayer();
         var _loc8_:Vec2F;
         (_loc8_ = new Vec2F(0,kfGunOffsetY)).rotate(_loc7_);
         var _loc9_:Vec2F;
         (_loc9_ = new Vec2F(0,kfBulletVel)).rotate(_loc7_);
         getWorldObj().playSfxExt(GameRes.get()._pDiscShotSound,0,1,Random.RandomFloatRangeUniform(0.7,1.3),false);
         var _loc10_:Vec2F = new Vec2F(_loc5_.x + _loc8_.x,_loc5_.y + _loc8_.y);
         switch(_side)
         {
            case GameConsts.eFireChima:
               _loc4_ = new DiscFireBullet(_loc10_,_loc9_,_loc2_,_loc3_);
               discMuzzleFlash(_loc9_,true);
               break;
            case GameConsts.eIceChima:
               _loc4_ = new DiscIceBullet(_loc10_,_loc9_,_loc2_,_loc3_);
               discMuzzleFlash(_loc9_,false);
         }
         if(_loc4_ && _loc1_)
         {
            _loc1_.addObject(_loc4_);
         }
      }
      
      public function getAngleToPlayer() : Number
      {
         var _loc3_:Vec2F = null;
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         var _loc1_:Number = 0;
         var _loc2_:Player = GameWorld.get().getPlayer();
         if(_loc2_ != null)
         {
            _loc3_ = getPosition();
            _loc4_ = _loc2_.getPosition();
            if(_loc3_.y < _loc4_.y)
            {
               _loc5_ = new Vec2F(_loc4_.x - _loc3_.x,_loc4_.y - _loc3_.y);
               _loc1_ = MathsHelper.RadToDeg(_loc5_.getAngle()) - 180;
               _loc1_ = MathsHelper.Clamp(_loc1_,-0.5 * kfMaxGunAngle,0.5 * kfMaxGunAngle);
            }
         }
         return MathsHelper.DegToRad(_loc1_);
      }
   }
}
