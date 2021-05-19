package zufflin.world2D
{
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import util.SpriteExt;
   import zufflin.world.WorldLayer;
   
   public class Component2 extends Sprite
   {
       
      
      private var zname:String;
      
      public function Component2()
      {
         super();
      }
      
      public function getLayerObj() : Object
      {
         if(this.parent is SpriteExt)
         {
            return (this.parent as SpriteExt)._worldObj;
         }
         if(this.parent is World2Obj)
         {
            return this.parent as World2Obj;
         }
         throw new Error("SCG LAYEROBJ IS NOT WORLD2OBJ!!!");
      }
      
      public function getWorldObj() : Object
      {
         return this.getLayerObj();
      }
      
      public function setName(param1:String) : Boolean
      {
         this.zname = param1;
         return true;
      }
      
      private function getLayerResursive(param1:Object) : WorldLayer
      {
         if(param1.parent == null)
         {
            return null;
         }
         if(param1.parent is WorldLayer)
         {
            return param1.parent as WorldLayer;
         }
         return this.getLayerResursive(param1.parent);
      }
      
      public function getLayer() : WorldLayer
      {
         return this.getLayerResursive(this);
      }
      
      public function getWorld() : World2
      {
         return this.getLayerObj().getWorld() as World2;
      }
      
      public function getContainer() : DisplayObject
      {
         return this.parent;
      }
   }
}
