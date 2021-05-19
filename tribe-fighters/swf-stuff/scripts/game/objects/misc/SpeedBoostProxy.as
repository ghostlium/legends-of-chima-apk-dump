package game.objects.misc
{
   import game.GameWorld;
   import game.objects.GameObject;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   
   public class SpeedBoostProxy extends GameObject
   {
      
      public static const kfLife:Number = 10;
       
      
      public var _fTimer:Number;
      
      public function SpeedBoostProxy()
      {
         super();
         this._fTimer = 0;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         GameWorld.get().getBackground().activateSpeedBoost();
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
         this._fTimer += param1.getTime().dt;
         if(this._fTimer >= kfLife)
         {
            GameWorld.get().getBackground().deactivateSpeedBoost();
            deleteThis();
         }
      }
   }
}
