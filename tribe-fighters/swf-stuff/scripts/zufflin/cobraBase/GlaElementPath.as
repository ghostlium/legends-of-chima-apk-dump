package zufflin.cobraBase
{
   import flash.geom.Point;
   import util.Vec2F;
   
   public class GlaElementPath extends GlaElementPos
   {
       
      
      public var vPoints:Vector.<Vec2F>;
      
      public var bLooping:Boolean;
      
      public var bSmooth:Boolean;
      
      public var _length:Number;
      
      public function GlaElementPath()
      {
         super();
         this.vPoints = new Vector.<Vec2F>();
         this.bLooping = false;
         this.bSmooth = false;
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         var _loc2_:uint = 0;
         while(_loc2_ < this.vPoints.length)
         {
            this.vPoints[_loc2_].scaleBy(param1.scale);
            _loc2_++;
         }
         this.calcLength();
      }
      
      public function calcLength() : Number
      {
         var _loc1_:Point = null;
         this._length = 0;
         var _loc2_:uint = 1;
         while(_loc2_ < this.vPoints.length)
         {
            _loc1_ = this.vPoints[_loc2_].subtract(this.vPoints[_loc2_ - 1]);
            this._length += _loc1_.length;
            _loc2_++;
         }
         return this._length;
      }
      
      public function getPoints() : Vector.<Vec2F>
      {
         return this.vPoints;
      }
      
      public function isLooping() : Boolean
      {
         return this.bLooping;
      }
      
      public function isSmooth() : Boolean
      {
         return this.bSmooth;
      }
      
      public function getLength() : Number
      {
         return this._length;
      }
   }
}
