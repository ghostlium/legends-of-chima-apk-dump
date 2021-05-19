package zufflin.cobraBase
{
   import util.Vec2F;
   import zufflin.math.AABox2f;
   
   public class GlaElementRectangle extends GlaElementPos
   {
       
      
      public var trkRotation:GlaTrackFloat;
      
      public var trkScale:GlaTrackVec2f;
      
      public function GlaElementRectangle()
      {
         super();
         this.trkRotation = new GlaTrackFloat();
         this.trkScale = new GlaTrackVec2f();
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         trkPosition.scaleData(param1);
      }
      
      public function getScale(param1:int) : Vec2F
      {
         return this.trkScale.getValue(param1);
      }
      
      public function getRotation(param1:int) : Number
      {
         return this.trkRotation.getValue(param1);
      }
      
      public function getAABox(param1:int) : AABox2f
      {
         var _loc2_:Vec2F = trkPosition.getValue(param1);
         var _loc3_:Vec2F = this.trkScale.getValue(param1);
         var _loc4_:Vec2F = new Vec2F(_loc3_.x * 0.5,_loc3_.y * 0.5);
         var _loc5_:Vec2F = new Vec2F(_loc2_.x - _loc4_.x,_loc2_.y - _loc4_.y);
         var _loc6_:Vec2F = new Vec2F(_loc2_.x + _loc4_.x,_loc2_.y + _loc4_.y);
         return new AABox2f(_loc5_,_loc6_);
      }
   }
}
