package zufflin.cobraBase
{
   import zufflin.core.zSprite;
   
   public class GlaTrackTexture extends GlaTrack
   {
       
      
      public function GlaTrackTexture()
      {
         super();
      }
      
      public function getValue(param1:int) : zSprite
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < vKeys.length)
         {
            if(param1 == vKeys[_loc2_].getFrame())
            {
               return vKeys[_loc2_].getValue() as zSprite;
            }
            if(_loc2_ < vKeys.length - 1 && param1 < vKeys[_loc2_ + 1].getFrame())
            {
               return vKeys[_loc2_].getValue() as zSprite;
            }
            _loc2_++;
         }
         return vKeys[vKeys.length - 1].getValue() as zSprite;
      }
   }
}
