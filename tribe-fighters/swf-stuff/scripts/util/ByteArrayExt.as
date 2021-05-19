package util
{
   import flash.utils.ByteArray;
   
   public class ByteArrayExt
   {
       
      
      public function ByteArrayExt()
      {
         super();
      }
      
      public static function readString8_Old(param1:ByteArray) : String
      {
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc2_:int = param1.readByte();
         var _loc3_:String = new String();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = param1.readByte();
            _loc3_ += String.fromCharCode(_loc5_);
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
