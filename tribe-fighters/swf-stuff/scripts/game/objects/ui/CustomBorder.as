package game.objects.ui
{
   import com.adobe.utils.AGALMiniAssembler;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.VertexBuffer3D;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import starling.core.RenderSupport;
   import starling.core.Starling;
   import starling.display.DisplayObject;
   import starling.errors.MissingContextError;
   import starling.events.Event;
   import starling.utils.VertexData;
   
   public class CustomBorder extends DisplayObject
   {
      
      private static var PROGRAM_NAME:String = "customborder";
      
      private static var sHelperMatrix:Matrix = new Matrix();
      
      private static var sRenderAlpha:Vector.<Number> = new <Number>[1,1,1,1];
       
      
      private var m_iNumTris:int;
      
      private var m_iNumVerts:int;
      
      private var mVertexData:VertexData;
      
      private var mVertexBuffer:VertexBuffer3D;
      
      private var mIndexData:Vector.<uint>;
      
      private var mIndexBuffer:IndexBuffer3D;
      
      private var m_fWidth:Number;
      
      private var m_fHeight:Number;
      
      private var m_fColour:uint;
      
      private var m_fFadeEdge:Number;
      
      public function CustomBorder(param1:Number, param2:Number, param3:uint, param4:Number)
      {
         super();
         this.m_iNumTris = 8;
         this.m_iNumVerts = 8;
         this.mVertexBuffer = null;
         this.mIndexBuffer = null;
         this.m_fWidth = param1;
         this.m_fHeight = param2;
         this.m_fColour = param3;
         this.m_fFadeEdge = param4;
         this.mVertexData = new VertexData(this.m_iNumVerts,false);
         this.mVertexData.setUniformColor(this.m_fColour);
         this.mIndexData = new Vector.<uint>(this.m_iNumTris * 3,true);
         this.BuildGeom(true);
         RegisterPrograms();
         Starling.current.addEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated);
      }
      
      private static function RegisterPrograms() : void
      {
         var _loc3_:String = null;
         var _loc1_:Starling = Starling.current;
         if(_loc1_.hasProgram(PROGRAM_NAME))
         {
            return;
         }
         var _loc2_:* = "m44 op, va0, vc0 \n" + "mul v0, va1, vc4 \n";
         _loc3_ = "mov oc v0 \n";
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
         super.dispose();
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
      
      private function BuildGeom(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         this.mVertexData.setPosition(_loc2_,0,0);
         this.mVertexData.setAlpha(_loc2_,1);
         _loc2_++;
         this.mVertexData.setPosition(_loc2_,this.m_fWidth,0);
         this.mVertexData.setAlpha(_loc2_,1);
         _loc2_++;
         this.mVertexData.setPosition(_loc2_,this.m_fWidth,this.m_fHeight);
         this.mVertexData.setAlpha(_loc2_,1);
         _loc2_++;
         this.mVertexData.setPosition(_loc2_,0,this.m_fHeight);
         this.mVertexData.setAlpha(_loc2_,1);
         _loc2_++;
         this.mVertexData.setPosition(_loc2_,this.m_fFadeEdge,this.m_fFadeEdge);
         this.mVertexData.setAlpha(_loc2_,0);
         _loc2_++;
         this.mVertexData.setPosition(_loc2_,this.m_fWidth - this.m_fFadeEdge,this.m_fFadeEdge);
         this.mVertexData.setAlpha(_loc2_,0);
         _loc2_++;
         this.mVertexData.setPosition(_loc2_,this.m_fWidth - this.m_fFadeEdge,this.m_fHeight - this.m_fFadeEdge);
         this.mVertexData.setAlpha(_loc2_,0);
         _loc2_++;
         this.mVertexData.setPosition(_loc2_,this.m_fFadeEdge,this.m_fHeight - this.m_fFadeEdge);
         this.mVertexData.setAlpha(_loc2_,0);
         _loc2_++;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:*;
         this.mIndexData[_loc5_ = _loc3_++] = 4;
         var _loc6_:*;
         this.mIndexData[_loc6_ = _loc3_++] = 0;
         var _loc7_:*;
         this.mIndexData[_loc7_ = _loc3_++] = 1;
         var _loc8_:*;
         this.mIndexData[_loc8_ = _loc3_++] = 4;
         var _loc9_:*;
         this.mIndexData[_loc9_ = _loc3_++] = 1;
         var _loc10_:*;
         this.mIndexData[_loc10_ = _loc3_++] = 5;
         var _loc11_:*;
         this.mIndexData[_loc11_ = _loc3_++] = 5;
         var _loc12_:*;
         this.mIndexData[_loc12_ = _loc3_++] = 1;
         var _loc13_:*;
         this.mIndexData[_loc13_ = _loc3_++] = 2;
         var _loc14_:*;
         this.mIndexData[_loc14_ = _loc3_++] = 5;
         var _loc15_:*;
         this.mIndexData[_loc15_ = _loc3_++] = 2;
         var _loc16_:*;
         this.mIndexData[_loc16_ = _loc3_++] = 6;
         var _loc17_:*;
         this.mIndexData[_loc17_ = _loc3_++] = 3;
         var _loc18_:*;
         this.mIndexData[_loc18_ = _loc3_++] = 7;
         var _loc19_:*;
         this.mIndexData[_loc19_ = _loc3_++] = 6;
         var _loc20_:*;
         this.mIndexData[_loc20_ = _loc3_++] = 3;
         var _loc21_:*;
         this.mIndexData[_loc21_ = _loc3_++] = 6;
         var _loc22_:*;
         this.mIndexData[_loc22_ = _loc3_++] = 2;
         var _loc23_:*;
         this.mIndexData[_loc23_ = _loc3_++] = 3;
         var _loc24_:*;
         this.mIndexData[_loc24_ = _loc3_++] = 0;
         var _loc25_:*;
         this.mIndexData[_loc25_ = _loc3_++] = 4;
         var _loc26_:*;
         this.mIndexData[_loc26_ = _loc3_++] = 3;
         var _loc27_:*;
         this.mIndexData[_loc27_ = _loc3_++] = 4;
         var _loc28_:*;
         this.mIndexData[_loc28_ = _loc3_++] = 7;
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
         _loc3_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,param1.mvpMatrix3D,true);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,sRenderAlpha,1);
         _loc3_.setTextureAt(0,null);
         _loc3_.drawTriangles(this.mIndexBuffer,0,this.m_iNumTris);
         _loc3_.setVertexBufferAt(0,null);
         _loc3_.setVertexBufferAt(1,null);
         _loc3_.setTextureAt(0,null);
      }
   }
}
