package zufflin.core
{
   import util.Random;
   
   public class zSpriteList
   {
       
      
      public var _list:Vector.<zSprite>;
      
      public function zSpriteList()
      {
         super();
         this._list = new Vector.<zSprite>();
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._list.length)
         {
            this._list[_loc1_].dispose();
            this._list[_loc1_] = null;
            _loc1_++;
         }
         this._list.length = 0;
         this._list = null;
      }
      
      public function rand_element() : zSprite
      {
         var _loc1_:int = Random.RandomNumberRange(0,this._list.length - 1);
         return this._list[_loc1_];
      }
   }
}
