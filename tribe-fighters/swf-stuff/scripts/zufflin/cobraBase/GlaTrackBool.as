package zufflin.cobraBase
{
   public class GlaTrackBool extends GlaTrack
   {
       
      
      public function GlaTrackBool()
      {
         super();
      }
      
      public function getValue(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < vKeys.length)
         {
            if(param1 == vKeys[_loc2_].getFrame())
            {
               return vKeys[_loc2_].getValue() as Boolean;
            }
            if(_loc2_ < vKeys.length - 1 && param1 < vKeys[_loc2_ + 1].getFrame())
            {
               return vKeys[_loc2_].getValue() as Boolean;
            }
            _loc2_++;
         }
         return vKeys[vKeys.length - 1].getValue() as Boolean;
      }
      
      public function getValueF(param1:int, param2:Number) : Boolean
      {
         return this.getValue(param1);
      }
   }
}
