package game.objects.enemies.additionals
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.controllers.WarriorEnemyController;
   import game.objects.enemies.Enemy;
   import game.objects.guns.DefaultEnemyGun;
   import util.Vec2F;
   
   public class WarriorFireGorillaEnemy extends Enemy
   {
       
      
      public function WarriorFireGorillaEnemy(param1:int, param2:Vec2F)
      {
         super(param1,param2,1,3,GameRes.get()._pFireAdditionalsCharSet,"enemy_firegorilla_warrior");
         _pController = new WarriorEnemyController(this);
         (_pController as WarriorEnemyController).setFireOnRunFrame(11);
         addComponent(_pController);
         if(_bHasGun)
         {
            _pGun = new DefaultEnemyGun(param1,_gunPosition);
            addComponent(_pGun);
         }
         setClassType(GameConsts.eChimaWarriorClass);
         setClassStr("warrior");
         setTribeStr("");
         setEnableShadow(true);
      }
   }
}
