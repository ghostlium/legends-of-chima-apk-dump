package zufflin.world
{
   import starling.events.Event;
   import zufflin.world2D.GlaAnimRenderable;
   
   public class EventAnimFinished extends Event
   {
      
      public static const EVENT_ANIM_FINISHED:String = "EVENT_ANIM_FINISHED";
       
      
      public var _pGlaAnim:GlaAnimRenderable;
      
      public function EventAnimFinished(param1:GlaAnimRenderable, param2:String, param3:Boolean = false)
      {
         this._pGlaAnim = param1;
         super(param2,param3);
      }
      
      public function glaAnim() : GlaAnimRenderable
      {
         return this._pGlaAnim;
      }
   }
}
