package zufflin.world
{
   import starling.display.Sprite;
   import zufflin.core.DeltaTime;
   
   public class World extends Sprite
   {
       
      
      protected var layers:Vector.<WorldLayer>;
      
      public function World()
      {
         this.layers = new Vector.<WorldLayer>();
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.layers.length)
         {
            this.layers[_loc1_].dispose();
            this.layers[_loc1_] = null;
            _loc1_++;
         }
         this.layers.length = 0;
         this.layers = null;
         super.dispose();
      }
      
      public function getLayer(param1:uint) : WorldLayer
      {
         return this.layers[param1];
      }
      
      public function getNumLayers() : uint
      {
         return this.layers.length;
      }
      
      public function addLayer(param1:WorldLayer) : void
      {
         this.layers.push(param1);
         param1.setWorld(this);
         this.addChild(param1);
      }
      
      public function removeLayer(param1:WorldLayer) : void
      {
         var _loc2_:int = this.layers.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.removeChild(param1);
            this.layers[_loc2_].setWorld(null);
            this.layers.splice(_loc2_,1);
         }
      }
      
      public function update(param1:EventUpdate) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.layers.length;
         var _loc4_:DeltaTime = param1.getTime();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.layers[_loc2_].update(_loc4_);
            _loc2_++;
         }
      }
      
      public function deleteObjects() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.layers.length)
         {
            this.layers[_loc1_].deleteObjects();
            _loc1_++;
         }
      }
   }
}
