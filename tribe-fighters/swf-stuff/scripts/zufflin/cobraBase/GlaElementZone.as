package zufflin.cobraBase
{
   public class GlaElementZone extends GlaElementPoly
   {
       
      
      public var outEvents:Vector.<ElementAndMsg>;
      
      public var triggerEvent:int;
      
      public function GlaElementZone()
      {
         super();
         this.outEvents = new Vector.<ElementAndMsg>();
      }
      
      public function getTrigger() : int
      {
         return this.triggerEvent;
      }
      
      public function getOutEventCount() : uint
      {
         return this.outEvents.length;
      }
      
      public function getOutEvent(param1:uint) : ElementAndMsg
      {
         return this.outEvents[param1];
      }
   }
}
