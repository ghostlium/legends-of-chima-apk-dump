package game.objects.events
{
   import starling.events.Event;
   
   public class EventPlayerFollowerDied extends Event
   {
      
      public static const EVENT_PLAYER_FOLLOWER_DIED:String = "EVENT_PLAYER_FOLLOWER_DIED";
       
      
      public function EventPlayerFollowerDied(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
   }
}
