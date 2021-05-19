package game.objects.events
{
   import starling.events.Event;
   
   public class EventGameEnded extends Event
   {
      
      public static const EVENT_GAME_ENDED:String = "EVENT_GAME_ENDED";
       
      
      public var _uStudsCollected:uint;
      
      public function EventGameEnded(param1:String, param2:Boolean, param3:uint)
      {
         this._uStudsCollected = param3;
         super(param1,param2);
      }
      
      public function getStudsCollected() : uint
      {
         return this._uStudsCollected;
      }
   }
}
