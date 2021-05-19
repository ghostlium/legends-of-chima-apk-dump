package zufflin.cobraBase
{
   import zufflin.core.SCG_Texture;
   
   public class GlaPropTexture extends GlaProp
   {
       
      
      protected var pImage:SCG_Texture;
      
      protected var _path:String;
      
      public function GlaPropTexture(param1:String, param2:SCG_Texture, param3:String)
      {
         super();
         setName(param1);
         this.pImage = param2;
         this._path = param3;
      }
      
      override public function dispose() : void
      {
         this.pImage.dispose();
         this.pImage = null;
         super.dispose();
      }
      
      public function getTexture() : SCG_Texture
      {
         return this.pImage;
      }
      
      public function getPathNameNoExt() : String
      {
         var _loc1_:String = this._path.replace(".png","");
         var _loc2_:int = _loc1_.search("/");
         while(_loc2_ != -1)
         {
            _loc1_ = _loc1_.slice(_loc2_ + 1);
            _loc2_ = name.search("/");
         }
         return _loc1_;
      }
      
      public function getNameNoExt() : String
      {
         return this._path.replace(".png","");
      }
   }
}
