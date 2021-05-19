package zufflin.cobraBase
{
   import zufflin.core.zObject;
   
   public class GlaElement extends zObject
   {
       
      
      public var pSceneState:GlaSceneState;
      
      public var vProps:Vector.<GlaProp>;
      
      public var pTemplate:GlaTemplate;
      
      public var trkActive:GlaTrackBool;
      
      public function GlaElement()
      {
         super();
         this.pTemplate = null;
         this.pSceneState = null;
         this.vProps = new Vector.<GlaProp>();
         this.trkActive = new GlaTrackBool();
      }
      
      public function getSceneState() : GlaSceneState
      {
         return this.pSceneState;
      }
      
      public function addProp(param1:GlaProp) : void
      {
         this.vProps.push(param1);
      }
      
      public function scaleData(param1:ScaleInfo) : void
      {
      }
      
      public function findProp(param1:String) : GlaProp
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.vProps.length)
         {
            if(this.vProps[_loc2_].getName().toLowerCase() == param1.toLowerCase())
            {
               return this.vProps[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getPropString(param1:String) : String
      {
         var _loc2_:GlaProp = this.findProp(param1);
         if(_loc2_ && _loc2_ is GlaPropString)
         {
            return (_loc2_ as GlaPropString).getValue();
         }
         return "";
      }
      
      public function getPropRefScene_State(param1:String) : GlaSceneState
      {
         var _loc2_:GlaScene = this.getPropRefScene(param1);
         return !!_loc2_ ? _loc2_.getState(0) : null;
      }
      
      public function getPropRefScene(param1:String) : GlaScene
      {
         var _loc2_:GlaProp = this.findProp(param1);
         if(_loc2_ && _loc2_ is GlaPropRefScene)
         {
            return (_loc2_ as GlaPropRefScene).getSceneRef();
         }
         return null;
      }
      
      public function getTemplateName() : String
      {
         return this.pTemplate.getName();
      }
   }
}
