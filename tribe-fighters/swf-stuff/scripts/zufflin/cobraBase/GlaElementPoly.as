package zufflin.cobraBase
{
   import util.Vec2F;
   import zufflin.math.PointSet2f;
   
   public class GlaElementPoly extends GlaElementPos
   {
       
      
      public var vPoints:PointSet2f;
      
      public var vIndicies:Vector.<int>;
      
      public var bConvex:Boolean;
      
      public function GlaElementPoly()
      {
         super();
         this.bConvex = false;
         this.vPoints = new PointSet2f();
         this.vIndicies = new Vector.<int>();
      }
      
      public function isConvex() : Boolean
      {
         return this.bConvex;
      }
      
      public function getPoints() : Vector.<Vec2F>
      {
         return this.vPoints._points;
      }
      
      public function getIndicies() : Vector.<int>
      {
         return this.vIndicies;
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         var _loc2_:Vec2F = null;
         super.scaleData(param1);
         for each(_loc2_ in this.vPoints._points)
         {
            _loc2_.x *= param1.scale;
            _loc2_.y *= param1.scale;
         }
      }
   }
}
