package game.objects.enemies
{
   import game.GameRes;
   import game.objects.EnemyManager;
   import game.objects.controllers.EnvController;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   
   public class EnvEnemy extends Enemy
   {
       
      
      public function EnvEnemy(param1:int, param2:Vec2F, param3:GlaSet, param4:String)
      {
         super(param1,param2,1,2,param3,param4);
         _pController = new EnvController(this);
         addComponent(_pController);
         setEnableShadow(false);
         _bSpawnFootprints = false;
         _bDamagePlayerOnContact = false;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:AABox2f = getBounds();
         _loc2_.translate(getPosition());
         if(_loc2_.min.y > LegoChima.Instance().zGetScreenHeight())
         {
            if(_pOwner != null)
            {
               (_pOwner as EnemyManager).enemyDied(this,false);
            }
            deleteThis();
         }
      }
      
      override public function specificDie() : void
      {
         playSfxExt(GameRes.get()._pSmallSmash.rand_element(),0,1,1,false);
      }
      
      override public function specificTakeDamage(param1:Number) : void
      {
         if(_fHealth - param1 > 0)
         {
            playSfxExt(GameRes.get()._pImpactEnvSounds.rand_element(),0,1,1,false);
         }
      }
   }
}
