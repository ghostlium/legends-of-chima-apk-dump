package game.objects.events
{
   import starling.events.Event;
   
   public class EventShowTutorial extends Event
   {
      
      public static const EVENT_SHOW_TUTORIAL:String = "EVENT_SHOW_TUTORIAL";
       
      
      public function EventShowTutorial(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
   }
}
