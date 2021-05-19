package game.objects.events
{
   import starling.events.Event;
   
   public class EventChiPowerUsed extends Event
   {
      
      public static const EVENT_CHI_POWER_USED:String = "EVENT_CHI_POWER_USED";
       
      
      public function EventChiPowerUsed(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
   }
}
