package game.objects.events
{
   import starling.events.Event;
   
   public class EventPowerUpCollected extends Event
   {
      
      public static const EVENT_POWERUP_COLLECTED:String = "EVENT_POWERUP_COLLECTED";
       
      
      public var _name:String;
      
      public function EventPowerUpCollected(param1:String, param2:Boolean, param3:String)
      {
         this._name = param3;
         super(param1,param2);
      }
      
      public function getName() : String
      {
         return this._name;
      }
   }
}
