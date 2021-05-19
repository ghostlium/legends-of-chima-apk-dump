package game.objects.events
{
   import starling.events.Event;
   
   public class EventPlayerDied extends Event
   {
      
      public static const EVENT_PLAYER_DIED:String = "EVENT_PLAYER_DIED";
       
      
      public function EventPlayerDied(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
   }
}
