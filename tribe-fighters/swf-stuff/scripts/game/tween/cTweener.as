package game.tween
{
   import starling.animation.Juggler;
   import starling.animation.Tween;
   
   public class cTweener
   {
      
      public static const LINEAR:int = 0;
      
      public static const SINE:int = 1;
      
      public static const QUINT:int = 2;
      
      public static const QUART:int = 3;
      
      public static const QUAD:int = 4;
      
      public static const EXPO:int = 5;
      
      public static const ELASTIC:int = 6;
      
      public static const CUBIC:int = 7;
      
      public static const CIRC:int = 8;
      
      public static const BOUNCE:int = 9;
      
      public static const BACK:int = 10;
      
      public static const SHAKE:int = 11;
      
      public static const NUM_TWEEN_FUNCTIONS:int = 12;
      
      public static const EASE_IN:int = 0;
      
      public static const EASE_OUT:int = 1;
      
      public static const EASE_IN_OUT:int = 2;
      
      public static const NUM_EASE_TYPES:int = 3;
       
      
      private var juggler:Juggler;
      
      public function cTweener()
      {
         super();
         this.juggler = new Juggler();
      }
      
      public function dispose() : void
      {
         this.juggler.purge();
         this.juggler = null;
      }
      
      public function reset() : void
      {
         this.juggler.purge();
      }
      
      public function tick(param1:Number) : void
      {
         this.juggler.advanceTime(param1);
      }
      
      private function getTransition(param1:int, param2:int) : String
      {
         var _loc3_:String = "linear";
         switch(param1)
         {
            case LINEAR:
               _loc3_ = "linear";
               break;
            case SINE:
            case QUINT:
               switch(param2)
               {
                  case EASE_IN:
                     _loc3_ = "easeIn";
                     break;
                  case EASE_OUT:
                     _loc3_ = "easeOut";
                     break;
                  case EASE_IN_OUT:
                     _loc3_ = "easeInOut";
                     break;
                  default:
                     trace("unhandled");
               }
               break;
            case QUART:
               switch(param2)
               {
                  case EASE_IN:
                     _loc3_ = "easeIn";
                     break;
                  case EASE_OUT:
                     _loc3_ = "easeOut";
                     break;
                  case EASE_IN_OUT:
                     _loc3_ = "easeInOut";
                     break;
                  default:
                     trace("unhandled");
               }
               break;
            case QUAD:
               trace("unhandled");
               break;
            case EXPO:
               trace("unhandled");
               break;
            case ELASTIC:
               switch(param2)
               {
                  case EASE_IN:
                     _loc3_ = "easeInElastic";
                     break;
                  case EASE_OUT:
                     _loc3_ = "easeOutElastic";
                     break;
                  case EASE_IN_OUT:
                     _loc3_ = "easeInOutElastic";
                     break;
                  default:
                     trace("unhandled");
               }
               break;
            case CUBIC:
               _loc3_ = "easeInOut";
               break;
            case CIRC:
               switch(param2)
               {
                  case EASE_IN:
                     _loc3_ = "easeIn";
                     break;
                  case EASE_OUT:
                     _loc3_ = "easeOut";
                     break;
                  case EASE_IN_OUT:
                     _loc3_ = "easeInOut";
                     break;
                  default:
                     trace("unhandled");
               }
               break;
            case BOUNCE:
               switch(param2)
               {
                  case EASE_IN:
                     _loc3_ = "easeInBounce";
                     break;
                  case EASE_OUT:
                     _loc3_ = "easeOutBounce";
                     break;
                  case EASE_IN_OUT:
                     _loc3_ = "easeInOutBounce";
                     break;
                  default:
                     trace("unhandled");
               }
               break;
            case BACK:
               switch(param2)
               {
                  case EASE_IN:
                     _loc3_ = "easeInBack";
                     break;
                  case EASE_OUT:
                     _loc3_ = "easeOutBack";
                     break;
                  case EASE_IN_OUT:
                     _loc3_ = "easeInOutBack";
                     break;
                  default:
                     trace("unhandled");
               }
               break;
            case SHAKE:
               trace("unhandled");
               break;
            default:
               trace("unhandled");
         }
         return _loc3_;
      }
      
      public function addTween(param1:Object, param2:String, param3:String, param4:Number, param5:Number, param6:Number, param7:Number, param8:int = 10, param9:int = 2, param10:uint = 0, param11:Boolean = true) : void
      {
         var _loc12_:Tween;
         (_loc12_ = new Tween(param1,param6,this.getTransition(param8,param9))).delay = param7;
         if(param11)
         {
            param1[param3] = param4;
         }
         _loc12_.animate(param3,param5);
         this.juggler.add(_loc12_);
      }
   }
}
