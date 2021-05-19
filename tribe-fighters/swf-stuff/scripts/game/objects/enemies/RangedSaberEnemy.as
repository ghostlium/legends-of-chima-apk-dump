package game.objects.enemies
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.controllers.RangedEnemyController;
   import game.objects.guns.DefaultEnemyGun;
   import util.Vec2F;
   
   public class RangedSaberEnemy extends Enemy
   {
       
      
      public function RangedSaberEnemy(param1:int, param2:Vec2F)
      {
         super(param1,param2,1,3,GameRes.get()._pIceEnemiesCharSet,"enemy_saber_ranged");
         _pController = new RangedEnemyController(this);
         (_pController as RangedEnemyController).setFireOnRunFrame(10);
         addComponent(_pController);
         if(_bHasGun)
         {
            _pGun = new DefaultEnemyGun(param1,_gunPosition);
            addComponent(_pGun);
         }
         setClassType(GameConsts.eChimaRangedClass);
         setClassStr("ranged");
         setTribeStr("saber");
         setEnableShadow(true);
      }
   }
}