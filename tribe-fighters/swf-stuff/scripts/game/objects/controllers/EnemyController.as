package game.objects.controllers
{
   import game.objects.enemies.Enemy;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   import zufflin.world2D.Component2;
   
   public class EnemyController extends Component2
   {
       
      
      public var _pEnemy:Enemy;
      
      public function EnemyController(param1:Enemy)
      {
         super();
         this._pEnemy = param1;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:WorldLayer = this.getLayer();
         if(_loc2_ && _loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         this.specificUpdate(param1);
      }
      
      public function specificUpdate(param1:EventUpdate) : void
      {
      }
      
      public function specificContact(param1:EventContact2) : void
      {
      }
   }
}
