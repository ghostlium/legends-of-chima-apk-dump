package game.objects.events
{
   import game.objects.enemies.Enemy;
   import starling.events.Event;
   
   public class EventEnemySpawned extends Event
   {
      
      public static const EVENT_ENEMY_SPAWNED:String = "EVENT_ENEMY_SPAWNED";
       
      
      public var _pEnemy:Enemy;
      
      public function EventEnemySpawned(param1:String, param2:Boolean, param3:Enemy)
      {
         this._pEnemy = param3;
         super(param1,param2);
      }
      
      public function getEnemy() : Enemy
      {
         return this._pEnemy;
      }
   }
}
