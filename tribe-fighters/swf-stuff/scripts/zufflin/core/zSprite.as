package zufflin.core
{
   import starling.textures.Texture;
   
   public class zSprite
   {
       
      
      public var spr_name:String;
      
      public var _tex:Texture;
      
      public function zSprite(param1:SCG_Texture)
      {
         super();
         if(param1 != null)
         {
            this.spr_name = param1._name;
            this._tex = param1._texture;
         }
      }
      
      public function dispose() : void
      {
         if(this._tex != null)
         {
            this._tex.dispose();
            this._tex = null;
            this.spr_name = null;
         }
      }
      
      public function clone() : zSprite
      {
         var _loc1_:zSprite = new zSprite(null);
         _loc1_.spr_name = this.spr_name;
         _loc1_._tex = this._tex;
         return _loc1_;
      }
      
      public function setName(param1:String) : void
      {
         this.spr_name = param1;
      }
      
      public function getName() : String
      {
         return this.spr_name;
      }
      
      public function getTexture() : Texture
      {
         return this._tex;
      }
      
      public function getWidth() : Number
      {
         return this._tex.width;
      }
      
      public function getHeight() : Number
      {
         return this._tex.height;
      }
   }
}
