package util
{
   import starling.display.Sprite;
   import zufflin.world.WorldObj;
   
   public class SpriteExt extends Sprite
   {
       
      
      public var _worldObj:WorldObj;
      
      public function SpriteExt(param1:WorldObj)
      {
         super();
         this._worldObj = param1;
      }
      
      override public function dispose() : void
      {
         this._worldObj = null;
         super.dispose();
      }
   }
}
