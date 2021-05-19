package zufflin.cobraBase
{
   import zufflin.core.zObject;
   import zufflin.core.zSprite;
   
   public class GlaScene extends zObject
   {
       
      
      public var pTemplate:GlaTemplate;
      
      public var pDatabase:GlaSet;
      
      public var vProps:Vector.<GlaProp>;
      
      public var states:Vector.<GlaSceneState>;
      
      public var customRendererName:String;
      
      public function GlaScene()
      {
         super();
         this.pDatabase = null;
         this.customRendererName = null;
         this.vProps = new Vector.<GlaProp>();
         this.states = new Vector.<GlaSceneState>();
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         this.customRendererName = null;
         this.pTemplate = null;
         _loc1_ = 0;
         while(_loc1_ < this.vProps.length)
         {
            this.vProps[_loc1_].dispose();
            this.vProps[_loc1_] = null;
            _loc1_++;
         }
         this.vProps = null;
         _loc1_ = 0;
         while(_loc1_ < this.states.length)
         {
            this.states[_loc1_].dispose();
            this.states[_loc1_] = null;
            _loc1_++;
         }
         this.states = null;
         super.dispose();
      }
      
      public function addProp(param1:GlaProp) : void
      {
         if(param1 != null)
         {
            this.vProps.push(param1);
         }
      }
      
      public function addState(param1:GlaSceneState) : void
      {
         param1.pScene = this;
         this.states.push(param1);
      }
      
      public function findState(param1:String) : GlaSceneState
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.states.length)
         {
            if(this.states[_loc2_].getName().toLowerCase() == param1.toLowerCase())
            {
               return this.states[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function scaleData(param1:ScaleInfo) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.states.length)
         {
            this.states[_loc2_].scaleData(param1);
            _loc2_++;
         }
      }
      
      public function getState(param1:int) : GlaSceneState
      {
         return this.states[param1];
      }
      
      public function getStateSafe(param1:int) : GlaSceneState
      {
         if(this.states == null)
         {
            return null;
         }
         if(param1 >= this.states.length)
         {
            param1 = this.states.length - 1;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         return this.states[param1];
      }
      
      public function findElement(param1:String) : GlaElement
      {
         return this.states[0].findElement(param1);
      }
      
      public function findSpriteElement(param1:String) : GlaElementSprite
      {
         return this.states[0].findSpriteElement(param1);
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
      
      public function findProp(param1:String) : GlaProp
      {
         var _loc2_:GlaProp = null;
         for each(_loc2_ in this.vProps)
         {
            if(_loc2_.getName().toLowerCase() == param1.toLowerCase())
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getDatabase() : GlaSet
      {
         return this.pDatabase;
      }
      
      public function getElements() : Vector.<GlaElement>
      {
         return this.states[0].getElements();
      }
      
      public function findZones(param1:Vector.<GlaElementZone>) : void
      {
         this.states[0].findZones(param1);
      }
      
      public function findSpriteElementSprite(param1:String) : zSprite
      {
         return this.states[0].findSpriteElementSprite(param1);
      }
   }
}
