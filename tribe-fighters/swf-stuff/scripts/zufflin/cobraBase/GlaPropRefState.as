package zufflin.cobraBase
{
   public class GlaPropRefState extends GlaProp
   {
       
      
      protected var refName:String;
      
      protected var pState:GlaSceneState;
      
      public function GlaPropRefState(param1:GlaSceneState, param2:String, param3:String)
      {
         super();
         setName(param2);
         this.refName = param3;
         this.pState = param1;
      }
      
      public function getState() : GlaSceneState
      {
         return this.pState.getScene().findState(this.refName);
      }
   }
}
