package game.objects.guns
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.Player;
   import game.objects.bullets.Bullet;
   import game.objects.bullets.FireBullet;
   import game.objects.bullets.IceBullet;
   import game.objects.bullets.SwordFireBulletUp;
   import game.objects.bullets.SwordIceBulletUp;
   import game.objects.bullets.WandFireBullet;
   import game.objects.bullets.WandIceBullet;
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.world.WorldLayer;
   
   public class PlayerGun extends Gun
   {
      
      public static const kfPlayerBlasterBulletVelY:Number = -1000;
      
      public static const kfPlayerWandBulletVelY:Number = -400;
      
      public static const kfPlayerSwordBulletVelY:Number = -400;
      
      public static const kfPlayerBlasterSpecialAngle:Number = 20;
       
      
      public function PlayerGun(param1:int, param2:Vec2F)
      {
         super(param1,param2);
      }
      
      override public function fire() : void
      {
         var _loc7_:Player = null;
         var _loc1_:WorldLayer = getLayer();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:int = GameConsts.ePlayerBulletCollisionCat;
         var _loc3_:* = GameConsts.eEnemyCollisionCat | GameConsts.eEnemyBulletCollisionCat;
         var _loc4_:Bullet = null;
         var _loc5_:Vec2F = getPosition();
         var _loc6_:int = (getWorldObj() as ChimaGameObject).getClassType();
         switch(_loc6_)
         {
            case GameConsts.eChimaNoClass:
            case GameConsts.eChimaRangedClass:
               this.getWorldObj().playSfxExt(GameRes.get()._pBlasterShoot.rand_element(),0,1,1,false);
               switch(_side)
               {
                  case GameConsts.eFireChima:
                     _loc4_ = new FireBullet(_loc5_,new Vec2F(0,kfPlayerBlasterBulletVelY),_loc2_,_loc3_);
                     gunMuzzleFlash(new Vec2F(0,kfPlayerBlasterBulletVelY),true);
                     break;
                  case GameConsts.eIceChima:
                     _loc4_ = new IceBullet(_loc5_,new Vec2F(0,kfPlayerBlasterBulletVelY),_loc2_,_loc3_);
                     gunMuzzleFlash(new Vec2F(0,kfPlayerBlasterBulletVelY),false);
               }
               break;
            case GameConsts.eChimaMageClass:
               this.getWorldObj().playSfxExt(GameRes.get()._pMageShoot.rand_element(),0,1,1,false);
               switch(_side)
               {
                  case GameConsts.eFireChima:
                     _loc4_ = new WandFireBullet(_loc5_,new Vec2F(0,kfPlayerWandBulletVelY),_loc2_,_loc3_);
                     wandMuzzleFlash(new Vec2F(0,kfPlayerWandBulletVelY),true);
                     break;
                  case GameConsts.eIceChima:
                     _loc4_ = new WandIceBullet(_loc5_,new Vec2F(0,kfPlayerWandBulletVelY),_loc2_,_loc3_);
                     wandMuzzleFlash(new Vec2F(0,kfPlayerWandBulletVelY),false);
               }
               break;
            case GameConsts.eChimaWarriorClass:
               this.getWorldObj().playSfxExt(GameRes.get()._pSwordSwingingSounds.rand_element(),0,1,1,false);
               switch(_side)
               {
                  case GameConsts.eFireChima:
                     _loc4_ = new SwordFireBulletUp(_loc5_,new Vec2F(0,kfPlayerSwordBulletVelY),_loc2_,_loc3_);
                     swordMuzzleFlash(new Vec2F(0,kfPlayerSwordBulletVelY),true);
                     break;
                  case GameConsts.eIceChima:
                     _loc4_ = new SwordIceBulletUp(_loc5_,new Vec2F(0,kfPlayerSwordBulletVelY),_loc2_,_loc3_);
                     swordMuzzleFlash(new Vec2F(0,kfPlayerSwordBulletVelY),false);
               }
         }
         if(_loc4_ != null)
         {
            if(_loc7_ = GameWorld.get().getPlayer())
            {
               if(_loc7_.isWeaponUpgradeActive(0))
               {
                  _loc4_.setDamage(2);
               }
               if(_loc7_.isWeaponUpgradeActive(1))
               {
                  _loc4_.setSpecialEnabled(true);
               }
            }
            _loc4_.setFiredByPlayer(true);
            _loc1_.addObject(_loc4_);
            if(_loc4_.getSpecialEnabled() && _loc6_ == GameConsts.eChimaRangedClass)
            {
               this.doBlasterSpecial(_loc5_);
            }
         }
      }
      
      public function doBlasterSpecial(param1:Vec2F) : void
      {
         var _loc6_:uint = 0;
         var _loc2_:Bullet = null;
         var _loc3_:int = GameConsts.ePlayerBulletCollisionCat;
         var _loc4_:* = GameConsts.eEnemyCollisionCat | GameConsts.eEnemyBulletCollisionCat;
         var _loc5_:Number = kfPlayerBlasterSpecialAngle;
         var _loc7_:Vec2F = new Vec2F();
         _loc6_ = 0;
         while(_loc6_ < 2)
         {
            _loc7_.x = 0;
            _loc7_.y = kfPlayerBlasterBulletVelY;
            _loc7_.rotate(MathsHelper.DegToRad(_loc5_));
            switch(_side)
            {
               case GameConsts.eFireChima:
                  _loc2_ = new FireBullet(param1,_loc7_,_loc3_,_loc4_);
                  break;
               case GameConsts.eIceChima:
                  _loc2_ = new IceBullet(param1,_loc7_,_loc3_,_loc4_);
                  break;
            }
            _loc2_.setDamage(2);
            _loc2_.setFiredByPlayer(true);
            getLayer().addObject(_loc2_);
            _loc5_ *= -1;
            _loc6_++;
         }
      }
   }
}
