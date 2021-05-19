package zufflin.core
{
   import starling.textures.Texture;
   
   public class zMaterial
   {
      
      public static const Z_DISABLED:int = 0;
      
      public static const Z_ENABLED:int = 1;
      
      public static const Z_NEVER:int = 2;
      
      public static const Z_LESS:int = 3;
      
      public static const Z_LEQUAL:int = 4;
      
      public static const Z_EQUAL:int = 5;
      
      public static const Z_GEQUAL:int = 6;
      
      public static const Z_GREATER:int = 7;
      
      public static const Z_NOTEQUAL:int = 8;
      
      public static const Z_ALWAYS:int = 9;
      
      public static const Z_RENDER_MODE_VALUE_MAX:int = 10;
      
      public static const Z_BLEND_OPAQUE:int = 0;
      
      public static const Z_BLEND_ALPHA:int = 1;
      
      public static const Z_BLEND_ALPHA_ADD:int = 2;
      
      public static const Z_BLEND_ALPHA_PRE_MULT:int = 3;
      
      public static const Z_BLEND_MODE_MAX:int = 4;
      
      public static const Z_BLEND:int = 0;
      
      public static const Z_DEPTH_TEST:int = 1;
      
      public static const Z_DEPTH_WRITE:int = 2;
      
      public static const Z_DEPTH_FUNC:int = 3;
      
      public static const Z_CULL_FACE:int = 4;
      
      public static const Z_STENCIL_TEST:int = 5;
      
      public static const Z_RENDER_MODE_MAX:int = 6;
      
      private static const MAX_TEXTURES:int = 4;
       
      
      private var apTextures:Vector.<Texture>;
      
      private var color:RGBA;
      
      private var blendMode:int;
      
      private var primitiveType:int;
      
      private var aRenderModes:Vector.<int>;
      
      public function zMaterial()
      {
         super();
         this.aRenderModes = new Vector.<int>(Z_RENDER_MODE_MAX,true);
         this.setDefaultRenderBlendMode();
         this.color = new RGBA(255,255,255,255);
         this.apTextures = new Vector.<Texture>(MAX_TEXTURES,true);
      }
      
      public function dispose() : void
      {
         this.apTextures = null;
      }
      
      public function getTexture(param1:uint) : Texture
      {
         return this.apTextures[param1];
      }
      
      public function setTexture(param1:uint, param2:Texture) : void
      {
         this.apTextures[param1] = param2;
      }
      
      public function getBlendMode() : int
      {
         return this.blendMode;
      }
      
      public function setBlendMode(param1:int) : void
      {
         this.blendMode = param1;
      }
      
      public function setRenderMode(param1:int, param2:int) : void
      {
         this.aRenderModes[param1] = param2;
      }
      
      public function getRenderMode(param1:int) : int
      {
         return this.aRenderModes[param1];
      }
      
      public function getColor() : RGBA
      {
         return this.color;
      }
      
      public function setColor(param1:RGBA) : void
      {
         this.color.r = param1.r;
         this.color.g = param1.g;
         this.color.b = param1.b;
         this.color.a = param1.a;
      }
      
      public function setTime(param1:Number) : void
      {
      }
      
      public function getTime() : Number
      {
         return 0;
      }
      
      public function setDefaultRenderBlendMode() : void
      {
         this.aRenderModes[Z_BLEND] = Z_DISABLED;
         this.aRenderModes[Z_DEPTH_TEST] = Z_DISABLED;
         this.aRenderModes[Z_DEPTH_WRITE] = Z_DISABLED;
         this.aRenderModes[Z_DEPTH_FUNC] = Z_LESS;
         this.aRenderModes[Z_CULL_FACE] = Z_DISABLED;
         this.aRenderModes[Z_STENCIL_TEST] = Z_DISABLED;
         this.blendMode = Z_BLEND_OPAQUE;
      }
   }
}
