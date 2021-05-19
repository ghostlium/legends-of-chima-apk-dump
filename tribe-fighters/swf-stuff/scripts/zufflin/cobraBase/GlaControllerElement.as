package zufflin.cobraBase
{
   import util.Vec2F;
   import zufflin.core.RGBA;
   
   public class GlaControllerElement extends GlaController
   {
       
      
      protected var pSrcElement:GlaElement;
      
      protected var time:Number;
      
      protected var bActive:Boolean;
      
      protected var anchor:int;
      
      protected var wrapAnchor:int;
      
      protected var color:RGBA;
      
      protected var nodeColor:RGBA;
      
      protected var anchorOffset:Vec2F;
      
      protected var bNodeActive:Boolean;
      
      public var userdata:int;
      
      public function GlaControllerElement(param1:GlaController, param2:GlaElement)
      {
         super(param1);
         this.pSrcElement = param2;
         this.time = 0;
         this.bNodeActive = true;
         this.color = new RGBA(255,255,255,255);
         this.nodeColor = new RGBA(255,255,255,255);
      }
      
      public function initialise() : void
      {
         if(this.pSrcElement)
         {
            this.internalSetFrame(new FrameInfo());
         }
      }
      
      public function internalSetFrame(param1:FrameInfo) : void
      {
      }
      
      public function setColor(param1:RGBA) : void
      {
         this.color = param1;
         this.alpha = this.color.getDrawAlpha();
      }
      
      public function getColor() : RGBA
      {
         return this.color;
      }
      
      public function setAlpha(param1:uint) : void
      {
         this.color.a = param1;
         this.alpha = this.color.getDrawAlpha();
      }
      
      public function getName() : String
      {
         return this.pSrcElement.getName();
      }
      
      public function getSrc() : GlaElement
      {
         return this.pSrcElement;
      }
      
      public function setActive(param1:Boolean) : void
      {
         this.bActive = param1;
         this.visible = this.bActive;
      }
      
      public function isActive() : Boolean
      {
         return this.bActive;
      }
      
      public function setOwner(param1:Object) : void
      {
      }
      
      public function update() : void
      {
      }
      
      public function setNodeColor(param1:RGBA) : void
      {
         trace("SCG : SetNodeColor ... this colour is not actually applied to rendered sprite, FIX ME");
         this.nodeColor = param1;
      }
      
      public function setNodeActive(param1:Boolean) : void
      {
         this.bNodeActive = param1;
      }
      
      public function isNodeActive() : Boolean
      {
         return this.bNodeActive;
      }
      
      public function setFrame(param1:int) : void
      {
         this.internalSetFrame(new FrameInfo(param1));
      }
   }
}
