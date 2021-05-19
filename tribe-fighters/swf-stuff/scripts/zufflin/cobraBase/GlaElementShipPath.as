package zufflin.cobraBase
{
   import util.Vec2F;
   
   public class GlaElementShipPath extends GlaElementPos
   {
       
      
      public var vPoints:Vector.<Vec2F>;
      
      public var bSmooth:Boolean;
      
      public var _length:Number;
      
      public var _shipDetails:Vector.<ShipDetails>;
      
      public var _rewardIDs:Vector.<int>;
      
      public var _time:Number;
      
      public var _speed:Number;
      
      public var _endspeed:Number;
      
      public var _timebewtween:Number;
      
      public var _delay:Number;
      
      public var _healtmod:Number;
      
      public var _numships:int;
      
      public var _numrewards:int;
      
      public var _numCycles:int;
      
      public var _cycleType:int;
      
      public var _scrollPath:Boolean;
      
      public function GlaElementShipPath()
      {
         super();
         this.vPoints = new Vector.<Vec2F>();
         this._rewardIDs = new Vector.<int>();
         this._shipDetails = new Vector.<ShipDetails>();
         this.bSmooth = false;
      }
      
      public function getPoints() : Vector.<Vec2F>
      {
         return this.vPoints;
      }
      
      public function getShipDetails() : Vector.<ShipDetails>
      {
         return this._shipDetails;
      }
      
      public function getRewards() : Vector.<int>
      {
         return this._rewardIDs;
      }
      
      public function isSmooth() : Boolean
      {
         return this.bSmooth;
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this.vPoints.length)
         {
            this.vPoints[_loc2_].scaleBy(param1.scale);
            _loc2_++;
         }
         this.calcLength();
      }
      
      public function getLength() : Number
      {
         return this._length;
      }
      
      public function calcLength() : Number
      {
         var _loc1_:Vec2F = null;
         this._length = 0;
         _loc1_ = new Vec2F();
         var _loc2_:int = 1;
         while(_loc2_ < this.vPoints.length)
         {
            _loc1_.x = this.vPoints[_loc2_].x - this.vPoints[_loc2_ - 1].x;
            _loc1_.x = this.vPoints[_loc2_].y - this.vPoints[_loc2_ - 1].y;
            this._length += _loc1_.length;
            _loc2_++;
         }
         return this._length;
      }
   }
}
