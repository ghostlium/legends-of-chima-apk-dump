package game.objects.events
{
   import starling.events.Event;
   
   public class EventGameStarted extends Event
   {
      
      public static const EVENT_GAME_STARTED:String = "EVENT_GAME_STARTED";
       
      
      public function EventGameStarted(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
   }
}
