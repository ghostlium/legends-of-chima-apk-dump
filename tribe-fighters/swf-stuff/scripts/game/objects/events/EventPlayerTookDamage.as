package game.objects.events
{
   import starling.events.Event;
   
   public class EventPlayerTookDamage extends Event
   {
      
      public static const EVENT_PLAYER_TOOK_DAMAGE:String = "EVENT_PLAYER_TOOK_DAMAGE";
       
      
      public var _fDamage:Number;
      
      public function EventPlayerTookDamage(param1:String, param2:Boolean, param3:Number)
      {
         this._fDamage = param3;
         super(param1,param2);
      }
      
      public function getDamage() : Number
      {
         return this._fDamage;
      }
   }
}
