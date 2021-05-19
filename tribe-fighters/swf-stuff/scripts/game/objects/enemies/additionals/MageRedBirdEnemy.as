package game.objects.enemies.additionals
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.controllers.FlyingEnemyController;
   import game.objects.guns.DefaultEnemyGun;
   import util.Vec2F;
   
   public class MageRedBirdEnemy extends FlyingEnemy
   {
       
      
      public function MageRedBirdEnemy(param1:int, param2:Vec2F)
      {
         super(param1,param2,1,3,GameRes.get()._pFireAdditionalsCharSet,"enemy_redbird_mage");
         _pController = new FlyingEnemyController(this);
         (_pController as FlyingEnemyController).setFireOnFrame(11);
         addComponent(_pController);
         if(_bHasGun)
         {
            _pGun = new DefaultEnemyGun(param1,_gunPosition);
            addComponent(_pGun);
         }
         setClassType(GameConsts.eChimaMageClass);
         setClassStr("mage");
         setTribeStr("");
         setDepthOffset(GameConsts.DEPTH_OFFSET_FLYING_ENEMIES);
         setShadowOffset(new Vec2F(20,-20));
         setEnableShadow(true);
      }
   }
}
