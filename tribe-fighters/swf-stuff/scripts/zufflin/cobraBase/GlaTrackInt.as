package zufflin.cobraBase
{
   public class GlaTrackInt extends GlaTrack
   {
       
      
      public function GlaTrackInt()
      {
         super();
      }
      
      public function getValue(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < vKeys.length)
         {
            if(param1 == vKeys[_loc2_].getFrame())
            {
               return vKeys[_loc2_].getValue() as int;
            }
            if(_loc2_ < vKeys.length - 1 && param1 < vKeys[_loc2_ + 1].getFrame())
            {
               return vKeys[_loc2_].getValue() as int;
            }
            _loc2_++;
         }
         return vKeys[vKeys.length - 1].getValue() as int;
      }
      
      public function getValueF(param1:int, param2:Number) : int
      {
         return this.getValue(param1);
      }
   }
}
