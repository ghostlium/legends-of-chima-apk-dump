package game.objects.events
{
   import starling.events.Event;
   
   public class EventStudCollected extends Event
   {
      
      public static const EVENT_STUD_COLLECTED:String = "EVENT_STUD_COLLECTED";
       
      
      public var _uValue:uint;
      
      public function EventStudCollected(param1:String, param2:Boolean, param3:uint)
      {
         this._uValue = param3;
         super(param1,param2);
      }
      
      public function getValue() : uint
      {
         return this._uValue;
      }
   }
}
