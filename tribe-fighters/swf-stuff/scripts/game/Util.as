package game
{
   import util.Vec2F;
   
   public class Util
   {
       
      
      public function Util()
      {
         super();
      }
      
      public static function getFormattedNumber(param1:uint) : String
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc2_:String = "";
         var _loc3_:String = GameWorld.get().getLanguage().getString("number_seperator");
         if(param1 == 0)
         {
            _loc2_ = "0";
         }
         else
         {
            _loc4_ = param1;
            _loc5_ = 0;
            while(_loc4_ > 0)
            {
               _loc2_ = (_loc6_ = uint(_loc4_ % 10)).toString() + _loc2_;
               _loc5_++;
               _loc4_ /= 10;
               if(_loc5_ == 3 && _loc4_ > 0)
               {
                  _loc5_ = 0;
                  _loc2_ = _loc3_ + _loc2_;
               }
            }
         }
         return _loc2_;
      }
      
      public static function virtualToScreen_float(param1:Number) : Number
      {
         return param1;
      }
      
      public static function virtualToScreen_vec(param1:Vec2F) : Vec2F
      {
         return param1;
      }
      
      public static function isSpecialCharacterAvailable(param1:String) : Boolean
      {
         return false;
      }
   }
}
