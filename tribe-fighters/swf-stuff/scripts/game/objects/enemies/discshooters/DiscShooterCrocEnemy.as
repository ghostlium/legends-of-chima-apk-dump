package game.objects.enemies.discshooters
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.controllers.DiscShooterController;
   import game.objects.guns.DiscShooterGun;
   import util.Vec2F;
   
   public class DiscShooterCrocEnemy extends DiscShooterEnemy
   {
       
      
      public function DiscShooterCrocEnemy(param1:int, param2:Vec2F)
      {
         super(param1,param2,1,3,GameRes.get()._pFireDiscShooterCharSet,"enemy_croc_discshooter");
         _pController = new DiscShooterController(this);
         addComponent(_pController);
         if(_bHasGun)
         {
            _pGun = new DiscShooterGun(param1,_gunPosition);
            addComponent(_pGun);
         }
         setClassType(GameConsts.eChimaNoClass);
         _bSpawnFootprints = false;
      }
   }
}
