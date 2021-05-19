package zufflin.world2D
{
   import starling.display.BlendMode;
   import starling.display.Image;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import zufflin.core.RGBA;
   import zufflin.core.zMaterial;
   import zufflin.core.zSprite;
   
   public class RenderableSprite extends Renderable2
   {
       
      
      private var _image:Image;
      
      private var pSprite:zSprite;
      
      private var _oldColour:uint;
      
      public function RenderableSprite(param1:zSprite = null)
      {
         super();
         this.pSprite = param1;
         if(this.pSprite != null)
         {
            this._image = new Image(this.pSprite._tex);
            this.addChild(this._image);
            this._image.alignPivot();
         }
         else
         {
            this._image = null;
         }
         this._oldColour = 16777215;
      }
      
      override public function dispose() : void
      {
         this.pSprite = null;
         if(this._image != null)
         {
            this.removeChild(this._image);
            this._image.dispose();
            this._image = null;
         }
         super.dispose();
      }
      
      override public function SCG_setAlpha(param1:uint) : void
      {
         if(this._image != null)
         {
            this._image.alpha = Number(param1) / 255;
         }
      }
      
      override public function setColor(param1:RGBA) : void
      {
         var _loc2_:uint = 0;
         if(this._image != null)
         {
            _loc2_ = param1.getDrawColour();
            if(_loc2_ != this._oldColour)
            {
               this._oldColour = _loc2_;
               this._image.color = _loc2_;
            }
            this._image.alpha = param1.getDrawAlpha();
         }
      }
      
      override public function setSprite(param1:zSprite, param2:Boolean = true) : void
      {
         this.pSprite = param1;
         if(this._image == null)
         {
            this._image = new Image(this.pSprite._tex);
            this.addChild(this._image);
            this._image.alignPivot();
            this._oldColour = 16777215;
         }
         else
         {
            this._image.texture = param1._tex;
         }
      }
      
      public function getSprite() : zSprite
      {
         return this.pSprite;
      }
      
      override public function setBlendMode(param1:int) : void
      {
         if(this._image != null)
         {
            switch(param1)
            {
               case zMaterial.Z_BLEND_OPAQUE:
                  this._image.blendMode = BlendMode.NORMAL;
                  break;
               case zMaterial.Z_BLEND_ALPHA_ADD:
                  this._image.blendMode = BlendMode.ADD;
                  break;
               default:
                  this._image.blendMode = BlendMode.NORMAL;
            }
         }
      }
      
      public function SetAnchorBottom() : void
      {
         if(this._image != null)
         {
            this._image.alignPivot(HAlign.CENTER,VAlign.BOTTOM);
         }
      }
   }
}
