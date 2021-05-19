package game.objects.fx
{
   import com.adobe.utils.AGALMiniAssembler;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.VertexBuffer3D;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import resource.TextureAtlasResource;
   import starling.core.RenderSupport;
   import starling.core.Starling;
   import starling.display.DisplayObject;
   import starling.errors.MissingContextError;
   import starling.events.Event;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   import starling.utils.VertexData;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.core.zSprite;
   import zufflin.world2D.Renderable2;
   
   public class WibblySpriteRenderable extends Renderable2
   {
      
      private static var PROGRAM_NAME:String = "wobbleimage";
      
      private static var sHelperMatrix:Matrix = new Matrix();
      
      private static var sRenderAlpha:Vector.<Number> = new <Number>[1,1,1,1];
       
      
      public var _iSteps:int;
      
      public var _fWibble:Number;
      
      public var _fWibbleSpeed:Number;
      
      public var _shadowColor:RGBA;
      
      public var _vIntensity:Vec2F;
      
      private var m_iNumTris:int;
      
      private var m_iNumVerts:int;
      
      private var mVertexData:VertexData;
      
      private var mVertexBuffer:VertexBuffer3D;
      
      private var mIndexData:Vector.<uint>;
      
      private var mIndexBuffer:IndexBuffer3D;
      
      private var m_fMinU:Number;
      
      private var m_fMinV:Number;
      
      private var m_fMaxU:Number;
      
      private var m_fMaxV:Number;
      
      private var m_Texture:Texture;
      
      public function WibblySpriteRenderable(param1:zSprite)
      {
         super();
         this.m_Texture = param1._tex;
         this._shadowColor = new RGBA(110,110,110,255);
         setAlwaysVisible();
         this._iSteps = 10;
         this._fWibble = Random.RandomFloatRangeUniform(-Math.PI,Math.PI);
         this._fWibbleSpeed = Random.RandomFloatRangeUniform(1,1.3);
         this._vIntensity = new Vec2F(Random.RandomFloatRangeUniform(5,10),Random.RandomFloatRangeUniform(5,7));
         var _loc2_:TextureAtlas = TextureAtlasResource.getAtlas("ui_fe");
         var _loc3_:String = param1.spr_name;
         _loc3_ = _loc3_.slice(3);
         _loc3_ = _loc3_.slice(0,_loc3_.length - 4);
         var _loc4_:Rectangle = _loc2_.getRegion(_loc3_);
         var _loc5_:Number = this.m_Texture.root.width;
         var _loc6_:Number = this.m_Texture.root.height;
         this.m_fMinU = _loc4_.x / _loc5_;
         this.m_fMinV = _loc4_.y / _loc6_;
         this.m_fMaxU = this.m_fMinU + _loc4_.width / _loc5_;
         this.m_fMaxV = this.m_fMinV + _loc4_.height / _loc6_;
         this.m_iNumTris = this._iSteps * this._iSteps * 2;
         this.m_iNumVerts = (this._iSteps + 1) * (this._iSteps + 1);
         this.mVertexBuffer = null;
         this.mIndexBuffer = null;
         this.mVertexData = new VertexData(this.m_iNumVerts,false);
         this.mIndexData = new Vector.<uint>(this.m_iNumTris * 3,true);
         this.BuildGeom(true,true);
         RegisterPrograms();
         Starling.current.addEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated);
      }
      
      private static function RegisterPrograms() : void
      {
         var _loc3_:* = null;
         var _loc1_:Starling = Starling.current;
         if(_loc1_.hasProgram(PROGRAM_NAME))
         {
            return;
         }
         var _loc2_:* = "m44 op, va0, vc0 \n" + "mul v0, va1, vc5 \n" + "mov v1, va2 \n";
         _loc3_ = "tex ft0, v1, fs0 <2d,linear,nomip,dxt5> \n" + "mul oc, ft0, v0 \n";
         var _loc4_:AGALMiniAssembler;
         (_loc4_ = new AGALMiniAssembler()).assemble(Context3DProgramType.VERTEX,_loc2_);
         var _loc5_:AGALMiniAssembler;
         (_loc5_ = new AGALMiniAssembler()).assemble(Context3DProgramType.FRAGMENT,_loc3_);
         _loc1_.registerProgram(PROGRAM_NAME,_loc4_.agalcode,_loc5_.agalcode);
      }
      
      override public function dispose() : void
      {
         Starling.current.removeEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated);
         if(this.mVertexBuffer)
         {
            this.mVertexBuffer.dispose();
            this.mVertexBuffer = null;
         }
         if(this.mIndexBuffer)
         {
            this.mIndexBuffer.dispose();
            this.mIndexBuffer = null;
         }
         if(this.mVertexData)
         {
            this.mVertexData.numVertices = 0;
            this.mVertexData = null;
         }
         if(this.mIndexData)
         {
            this.mIndexData = null;
         }
         if(this.m_Texture)
         {
            this.m_Texture = null;
         }
         super.dispose();
      }
      
      public function updateMeshes(param1:Number) : void
      {
         this._fWibble += param1 * this._fWibbleSpeed;
         this.BuildGeom(false,false);
      }
      
      public function setShadowColor(param1:RGBA) : void
      {
         this._shadowColor.r = param1.r;
         this._shadowColor.g = param1.g;
         this._shadowColor.b = param1.b;
         this._shadowColor.a = param1.a;
      }
      
      private function onContextCreated(param1:Event) : void
      {
         this.CreateBuffers();
         RegisterPrograms();
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         var _loc3_:Matrix = param1 == this ? null : getTransformationMatrix(param1,sHelperMatrix);
         return this.mVertexData.getBounds(_loc3_,0,-1,param2);
      }
      
      private function BuildGeom(param1:Boolean, param2:Boolean) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:RGBA = new RGBA(255,255,255,255);
         var _loc6_:RGBA = new RGBA(this._shadowColor.r,this._shadowColor.g,this._shadowColor.b,this._shadowColor.a);
         var _loc7_:int = 0;
         var _loc10_:Number = -(this.m_Texture.height / 2);
         var _loc11_:Number = this.m_Texture.height / this._iSteps;
         var _loc12_:Number = _loc10_;
         var _loc13_:Number = -(this.m_Texture.width / 2);
         var _loc14_:Number = this.m_Texture.width / this._iSteps;
         var _loc15_:Number = _loc13_;
         var _loc16_:Number = this.m_fMinU;
         var _loc17_:Number = (this.m_fMaxU - this.m_fMinU) / this._iSteps;
         var _loc18_:Number = _loc16_;
         var _loc19_:Number = this.m_fMinV;
         var _loc20_:Number = (this.m_fMaxV - this.m_fMinV) / this._iSteps;
         var _loc21_:Number = _loc19_;
         var _loc26_:RGBA = new RGBA();
         _loc9_ = 0;
         while(_loc9_ <= this._iSteps)
         {
            _loc15_ = _loc13_;
            _loc18_ = _loc16_;
            _loc8_ = 0;
            while(_loc8_ <= this._iSteps)
            {
               _loc22_ = Math.sin(this._fWibble + _loc4_) * this._vIntensity.x;
               _loc23_ = Math.cos(this._fWibble + _loc4_) * this._vIntensity.y;
               _loc24_ = Math.sin(this._fWibble + _loc3_) * this._vIntensity.x;
               _loc25_ = Math.cos(this._fWibble + _loc3_) * this._vIntensity.y;
               _loc4_ += Math.PI * 2 / 10;
               _loc3_ += Math.PI * 2 / 10;
               RGBA.mix(_loc5_,_loc6_,(_loc24_ / this._vIntensity.x + 1) * 0.5 * ((_loc25_ / this._vIntensity.y + 1) * 0.5),_loc26_);
               this.mVertexData.setPosition(_loc7_,_loc15_ + _loc22_,_loc12_ + _loc23_);
               this.mVertexData.setTexCoords(_loc7_,_loc18_,_loc21_);
               this.mVertexData.setColor(_loc7_,_loc26_.getDrawColour());
               _loc7_++;
               _loc15_ += _loc14_;
               _loc18_ += _loc17_;
               _loc8_++;
            }
            _loc12_ += _loc11_;
            _loc21_ += _loc20_;
            _loc3_ = 0;
            _loc4_ = 0;
            _loc9_++;
         }
         if(param2)
         {
            _loc27_ = 0;
            _loc28_ = 0;
            _loc29_ = this._iSteps + 1;
            _loc9_ = 0;
            while(_loc9_ < this._iSteps)
            {
               _loc8_ = 0;
               while(_loc8_ < this._iSteps)
               {
                  var _loc30_:*;
                  this.mIndexData[_loc30_ = _loc27_++] = _loc28_;
                  var _loc31_:*;
                  this.mIndexData[_loc31_ = _loc27_++] = _loc28_ + 1;
                  var _loc32_:*;
                  this.mIndexData[_loc32_ = _loc27_++] = _loc28_ + _loc29_ + 1;
                  var _loc33_:*;
                  this.mIndexData[_loc33_ = _loc27_++] = _loc28_;
                  var _loc34_:*;
                  this.mIndexData[_loc34_ = _loc27_++] = _loc28_ + _loc29_ + 1;
                  var _loc35_:*;
                  this.mIndexData[_loc35_ = _loc27_++] = _loc28_ + _loc29_;
                  _loc28_ += 1;
                  _loc8_++;
               }
               _loc28_ += 1;
               _loc9_++;
            }
         }
         if(param1)
         {
            this.CreateBuffers();
         }
         else
         {
            this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData,0,this.m_iNumVerts);
            this.mIndexBuffer.uploadFromVector(this.mIndexData,0,this.m_iNumTris * 3);
         }
      }
      
      private function CreateBuffers() : void
      {
         var _loc1_:Context3D = Starling.context;
         if(_loc1_ == null)
         {
            throw new MissingContextError();
         }
         if(this.mVertexBuffer)
         {
            this.mVertexBuffer.dispose();
         }
         if(this.mIndexBuffer)
         {
            this.mIndexBuffer.dispose();
         }
         this.mVertexBuffer = _loc1_.createVertexBuffer(this.mVertexData.numVertices,VertexData.ELEMENTS_PER_VERTEX);
         this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData,0,this.m_iNumVerts);
         this.mIndexBuffer = _loc1_.createIndexBuffer(this.mIndexData.length);
         this.mIndexBuffer.uploadFromVector(this.mIndexData,0,this.mIndexData.length);
      }
      
      override public function render(param1:RenderSupport, param2:Number) : void
      {
         param1.finishQuadBatch();
         sRenderAlpha[0] = sRenderAlpha[1] = sRenderAlpha[2] = 1;
         sRenderAlpha[3] = param2 * this.alpha;
         var _loc3_:Context3D = Starling.context;
         if(_loc3_ == null)
         {
            throw new MissingContextError();
         }
         param1.applyBlendMode(false);
         _loc3_.setProgram(Starling.current.getProgram(PROGRAM_NAME));
         _loc3_.setVertexBufferAt(0,this.mVertexBuffer,VertexData.POSITION_OFFSET,Context3DVertexBufferFormat.FLOAT_2);
         _loc3_.setVertexBufferAt(1,this.mVertexBuffer,VertexData.COLOR_OFFSET,Context3DVertexBufferFormat.FLOAT_4);
         _loc3_.setVertexBufferAt(2,this.mVertexBuffer,VertexData.TEXCOORD_OFFSET,Context3DVertexBufferFormat.FLOAT_2);
         _loc3_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,param1.mvpMatrix3D,true);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,5,sRenderAlpha,1);
         _loc3_.setTextureAt(0,this.m_Texture.base);
         _loc3_.drawTriangles(this.mIndexBuffer,0,this.m_iNumTris);
         _loc3_.setVertexBufferAt(0,null);
         _loc3_.setVertexBufferAt(1,null);
         _loc3_.setVertexBufferAt(2,null);
         _loc3_.setTextureAt(0,null);
      }
   }
}
