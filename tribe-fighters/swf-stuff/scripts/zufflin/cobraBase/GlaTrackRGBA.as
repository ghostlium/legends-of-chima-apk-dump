package zufflin.cobraBase
{
   import zufflin.core.RGBA;
   
   public class GlaTrackRGBA extends GlaTrack
   {
       
      
      public function GlaTrackRGBA()
      {
         super();
      }
      
      public function getValue(param1:int) : RGBA
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:RGBA = null;
         var _loc5_:RGBA = null;
         if(vKeys.length == 0)
         {
            return new RGBA(255,255,255,255);
         }
         _loc2_ = 0;
         while(_loc2_ < vKeys.length)
         {
            if(param1 == vKeys[_loc2_].getFrame())
            {
               return vKeys[_loc2_].getValue() as RGBA;
            }
            if(_loc2_ < vKeys.length - 1 && param1 < vKeys[_loc2_ + 1].getFrame())
            {
               _loc3_ = (param1 - vKeys[_loc2_].getFrame()) / (vKeys[_loc2_ + 1].getFrame() - vKeys[_loc2_].getFrame());
               _loc4_ = vKeys[_loc2_].getValue() as RGBA;
               _loc5_ = vKeys[_loc2_ + 1].getValue() as RGBA;
               return RGBA.mix(_loc4_,_loc5_,_loc3_);
            }
            _loc2_++;
         }
         return vKeys[vKeys.length - 1].getValue() as RGBA;
      }
      
      public function getValueF(param1:int, param2:Number) : RGBA
      {
         var _loc3_:RGBA = this.getValue(param1);
         var _loc4_:RGBA = this.getValue(param1 + 1);
         return RGBA.mix(_loc3_,_loc4_,param2);
      }
   }
}
