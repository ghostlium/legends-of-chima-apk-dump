package zufflin.cobraBase
{
   public class GlaPropRefScene extends GlaProp
   {
       
      
      public var refName:String;
      
      public var pState:GlaSceneState;
      
      public function GlaPropRefScene(param1:GlaSceneState, param2:String, param3:String)
      {
         super();
         setName(param2);
         this.refName = param3;
         this.pState = param1;
      }
      
      public function getSceneRef() : GlaScene
      {
         return this.pState.getScene().getDatabase().findScene(this.refName);
      }
   }
}
