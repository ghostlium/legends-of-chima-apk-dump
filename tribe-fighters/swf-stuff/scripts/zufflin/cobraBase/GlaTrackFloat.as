package zufflin.cobraBase
{
   public class GlaTrackFloat extends GlaTrack
   {
       
      
      public function GlaTrackFloat()
      {
         super();
      }
      
      public function getValue(param1:int) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(vKeys.length == 0)
         {
            return 0;
         }
         _loc2_ = 0;
         while(_loc2_ < vKeys.length)
         {
            if(param1 == vKeys[_loc2_].getFrame())
            {
               return vKeys[_loc2_].getValue() as Number;
            }
            if(_loc2_ < vKeys.length - 1 && param1 < vKeys[_loc2_ + 1].getFrame())
            {
               _loc3_ = (param1 - vKeys[_loc2_].getFrame()) / (vKeys[_loc2_ + 1].getFrame() - vKeys[_loc2_].getFrame());
               _loc4_ = vKeys[_loc2_].getValue() as Number;
               _loc5_ = vKeys[_loc2_ + 1].getValue() as Number;
               return _loc4_ + (_loc5_ - _loc4_) * _loc3_;
            }
            _loc2_++;
         }
         return vKeys[vKeys.length - 1].getValue() as Number;
      }
      
      public function getValueF(param1:int, param2:Number) : Number
      {
         var _loc3_:Number = this.getValue(param1);
         var _loc4_:Number = this.getValue(param1 + 1);
         return _loc3_ + (_loc4_ - _loc3_) * param2;
      }
   }
}
