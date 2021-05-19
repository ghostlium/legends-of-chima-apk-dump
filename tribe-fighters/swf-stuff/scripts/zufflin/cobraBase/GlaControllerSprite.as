package zufflin.cobraBase
{
   import starling.display.Image;
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.core.zMaterial;
   import zufflin.core.zSprite;
   
   public class GlaControllerSprite extends GlaControllerElement
   {
       
      
      public var pSprite:zSprite;
      
      public var clipx:Vec2F;
      
      public var clipy:Vec2F;
      
      public var pivot:Vec2F;
      
      public var _blendMode:int;
      
      public var bLocked:Boolean;
      
      public var bClipping:Boolean;
      
      public var _image:Image;
      
      public function GlaControllerSprite(param1:GlaController, param2:GlaElementSprite)
      {
         super(param1,param2);
         this._image = null;
         pSrcElement = param2;
         this.pSprite = null;
         bActive = false;
         this._blendMode = zMaterial.Z_BLEND_OPAQUE;
         this.bLocked = false;
         this.bClipping = param2.bClipping;
         switch(param2.blendMode)
         {
            case 0:
               this._blendMode = zMaterial.Z_BLEND_OPAQUE;
               break;
            case 1:
               this._blendMode = zMaterial.Z_BLEND_ALPHA;
               break;
            case 2:
               this._blendMode = zMaterial.Z_BLEND_ALPHA_ADD;
         }
         depth = calcDepthEnum(param2.getDepthEnum());
         this.internalSetFrame(new FrameInfo());
      }
      
      override public function dispose() : void
      {
         if(this._image != null)
         {
            this.removeChild(this._image);
            this._image.dispose();
            this._image = null;
         }
      }
      
      public function getSprite() : zSprite
      {
         return this.pSprite;
      }
      
      public function setSprite(param1:zSprite) : void
      {
         if(param1 != null && param1._tex != null && this.pSprite == param1 && this.pSprite._tex == param1._tex && this._image != null)
         {
            return;
         }
         if(this._image != null)
         {
            this.removeChild(this._image);
            this._image.dispose();
         }
         this.pSprite = param1;
         if(this.pSprite != null && this.pSprite._tex != null)
         {
            this._image = new Image(this.pSprite._tex);
            this._image.alignPivot();
            this.addChild(this._image);
            this.SCG_SetupImageForRender();
         }
      }
      
      public function setBlendMode(param1:int) : void
      {
         this._blendMode = param1;
      }
      
      public function getBlendMode() : int
      {
         return this._blendMode;
      }
      
      public function getSrcSprite() : GlaElementSprite
      {
         return pSrcElement as GlaElementSprite;
      }
      
      private function SCG_SetupImageForRender(param1:Boolean = false) : void
      {
         this._image.visible = bActive;
         if(param1 && color != null)
         {
            this._image.color = color.getDrawColour();
            this._image.alpha = color.getDrawAlpha();
         }
         this._image.scaleX = scale.x;
         this._image.scaleY = scale.y;
         this._image.rotation = _rotation;
         this._image.x = position.x;
         this._image.y = position.y;
      }
      
      override public function internalSetFrame(param1:FrameInfo) : void
      {
         if(!this.bLocked)
         {
            if(depthEnumValues.length == 0)
            {
               depth = this.getSrcSprite().trkDepth.getValueF(param1.frameI,param1.frac) + nodeDepth;
            }
            position = this.getSrcSprite().trkPosition.getValueF(param1.frameI,param1.frac);
            position.x += nodePosition.x;
            position.y += nodePosition.y;
            _rotation = MathsHelper.DegToRad(this.getSrcSprite().trkRotation.getValueF(param1.frameI,param1.frac)) + nodeRotation;
            scale = this.getSrcSprite().trkScale.getValueF(param1.frameI,param1.frac);
            scale.x *= nodeScale.x;
            scale.y *= nodeScale.y;
            this.setSprite(this.getSrcSprite().trkSprite.getValue(param1.frameI));
            color = this.getSrcSprite().trkColor.getValueF(param1.frameI,param1.frac);
            this.pivot = this.getSrcSprite().trkPivot.getValueF(param1.frameI,param1.frac);
            this.pivot.x += nodePivot.x;
            this.pivot.y += nodePivot.y;
            if(this.bClipping)
            {
               this.clipx = this.getSrcSprite().trkClipX.getValueF(param1.frameI,param1.frac);
               this.clipy = this.getSrcSprite().trkClipY.getValueF(param1.frameI,param1.frac);
            }
            bActive = this.getSrcSprite().trkActive.getValue(param1.frameI) && this.pSprite && bNodeActive;
            if(this._image != null)
            {
               this.SCG_SetupImageForRender(true);
            }
         }
      }
   }
}
