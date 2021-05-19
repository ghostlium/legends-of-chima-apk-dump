package game.objects.guns
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.ChimaGameObject;
   import game.objects.bullets.Bullet;
   import game.objects.bullets.FireBullet;
   import game.objects.bullets.IceBullet;
   import game.objects.bullets.SwordFireBullet;
   import game.objects.bullets.SwordIceBullet;
   import game.objects.bullets.WandFireBullet;
   import game.objects.bullets.WandIceBullet;
   import util.Vec2F;
   import zufflin.world.WorldLayer;
   
   public class DefaultEnemyGun extends Gun
   {
      
      public static const kfDefaultEnemyBlasterBulletVel:Number = 500;
      
      public static const kfDefaultEnemyWandBulletVel:Number = 400;
      
      public static const kfDefaultEnemySwordBulletVel:Number = 500;
       
      
      public function DefaultEnemyGun(param1:int, param2:Vec2F)
      {
         super(param1,param2);
      }
      
      override public function fire() : void
      {
         var _loc1_:WorldLayer = getLayer();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:int = GameConsts.eEnemyBulletCollisionCat;
         var _loc3_:* = GameConsts.ePlayerCollisionCat | GameConsts.ePlayerBulletCollisionCat;
         var _loc4_:Bullet = null;
         var _loc5_:Vec2F = new Vec2F(getPosition().x,getPosition().y);
         var _loc6_:int = (getWorldObj() as ChimaGameObject).getClassType();
         switch(_loc6_)
         {
            case GameConsts.eChimaNoClass:
            case GameConsts.eChimaRangedClass:
               this.getWorldObj().playSfxExt(GameRes.get()._pBlasterShoot.rand_element(),0,1,1,false);
               switch(_side)
               {
                  case GameConsts.eFireChima:
                     _loc4_ = new FireBullet(_loc5_,new Vec2F(0,kfDefaultEnemyBlasterBulletVel),_loc2_,_loc3_);
                     gunMuzzleFlash(new Vec2F(0,kfDefaultEnemyBlasterBulletVel),true);
                     break;
                  case GameConsts.eIceChima:
                     _loc4_ = new IceBullet(_loc5_,new Vec2F(0,kfDefaultEnemyBlasterBulletVel),_loc2_,_loc3_);
                     gunMuzzleFlash(new Vec2F(0,kfDefaultEnemyBlasterBulletVel),false);
               }
               break;
            case GameConsts.eChimaMageClass:
               this.getWorldObj().playSfxExt(GameRes.get()._pMageShoot.rand_element(),0,1,1,false);
               switch(_side)
               {
                  case GameConsts.eFireChima:
                     _loc4_ = new WandFireBullet(_loc5_,new Vec2F(0,kfDefaultEnemyWandBulletVel),_loc2_,_loc3_);
                     wandMuzzleFlash(new Vec2F(0,kfDefaultEnemyWandBulletVel),true);
                     break;
                  case GameConsts.eIceChima:
                     _loc4_ = new WandIceBullet(_loc5_,new Vec2F(0,kfDefaultEnemyWandBulletVel),_loc2_,_loc3_);
                     wandMuzzleFlash(new Vec2F(0,kfDefaultEnemyWandBulletVel),false);
               }
               break;
            case GameConsts.eChimaWarriorClass:
               this.getWorldObj().playSfxExt(GameRes.get()._pSwordSwingingSounds.rand_element(),0,1,1,false);
               switch(_side)
               {
                  case GameConsts.eFireChima:
                     (_loc4_ = new SwordFireBullet(_loc5_,new Vec2F(0,kfDefaultEnemySwordBulletVel),_loc2_,_loc3_)).setSpecialEnabled(true);
                     swordMuzzleFlash(new Vec2F(0,kfDefaultEnemySwordBulletVel),true);
                     break;
                  case GameConsts.eIceChima:
                     (_loc4_ = new SwordIceBullet(_loc5_,new Vec2F(0,kfDefaultEnemySwordBulletVel),_loc2_,_loc3_)).setSpecialEnabled(true);
                     swordMuzzleFlash(new Vec2F(0,kfDefaultEnemySwordBulletVel),false);
               }
         }
         if(_loc4_ != null)
         {
            _loc1_.addObject(_loc4_);
         }
      }
   }
}
