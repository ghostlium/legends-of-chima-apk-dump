package util
{
   public class Random
   {
       
      
      public function Random()
      {
         super();
      }
      
      public static function RandomBool() : Boolean
      {
         return Math.random() > 0.5;
      }
      
      public static function RandomNumberRange(param1:Number, param2:Number) : Number
      {
         return Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
      }
      
      public static function RandomPortion() : Number
      {
         return Math.random();
      }
      
      public static function RandomFloatRangeUniform(param1:Number, param2:Number) : Number
      {
         return Math.random() * (param2 - param1) + param1;
      }
      
      public static function RandomChar() : int
      {
         return RandomNumberRange(0,255);
      }
   }
}
