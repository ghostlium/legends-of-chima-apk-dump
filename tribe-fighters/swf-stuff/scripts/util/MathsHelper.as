package util
{
   public class MathsHelper
   {
       
      
      public function MathsHelper()
      {
         super();
      }
      
      public static function DegToRad(param1:Number) : Number
      {
         return param1 * Math.PI / 180;
      }
      
      public static function RadToDeg(param1:Number) : Number
      {
         return param1 / Math.PI * 180;
      }
      
      public static function Clamp(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      public static function zRadRelative(param1:Number) : Number
      {
         if(param1 > Math.PI * 2 || param1 < -Math.PI * 2)
         {
            param1 = param1 % Math.PI * 2;
         }
         if(param1 > Math.PI)
         {
            return -Math.PI * 2 + param1;
         }
         if(param1 < -Math.PI)
         {
            return Math.PI * 2 + param1;
         }
         return param1;
      }
      
      public static function zDegRelative(param1:Number) : Number
      {
         if(param1 > 360 || param1 < -360)
         {
            param1 %= 360;
         }
         if(param1 > 180)
         {
            return -360 + param1;
         }
         if(param1 < -180)
         {
            return 360 + param1;
         }
         return param1;
      }
      
      public static function Lerp(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param3 <= 0)
         {
            return param1;
         }
         if(param3 >= 1)
         {
            return param2;
         }
         return param1 + (param2 - param1) * param3;
      }
   }
}
