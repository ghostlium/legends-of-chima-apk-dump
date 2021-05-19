package zufflin.cobraBase
{
   import flash.utils.getQualifiedClassName;
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.core.zObject;
   import zufflin.core.zSprite;
   import zufflin.math.AABox2f;
   
   public class GlaSceneState extends zObject
   {
       
      
      public var pScene:GlaScene;
      
      public var vVisibleElements:Vector.<GlaElement>;
      
      public var vControlElements:Vector.<GlaElement>;
      
      public var vAllElements:Vector.<GlaElement>;
      
      public var pTemplate:GlaTemplate;
      
      public var numFrames:int;
      
      public var maxBounds:AABox2f;
      
      public var size:Vec2F;
      
      public var fps:Number;
      
      public var background:RGBA;
      
      public function GlaSceneState()
      {
         super();
         this.vVisibleElements = new Vector.<GlaElement>();
         this.vControlElements = new Vector.<GlaElement>();
         this.vAllElements = new Vector.<GlaElement>();
         this.maxBounds = new AABox2f();
         this.size = new Vec2F();
         this.background = new RGBA();
         this.pTemplate = null;
         this.pScene = null;
         this.numFrames = 0;
         this.fps = 30;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function getScene() : GlaScene
      {
         return this.pScene;
      }
      
      public function addProp(param1:GlaProp) : void
      {
      }
      
      public function addVisibleElement(param1:GlaElement) : void
      {
         param1.pSceneState = this;
         this.vAllElements.push(param1);
         this.vVisibleElements.push(param1);
      }
      
      public function addControlElement(param1:GlaElement) : void
      {
         param1.pSceneState = this;
         this.vAllElements.push(param1);
         this.vControlElements.push(param1);
      }
      
      public function scaleData(param1:ScaleInfo) : void
      {
         var _loc2_:int = 0;
         this.maxBounds.scale(param1.scale);
         this.size.scaleBy(param1.scale);
         _loc2_ = 0;
         while(_loc2_ < this.vVisibleElements.length)
         {
            this.vVisibleElements[_loc2_].scaleData(param1);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.vControlElements.length)
         {
            this.vControlElements[_loc2_].scaleData(param1);
            _loc2_++;
         }
      }
      
      public function getElements() : Vector.<GlaElement>
      {
         return this.vAllElements;
      }
      
      public function findElement(param1:String) : GlaElement
      {
         var _loc2_:GlaElement = this.findControlElement(param1);
         if(_loc2_ == null)
         {
            _loc2_ = this.findVisibleElement(param1);
         }
         return _loc2_;
      }
      
      public function findControlElement(param1:String) : GlaElement
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.vControlElements.length)
         {
            if(this.vControlElements[_loc2_].getName().toLowerCase() == param1.toLowerCase())
            {
               return this.vControlElements[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function findVisibleElement(param1:String) : GlaElement
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.vVisibleElements.length)
         {
            if(this.vVisibleElements[_loc2_].getName().toLowerCase() == param1.toLowerCase())
            {
               return this.vVisibleElements[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function findVisibleElementsContains(param1:String, param2:Vector.<GlaElement>) : void
      {
         trace("SCG : GlaSceneState::findVisibleElementsContains - requires implementation");
      }
      
      public function findRectangleElement(param1:String) : GlaElementRectangle
      {
         return this.findControlRect(param1);
      }
      
      public function findControlRect(param1:String) : GlaElementRectangle
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.vControlElements.length)
         {
            _loc2_ = getQualifiedClassName(this.vControlElements[_loc3_]);
            if(_loc2_ == "zufflin.cobraBase::GlaElementRectangle" && this.vControlElements[_loc3_].getName().toLowerCase() == param1.toLowerCase())
            {
               return this.vControlElements[_loc3_] as GlaElementRectangle;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getNumFrames() : int
      {
         return this.numFrames;
      }
      
      public function getSize() : Vec2F
      {
         return this.size;
      }
      
      public function getBackground() : RGBA
      {
         return this.background;
      }
      
      public function getFPS() : Number
      {
         return this.fps;
      }
      
      public function getMaxBounds() : AABox2f
      {
         return this.maxBounds;
      }
      
      public function hasAnimation() : Boolean
      {
         var _loc2_:GlaElementScene = null;
         if(this.getNumFrames() > 1)
         {
            return true;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.vVisibleElements.length)
         {
            _loc2_ = this.vVisibleElements[_loc1_] as GlaElementScene;
            if(_loc2_ != null)
            {
               if(_loc2_.hasAnimation())
               {
                  return true;
               }
            }
            _loc1_++;
         }
         return false;
      }
      
      public function getVisibleElements() : Vector.<GlaElement>
      {
         return this.vVisibleElements;
      }
      
      public function findPathElement(param1:String) : GlaElementPath
      {
         var _loc2_:GlaElementPath = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.vControlElements.length)
         {
            _loc2_ = this.vControlElements[_loc3_] as GlaElementPath;
            if(_loc2_ != null && _loc2_.getName().toLowerCase() == param1.toLowerCase())
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getControlElements() : Vector.<GlaElement>
      {
         return this.vControlElements;
      }
      
      public function findShipPaths(param1:Vector.<GlaElementShipPath>) : void
      {
         var _loc2_:GlaElementShipPath = null;
         param1.length = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.vControlElements.length)
         {
            _loc2_ = this.vControlElements[_loc3_] as GlaElementShipPath;
            if(_loc2_ != null)
            {
               param1.push(_loc2_);
            }
            _loc3_++;
         }
      }
      
      public function findGameObjs(param1:Vector.<GlaElementGameObj>) : void
      {
         var _loc2_:GlaElementGameObj = null;
         param1.length = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.vControlElements.length)
         {
            _loc2_ = this.vControlElements[_loc3_] as GlaElementGameObj;
            if(_loc2_ != null)
            {
               param1.push(_loc2_);
            }
            _loc3_++;
         }
      }
      
      public function findSpriteElement(param1:String) : GlaElementSprite
      {
         var _loc2_:GlaElement = this.findVisibleElement(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         if(_loc2_ is GlaElementSprite)
         {
            return _loc2_ as GlaElementSprite;
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
      
      public function findProp(param1:String) : GlaProp
      {
         return null;
      }
      
      public function getPropBool(param1:String) : Boolean
      {
         var _loc2_:GlaProp = this.findProp(param1);
         if(_loc2_ && _loc2_ is GlaPropBool)
         {
            return (_loc2_ as GlaPropBool).getValue();
         }
         return false;
      }
      
      public function findSpriteElementSprite(param1:String) : zSprite
      {
         var _loc2_:GlaElement = this.findVisibleElement(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         if(_loc2_ is GlaElementSprite)
         {
            return (_loc2_ as GlaElementSprite).getSprite();
         }
         return null;
      }
      
      public function findZones(param1:Vector.<GlaElementZone>) : void
      {
         var _loc2_:GlaElement = null;
         param1.length = 0;
         for each(_loc2_ in this.vControlElements)
         {
            if(_loc2_ is GlaElementZone)
            {
               param1.push(_loc2_ as GlaElementZone);
            }
         }
      }
   }
}
