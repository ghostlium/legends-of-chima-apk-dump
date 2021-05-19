package zufflin.world
{
   import starling.events.Event;
   import zufflin.core.DeltaTime;
   
   public class EventUpdate extends Event
   {
      
      public static const EVENT_UPDATE:String = "EVENT_UPDATE";
      
      public static var time:DeltaTime = new DeltaTime(0);
       
      
      public function EventUpdate(param1:String, param2:Boolean = false, param3:Number = 0)
      {
         super(param1,param2);
         time.set(param3);
      }
      
      public function getTime() : DeltaTime
      {
         return time;
      }
   }
}
