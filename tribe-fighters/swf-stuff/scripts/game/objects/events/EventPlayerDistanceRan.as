package game.objects.events
{
   import starling.events.Event;
   
   public class EventPlayerDistanceRan extends Event
   {
      
      public static const EVENT_PLAYER_DISTANCE_RAN:String = "EVENT_PLAYER_DISTANCE_RAN";
       
      
      public var _uDistance:uint;
      
      public var _uDelta:uint;
      
      public function EventPlayerDistanceRan(param1:String, param2:Boolean, param3:uint, param4:uint)
      {
         this._uDistance = param3;
         this._uDelta = param4;
         super(param1,param2);
      }
      
      public function getDistance() : uint
      {
         return this._uDistance;
      }
      
      public function getDelta() : uint
      {
         return this._uDelta;
      }
   }
}
