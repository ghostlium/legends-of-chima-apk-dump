package game.objects.events
{
   import starling.events.Event;
   
   public class EventPlayerHealthChanged extends Event
   {
      
      public static const EVENT_PLAYER_HEALTH_CHANGED:String = "EVENT_PLAYER_HEALTH_CHANGED";
       
      
      public var _fHealth:Number;
      
      public function EventPlayerHealthChanged(param1:String, param2:Boolean, param3:Number)
      {
         this._fHealth = param3;
         super(param1,param2);
      }
      
      public function getHealth() : Number
      {
         return this._fHealth;
      }
   }
}
