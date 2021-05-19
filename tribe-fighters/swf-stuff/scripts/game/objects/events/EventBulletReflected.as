package game.objects.events
{
   import starling.events.Event;
   
   public class EventBulletReflected extends Event
   {
      
      public static const EVENT_BULLET_REFLECTED:String = "EVENT_BULLET_REFLECTED";
       
      
      public function EventBulletReflected(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
   }
}
