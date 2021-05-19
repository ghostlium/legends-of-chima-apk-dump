package zufflin.cobraBase
{
   import starling.display.Quad;
   import starling.textures.Texture;
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.core.zMaterial;
   
   public class GlaControllerPolyTextured extends GlaControllerElement
   {
       
      
      public var indicies:Vector.<int>;
      
      public var colors:Vector.<RGBA>;
      
      public var uvs:Vector.<Vec2F>;
      
      public var points:Vector.<Vec2F>;
      
      public var material:zMaterial;
      
      public var texScale:Vec2F;
      
      public var texOffset:Vec2F;
      
      public var texMult:Vec2F;
      
      public var texRotation:Number;
      
      public var _quad:Quad;
      
      public var _baseX:Number;
      
      public var _baseY:Number;
      
      public function GlaControllerPolyTextured(param1:GlaController, param2:GlaElementPolyTextured, param3:Number = 1.0)
      {
         var _loc4_:int = 0;
         super(param1,param2);
         this.texOffset = new Vec2F();
         this.texScale = new Vec2F();
         this.texMult = new Vec2F();
         this.texRotation = 0;
         this.material = new zMaterial();
         pSrcElement = param2;
         bActive = false;
         this.points = new Vector.<Vec2F>(param2.getPoints().length,true);
         this.uvs = new Vector.<Vec2F>(param2.getPoints().length,true);
         this.colors = new Vector.<RGBA>(param2.getPoints().length,true);
         _loc4_ = 0;
         while(_loc4_ < param2.getPoints().length)
         {
            this.points[_loc4_] = new Vec2F(param2.getPoints()[_loc4_].x * param3,param2.getPoints()[_loc4_].y * param3);
            this.uvs[_loc4_] = new Vec2F();
            this.colors[_loc4_] = new RGBA();
            _loc4_++;
         }
         depth = calcDepthEnum(param2.getDepthEnum());
         this.internalSetFrame(new FrameInfo());
         switch(param2.blendMode)
         {
            case 0:
               this.material.setBlendMode(zMaterial.Z_BLEND_OPAQUE);
               break;
            case 1:
               this.material.setBlendMode(zMaterial.Z_BLEND_ALPHA);
               break;
            case 2:
               this.material.setBlendMode(zMaterial.Z_BLEND_ALPHA_ADD);
         }
         var _loc5_:Number = this.points[0].x;
         var _loc6_:Number = this.points[0].x;
         var _loc7_:Number = this.points[0].y;
         var _loc8_:Number = this.points[0].y;
         _loc4_ = 1;
         while(_loc4_ < this.points.length)
         {
            if(this.points[_loc4_].x < _loc5_)
            {
               _loc5_ = this.points[_loc4_].x;
            }
            else if(this.points[_loc4_].x > _loc6_)
            {
               _loc6_ = this.points[_loc4_].x;
            }
            if(this.points[_loc4_].y < _loc7_)
            {
               _loc7_ = this.points[_loc4_].y;
            }
            else if(this.points[_loc4_].y > _loc8_)
            {
               _loc8_ = this.points[_loc4_].y;
            }
            _loc4_++;
         }
         var _loc9_:Number = _loc6_ - _loc5_;
         var _loc10_:Number = _loc8_ - _loc7_;
         this._quad = new Quad(_loc9_,_loc10_,0);
         this._quad.x = _loc5_;
         this._quad.y = _loc7_;
         this._baseX = _loc5_;
         this._baseY = _loc7_;
         this.addChild(this._quad);
      }
      
      override public function dispose() : void
      {
         if(this._quad != null)
         {
            this.removeChild(this._quad);
            this._quad.dispose();
            this._quad = null;
         }
      }
      
      public function getSrcPoly() : GlaElementPolyTextured
      {
         return pSrcElement as GlaElementPolyTextured;
      }
      
      public function getTexture() : Texture
      {
         return this.material.getTexture(0);
      }
      
      public function getTextureOffset() : Vec2F
      {
         return this.texOffset;
      }
      
      override public function internalSetFrame(param1:FrameInfo) : void
      {
         bActive = this.getSrcPoly().trkActive.getValue(param1.frameI);
         position = this.getSrcPoly().trkPosition.getValueF(param1.frameI,param1.frac);
         color = this.getSrcPoly().trkColor.getValueF(param1.frameI,param1.frac);
         scale.set(1,1);
         if(depthEnumValues.length == 0)
         {
            depth = int(this.getSrcPoly().trkDepth.getValueF(param1.frameI,param1.frac));
         }
         if(this.getSrcPoly().trkTexture.getValue(0) != null)
         {
            this.material.setTexture(0,this.getSrcPoly().trkTexture.getValue(0)._tex);
            this.material.setTexture(1,this.getSrcPoly().trkTextureNrml.getValue(0)._tex);
            this.setTextureOffset(this.getSrcPoly().trkTextureOffset.getValueF(param1.frameI,param1.frac));
            this.setTextureScale(this.getSrcPoly().trkTextureScale.getValueF(param1.frameI,param1.frac));
            this.setTextureRotation(this.getSrcPoly().trkTextureRotation.getValueF(param1.frameI,param1.frac));
            this.updateTextureCoords();
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.points.length)
         {
            this.colors[_loc2_].r = color.r;
            this.colors[_loc2_].g = color.g;
            this.colors[_loc2_].b = color.b;
            this.colors[_loc2_].a = color.a;
            _loc2_++;
         }
         if(this._quad != null)
         {
            this._quad.visible = bActive;
            this._quad.x = this._baseX + position.x;
            this._quad.y = this._baseY + position.y;
         }
      }
      
      public function setTextureRotation(param1:Number) : void
      {
         this.texRotation = MathsHelper.DegToRad(param1);
      }
      
      public function setTextureOffset(param1:Vec2F) : void
      {
         this.texOffset.x = param1.x;
         this.texOffset.y = param1.y;
      }
      
      public function setTextureOffsetInPixels(param1:Vec2F) : void
      {
         this.texOffset.x = param1.x / this.material.getTexture(0).width;
         this.texOffset.y = param1.y / this.material.getTexture(0).height;
      }
      
      public function setTextureScale(param1:Vec2F) : void
      {
         this.texScale.x = param1.x;
         this.texScale.y = param1.y;
         this.texMult.x = 1 / (this.material.getTexture(0).width * this.texScale.x);
         this.texMult.y = 1 / (this.material.getTexture(0).height * this.texScale.y);
      }
      
      public function updateTextureCoords() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.points.length)
         {
            this.uvs[_loc1_].x = this.points[_loc1_].x;
            this.uvs[_loc1_].y = this.points[_loc1_].y;
            if(this.texRotation != 0)
            {
               this.uvs[_loc1_].rotate(MathsHelper.DegToRad(this.texRotation));
            }
            this.uvs[_loc1_].x *= this.texMult.x;
            this.uvs[_loc1_].y *= this.texMult.y;
            this.uvs[_loc1_].x += this.texOffset.x;
            this.uvs[_loc1_].y += this.texOffset.y;
            _loc1_++;
         }
      }
   }
}
