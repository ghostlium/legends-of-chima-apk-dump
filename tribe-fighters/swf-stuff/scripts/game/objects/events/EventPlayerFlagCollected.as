package game.objects.events
{
   import starling.events.Event;
   
   public class EventPlayerFlagCollected extends Event
   {
      
      public static const EVENT_PLAYER_FLAG_COLLECTED:String = "EVENT_PLAYER_FLAG_COLLECTED";
       
      
      public function EventPlayerFlagCollected(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
   }
}
