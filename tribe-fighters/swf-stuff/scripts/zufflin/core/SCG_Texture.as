package zufflin.core
{
   import starling.textures.Texture;
   
   public class SCG_Texture
   {
       
      
      public var _texture:Texture;
      
      public var _name:String;
      
      public function SCG_Texture(param1:Texture, param2:String)
      {
         super();
         this._texture = param1;
         this._name = param2;
      }
      
      public function dispose() : void
      {
         this._texture.dispose();
         this._texture = null;
         this._name = null;
      }
   }
}
