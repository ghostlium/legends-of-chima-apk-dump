package game.objects.events
{
   import starling.events.Event;
   
   public class EventPlayerFollowerAdded extends Event
   {
      
      public static const EVENT_PLAYER_FOLLOWER_ADDED:String = "EVENT_PLAYER_FOLLOWER_ADDED";
       
      
      public function EventPlayerFollowerAdded(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
   }
}
