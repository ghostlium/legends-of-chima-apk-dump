package game.objects.enemies
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.controllers.MageEnemyController;
   import game.objects.guns.DefaultEnemyGun;
   import util.Vec2F;
   
   public class MageSaberEnemy extends Enemy
   {
       
      
      public function MageSaberEnemy(param1:int, param2:Vec2F)
      {
         super(param1,param2,1,3,GameRes.get()._pIceEnemiesCharSet,"enemy_saber_mage");
         _pController = new MageEnemyController(this);
         (_pController as MageEnemyController).setFireOnRunFrame(4);
         (_pController as MageEnemyController).setFireOnStandFrame(4);
         addComponent(_pController);
         if(_bHasGun)
         {
            _pGun = new DefaultEnemyGun(param1,_gunPosition);
            addComponent(_pGun);
         }
         setClassType(GameConsts.eChimaMageClass);
         setClassStr("mage");
         setTribeStr("saber");
         setEnableShadow(true);
      }
   }
}
