package zufflin.cobraBase
{
   public class ElementRefPatch
   {
       
      
      public var elementName:String;
      
      public var pState:GlaSceneState;
      
      public var ppElement:ElementAndMsg;
      
      public function ElementRefPatch(param1:String, param2:ElementAndMsg, param3:GlaSceneState)
      {
         super();
         this.elementName = param1;
         this.pState = param3;
         this.ppElement = param2;
      }
   }
}
