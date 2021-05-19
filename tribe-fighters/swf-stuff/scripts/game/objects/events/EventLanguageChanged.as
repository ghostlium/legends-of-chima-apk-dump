package game.objects.events
{
   import starling.events.Event;
   
   public class EventLanguageChanged extends Event
   {
      
      public static const EVENT_LANGUAGE_CHANGED:String = "EVENT_LANGUAGE_CHANGED";
       
      
      public var _langCode:String;
      
      public function EventLanguageChanged(param1:String, param2:Boolean, param3:String)
      {
         this._langCode = param3;
         super(param1,param2);
      }
      
      public function getLanguageCode() : String
      {
         return this._langCode;
      }
   }
}
