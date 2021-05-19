package zufflin.physics2D
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import util.Random;
   import util.Vec2F;
   import zufflin.math.AABox2f;
   import zufflin.math.PointSet2f;
   import zufflin.math.zTriangulate;
   
   public class CollisionPoly2 extends CollisionFixture2
   {
       
      
      private var points:PointSet2f;
      
      private var indices:Vector.<int>;
      
      private var bConvex:Boolean;
      
      public function CollisionPoly2(param1:PointSet2f = null, param2:Boolean = false)
      {
         super();
         this.indices = new Vector.<int>();
         if(param1 != null)
         {
            this.setPoints(param1,param2);
         }
         else
         {
            trace("SCG: CollisionPoly2 with no pointset!");
            param2 = param2;
         }
      }
      
      public function getPoints() : PointSet2f
      {
         return this.points;
      }
      
      public function getIndices() : Vector.<int>
      {
         return this.indices;
      }
      
      override public function scale(param1:Vec2F) : void
      {
         super.scale(param1);
         this.points.scale(param1);
         if(param1.x < 0 && param1.y > 0 || param1.x > 0 && param1.y < 0)
         {
            this.points.reverse();
         }
      }
      
      override public function calcLocalBounds(param1:AABox2f) : void
      {
         return this.points.calcBounds(param1);
      }
      
      public function calcRandPointInTri(param1:Vec2F, param2:Vec2F, param3:Vec2F) : Vec2F
      {
         var _loc4_:Number = Random.RandomFloatRangeUniform(0,1);
         var _loc5_:Number = Random.RandomFloatRangeUniform(0,1);
         if(_loc4_ + _loc5_ > 1)
         {
            _loc4_ = 1 - _loc4_;
            _loc5_ = 1 - _loc5_;
         }
         var _loc6_:Number = 1 - _loc4_ - _loc5_;
         var _loc7_:Vec2F = new Vec2F(param1.x * _loc4_,param1.y * _loc4_);
         var _loc8_:Vec2F = new Vec2F(param2.x * _loc5_,param2.y * _loc5_);
         var _loc9_:Vec2F = new Vec2F(param3.x * _loc6_,param3.y * _loc6_);
         return new Vec2F(_loc7_.x + _loc8_.x + _loc9_.x,_loc7_.y + _loc8_.y + _loc9_.y);
      }
      
      override public function getRandomPositionInsideShape() : Vec2F
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.indices.length == 0)
         {
            _loc1_ = Random.RandomNumberRange(0,this.points._points.length - 2);
            _loc2_ = _loc1_ + 1;
            _loc3_ = _loc1_ + 2;
            if(_loc3_ >= this.points._points.length)
            {
               _loc3_ = 0;
            }
         }
         else
         {
            _loc5_ = this.indices.length / 3;
            _loc6_ = Random.RandomNumberRange(0,_loc5_ - 1) * 3;
            _loc1_ = this.indices[_loc6_];
            _loc2_ = this.indices[_loc6_ + 1];
            _loc3_ = this.indices[_loc6_ + 2];
         }
         var _loc4_:Vec2F;
         (_loc4_ = this.calcRandPointInTri(this.points._points[_loc1_],this.points._points[_loc2_],this.points._points[_loc3_])).rotate(rotation);
         _loc4_.x += position.x;
         _loc4_.y += position.y;
         return _loc4_;
      }
      
      override public function createCollision() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:b2PolygonShape = null;
         var _loc3_:b2FixtureDef = null;
         var _loc4_:b2Fixture = null;
         var _loc5_:Vector.<b2Vec2> = null;
         var _loc6_:Vector.<b2Vec2> = null;
         if(this.bConvex && this.points._points.length <= 8)
         {
            _loc5_ = new Vector.<b2Vec2>(this.points._points.length,true);
            _loc1_ = 0;
            while(_loc1_ < _loc5_.length)
            {
               _loc5_[_loc1_] = new b2Vec2(this.points._points[_loc1_].x,this.points._points[_loc1_].y);
               _loc5_[_loc1_].x += position.x;
               _loc5_[_loc1_].y += position.y;
               _loc1_++;
            }
            _loc2_ = new b2PolygonShape();
            _loc2_.SetAsVector(_loc5_,_loc5_.length);
            _loc3_ = new b2FixtureDef();
            _loc3_.shape = _loc2_;
            _loc3_.density = getDensity();
            _loc3_.friction = getFriction();
            _loc3_.restitution = getRestitution();
            _loc3_.filter.groupIndex = getCollisionGroup();
            _loc3_.filter.categoryBits = getCollisionCategory();
            _loc3_.filter.maskBits = getCollisionMask();
            _loc3_.isSensor = isSensor();
            (_loc4_ = getRigidBody().getB2Body().CreateFixture(_loc3_)).SetUserData(this);
            _loc4_.SetUserData2(getRigidBody());
            b2Fixtures.push(_loc4_);
         }
         else
         {
            _loc1_ = 0;
            while(_loc1_ < this.indices.length)
            {
               (_loc6_ = new Vector.<b2Vec2>(3,true))[0] = new b2Vec2(this.points._points[this.indices[_loc1_]].x + position.x,this.points._points[this.indices[_loc1_]].y + position.y);
               _loc6_[1] = new b2Vec2(this.points._points[this.indices[_loc1_ + 1]].x + position.x,this.points._points[this.indices[_loc1_ + 1]].y + position.y);
               _loc6_[2] = new b2Vec2(this.points._points[this.indices[_loc1_ + 2]].x + position.x,this.points._points[this.indices[_loc1_ + 2]].y + position.y);
               _loc2_ = new b2PolygonShape();
               _loc2_.SetAsVector(_loc6_,_loc6_.length);
               _loc3_ = new b2FixtureDef();
               _loc3_.shape = _loc2_;
               _loc3_.density = getDensity();
               _loc3_.friction = getFriction();
               _loc3_.restitution = getRestitution();
               _loc3_.filter.groupIndex = getCollisionGroup();
               _loc3_.filter.categoryBits = getCollisionCategory();
               _loc3_.filter.maskBits = getCollisionMask();
               _loc3_.isSensor = isSensor();
               (_loc4_ = getRigidBody().getB2Body().CreateFixture(_loc3_)).SetUserData(this);
               _loc4_.SetUserData2(getRigidBody());
               b2Fixtures.push(_loc4_);
               _loc1_ += 3;
            }
         }
      }
      
      public function setPoints(param1:PointSet2f, param2:Boolean) : void
      {
         this.points = param1;
         this.indices.length = 0;
         this.bConvex = param2;
         if(!this.bConvex || this.points._points.length > 8)
         {
            this.bConvex = false;
            zTriangulate.Triangulate(this.points._points,this.indices);
         }
      }
   }
}
