package zufflin.cobraBase
{
   import util.Vec2F;
   
   public class GlaTrackVec2f extends GlaTrack
   {
       
      
      public function GlaTrackVec2f()
      {
         super();
      }
      
      public function scaleData(param1:ScaleInfo) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Vec2F = null;
         _loc2_ = 0;
         while(_loc2_ < vKeys.length)
         {
            _loc3_ = vKeys[_loc2_].value as Vec2F;
            _loc3_.scaleBy(param1.scale);
            _loc2_++;
         }
      }
      
      public function getValue(param1:int) : Vec2F
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Vec2F = null;
         var _loc6_:Vec2F = null;
         var _loc2_:Vec2F = new Vec2F();
         if(vKeys.length == 0)
         {
            return _loc2_;
         }
         _loc3_ = 0;
         while(_loc3_ < vKeys.length)
         {
            if(param1 == vKeys[_loc3_].getFrame())
            {
               return vKeys[_loc3_].getValue() as Vec2F;
            }
            if(_loc3_ < vKeys.length - 1 && param1 < vKeys[_loc3_ + 1].getFrame())
            {
               _loc4_ = (param1 - vKeys[_loc3_].getFrame()) / (vKeys[_loc3_ + 1].getFrame() - vKeys[_loc3_].getFrame());
               _loc5_ = vKeys[_loc3_].getValue() as Vec2F;
               _loc6_ = vKeys[_loc3_ + 1].getValue() as Vec2F;
               _loc2_.x = _loc5_.x + (_loc6_.x - _loc5_.x) * _loc4_;
               _loc2_.y = _loc5_.y + (_loc6_.y - _loc5_.y) * _loc4_;
               return _loc2_;
            }
            _loc3_++;
         }
         return vKeys[vKeys.length - 1].getValue() as Vec2F;
      }
      
      public function getValueF(param1:int, param2:Number) : Vec2F
      {
         var _loc3_:Vec2F = this.getValue(param1);
         var _loc4_:Vec2F = this.getValue(param1 + 1);
         return new Vec2F(_loc3_.x + (_loc4_.x - _loc3_.x) * param2,_loc3_.y + (_loc4_.y - _loc3_.y) * param2);
      }
      
      public function setValues(param1:Vec2F) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Vec2F = null;
         _loc2_ = 0;
         while(_loc2_ < vKeys.length)
         {
            _loc3_ = vKeys[_loc2_].value as Vec2F;
            _loc3_.x = param1.x;
            _loc3_.y = param1.y;
            _loc2_++;
         }
      }
   }
}
