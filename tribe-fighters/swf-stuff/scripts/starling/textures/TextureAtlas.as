package starling.textures
{
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import starling.utils.cleanMasterString;
   
   public class TextureAtlas
   {
      
      private static var sNames:Vector.<String> = new Vector.<String>(0);
       
      
      private var mAtlasTexture:Texture;
      
      private var mSubTextures:Dictionary;
      
      private var mSubTextureNames:Vector.<String>;
      
      public function TextureAtlas(param1:Texture, param2:XML = null)
      {
         super();
         this.mSubTextures = new Dictionary();
         this.mAtlasTexture = param1;
         if(param2)
         {
            this.parseAtlasXml(param2);
         }
      }
      
      private static function parseBool(param1:String) : Boolean
      {
         return param1.toLowerCase() == "true";
      }
      
      public function dispose() : void
      {
         this.mAtlasTexture.dispose();
      }
      
      protected function parseAtlasXml(param1:XML) : void
      {
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Boolean = false;
         var _loc2_:Number = this.mAtlasTexture.scale;
         var _loc3_:Rectangle = new Rectangle();
         var _loc4_:Rectangle = new Rectangle();
         for each(_loc5_ in param1.SubTexture)
         {
            _loc6_ = cleanMasterString(_loc5_.@name);
            _loc7_ = parseFloat(_loc5_.@x) / _loc2_;
            _loc8_ = parseFloat(_loc5_.@y) / _loc2_;
            _loc9_ = parseFloat(_loc5_.@width) / _loc2_;
            _loc10_ = parseFloat(_loc5_.@height) / _loc2_;
            _loc11_ = parseFloat(_loc5_.@frameX) / _loc2_;
            _loc12_ = parseFloat(_loc5_.@frameY) / _loc2_;
            _loc13_ = parseFloat(_loc5_.@frameWidth) / _loc2_;
            _loc14_ = parseFloat(_loc5_.@frameHeight) / _loc2_;
            _loc15_ = parseBool(_loc5_.@rotated);
            _loc3_.setTo(_loc7_,_loc8_,_loc9_,_loc10_);
            _loc4_.setTo(_loc11_,_loc12_,_loc13_,_loc14_);
            if(_loc13_ > 0 && _loc14_ > 0)
            {
               this.addRegion(_loc6_,_loc3_,_loc4_,_loc15_);
            }
            else
            {
               this.addRegion(_loc6_,_loc3_,null,_loc15_);
            }
         }
      }
      
      public function getTexture(param1:String) : Texture
      {
         return this.mSubTextures[param1];
      }
      
      public function getTextures(param1:String = "", param2:Vector.<Texture> = null) : Vector.<Texture>
      {
         var _loc3_:String = null;
         if(param2 == null)
         {
            param2 = new Vector.<Texture>(0);
         }
         for each(_loc3_ in this.getNames(param1,sNames))
         {
            param2[param2.length] = this.getTexture(_loc3_);
         }
         sNames.length = 0;
         return param2;
      }
      
      public function getNames(param1:String = "", param2:Vector.<String> = null) : Vector.<String>
      {
         var _loc3_:String = null;
         if(param2 == null)
         {
            param2 = new Vector.<String>(0);
         }
         if(this.mSubTextureNames == null)
         {
            this.mSubTextureNames = new Vector.<String>(0);
            for(this.mSubTextureNames[this.mSubTextureNames.length] in this.mSubTextures)
            {
            }
            this.mSubTextureNames.sort(Array.CASEINSENSITIVE);
         }
         for each(_loc3_ in this.mSubTextureNames)
         {
            if(_loc3_.indexOf(param1) == 0)
            {
               param2[param2.length] = _loc3_;
            }
         }
         return param2;
      }
      
      public function getRegion(param1:String) : Rectangle
      {
         var _loc2_:SubTexture = this.mSubTextures[param1];
         return !!_loc2_ ? _loc2_.region : null;
      }
      
      public function getFrame(param1:String) : Rectangle
      {
         var _loc2_:SubTexture = this.mSubTextures[param1];
         return !!_loc2_ ? _loc2_.frame : null;
      }
      
      public function getRotation(param1:String) : Boolean
      {
         var _loc2_:SubTexture = this.mSubTextures[param1];
         return !!_loc2_ ? Boolean(_loc2_.rotated) : false;
      }
      
      public function addRegion(param1:String, param2:Rectangle, param3:Rectangle = null, param4:Boolean = false) : void
      {
         this.mSubTextures[param1] = new SubTexture(this.mAtlasTexture,param2,false,param3,param4);
         this.mSubTextureNames = null;
      }
      
      public function removeRegion(param1:String) : void
      {
         var _loc2_:SubTexture = this.mSubTextures[param1];
         if(_loc2_)
         {
            _loc2_.dispose();
         }
         delete this.mSubTextures[param1];
         this.mSubTextureNames = null;
      }
      
      public function get texture() : Texture
      {
         return this.mAtlasTexture;
      }
   }
}
