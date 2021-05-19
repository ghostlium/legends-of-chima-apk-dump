package game.objects.enemies.discshooters
{
   import game.objects.EnemyManager;
   import game.objects.enemies.Enemy;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   
   public class DiscShooterEnemy extends Enemy
   {
       
      
      public function DiscShooterEnemy(param1:int, param2:Vec2F, param3:Number, param4:Number, param5:GlaSet, param6:String)
      {
         super(param1,param2,param3,param4,param5,param6);
         _bSpawnFootprints = false;
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
   }
}
