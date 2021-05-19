package zufflin.cobraBase
{
   import starling.display.Sprite;
   import util.Vec2F;
   
   public class GlaController extends Sprite
   {
      
      protected static var runtimeAnimationVersion:int = 1;
      
      public static var depthEnumValues:Vector.<int> = new Vector.<int>();
       
      
      public var pParent:GlaController;
      
      protected var position:Vec2F;
      
      protected var scale:Vec2F;
      
      protected var _rotation:Number;
      
      protected var depth:int;
      
      public var nodePosition:Vec2F;
      
      public var nodeScale:Vec2F;
      
      public var nodePivot:Vec2F;
      
      public var nodeRotation:Number;
      
      public var nodeDepth:int;
      
      public function GlaController(param1:GlaController)
      {
         super();
         this.pParent = param1;
         this.position = new Vec2F();
         this.scale = new Vec2F(1,1);
         this._rotation = 0;
         this.depth = 0;
         this.nodePosition = new Vec2F();
         this.nodeScale = new Vec2F(1,1);
         this.nodePivot = new Vec2F();
         this.nodeRotation = 0;
         this.nodeDepth = 0;
      }
      
      public static function getRuntimeAnimationVersion() : int
      {
         return runtimeAnimationVersion;
      }
      
      public static function setRuntimeAnimationVersion(param1:int) : void
      {
         runtimeAnimationVersion = param1;
      }
      
      public static function setDepthEnums(param1:Vector.<int>, param2:int) : void
      {
         depthEnumValues.length = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            depthEnumValues.push(param1[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getNodePosition() : Vec2F
      {
         return this.nodePosition;
      }
      
      public function getNodeRotation() : Number
      {
         return this.nodeRotation;
      }
      
      public function getNodeScale() : Vec2F
      {
         return this.nodeScale;
      }
      
      public function setNodePosition(param1:Vec2F) : void
      {
         this.nodePosition.x = param1.x;
         this.nodePosition.y = param1.y;
      }
      
      public function setNodeRotation(param1:Number) : void
      {
         this.nodeRotation = param1;
      }
      
      public function setNodeScale(param1:Vec2F) : void
      {
         this.nodeScale.x = param1.x;
         this.nodeScale.y = param1.y;
      }
      
      public function getNodeDepth() : int
      {
         return this.nodeDepth;
      }
      
      public function setNodeDepth(param1:int) : void
      {
         this.nodeDepth = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function getParent() : GlaController
      {
         return this.pParent;
      }
      
      public function setParent(param1:GlaController) : void
      {
         this.pParent = param1;
      }
      
      public function getRoot() : GlaController
      {
         return !!this.pParent ? this.pParent.getRoot() : this;
      }
      
      public function propagateMessage(param1:GlaMsg) : void
      {
      }
      
      public function getPosition() : Vec2F
      {
         return new Vec2F(this.position.x,this.position.y);
      }
      
      public function getRotation() : Number
      {
         return this._rotation;
      }
      
      public function getScale() : Vec2F
      {
         return new Vec2F(this.scale.x,this.scale.y);
      }
      
      public function getDepth() : int
      {
         return this.depth;
      }
      
      public function setPosition(param1:Vec2F) : void
      {
         this.position.x = param1.x;
         this.position.y = param1.y;
         this.x = this.position.x;
         this.y = this.position.y;
      }
      
      public function setRotation(param1:Number) : void
      {
         this._rotation = param1;
         this.rotation = this._rotation;
      }
      
      public function setScale(param1:Vec2F) : void
      {
         this.scale.x = param1.x;
         this.scale.y = param1.y;
         this.scaleX = this.scale.x;
         this.scaleY = this.scale.y;
      }
      
      public function setDepth(param1:int) : void
      {
         this.depth = param1;
      }
      
      public function calcDepthEnum(param1:int) : int
      {
         return depthEnumValues.length == 0 || param1 < 0 ? 0 : int(depthEnumValues[param1]);
      }
   }
}
