package game.objects.bullets
{
   import game.GameConsts;
   import game.GameRes;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.core.zSprite;
   
   public class DiscFireBullet extends Bullet
   {
       
      
      public var _pDiscParticle:zSprite;
      
      public function DiscFireBullet(param1:Vec2F, param2:Vec2F, param3:int, param4:int)
      {
         super(GameConsts.eFireChima,param3,param4,1,"disc_fire_bullet",param1,param2,0);
      }
      
      override public function collisionParticles() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:Particle2D = null;
         var _loc3_:Vec2F = null;
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         _loc1_ = 0;
         while(_loc1_ < 5)
         {
            _loc2_ = _pParticles.addParticle();
            if(_loc2_ != null)
            {
               _loc2_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc2_.setSprite(GameRes.get()._pDiscTrailFireSprite);
               _loc3_ = new Vec2F(getPosition().x + Random.RandomFloatRangeUniform(-20,20),getPosition().y + Random.RandomFloatRangeUniform(-20,20));
               _loc2_.setPosition(_loc3_);
               (_loc4_ = _vel.getNormal()).scaleBy(Random.RandomFloatRangeUniform(400,500));
               (_loc5_ = new Vec2F(_loc4_.x,_loc4_.y)).rotate(Random.RandomFloatRangeUniform(-Math.PI * 0.35,Math.PI * 0.35));
               _loc2_.setVelocity(_loc5_);
               _loc2_.setRotation(_loc5_.getAngle());
               _loc2_.setSize(Random.RandomFloatRangeUniform(1.3,2.3));
               _loc2_.setLife(0.3);
               _loc2_.setColor(new RGBA(255,255,255,255));
               _loc2_.addAlphaKey(255);
               _loc2_.addAlphaKey(0);
               _loc2_.finalise();
            }
            _loc1_++;
         }
      }
      
      override public function updateParticles(param1:Number) : void
      {
         var _loc2_:Particle2D = null;
         var _loc3_:Vec2F = null;
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         if(Random.RandomNumberRange(0,10000) % 3 == 0)
         {
            _loc2_ = _pParticles.addParticle();
            if(_loc2_ != null)
            {
               _loc2_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc2_.setSprite(GameRes.get()._pDiscTrailFireSprite);
               _loc3_ = new Vec2F(0,-20);
               _loc3_.rotate(Random.RandomFloatRangeUniform(0,Math.PI * 2));
               _loc4_ = new Vec2F(getPosition().x + _loc3_.x,getPosition().y + _loc3_.y);
               _loc2_.setPosition(_loc4_);
               _loc3_.normalize(1);
               _loc2_.setRotation(_loc3_.getAngle());
               _loc3_.scaleBy(Random.RandomFloatRangeUniform(50,100));
               _loc2_.setVelocity(_loc3_);
               _loc2_.setSize2(Random.RandomFloatRangeUniform(0.7,1),0);
               _loc2_.setLife(0.2);
               _loc2_.setColor(new RGBA(255,255,255,255));
               _loc2_.addAlphaKey(255);
               _loc2_.addAlphaKey(0);
               _loc2_.finalise();
            }
            _loc2_ = _pParticles.addParticle();
            if(_loc2_ != null)
            {
               _loc2_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc2_.setSprite(GameRes.get()._pTrailFireSprite);
               _loc5_ = new Vec2F(getPosition().x + Random.RandomFloatRangeUniform(-20,20),getPosition().y + Random.RandomFloatRangeUniform(-20,20));
               _loc2_.setPosition(_loc5_);
               _loc2_.setSize(Random.RandomFloatRangeUniform(1,1.7));
               _loc2_.setLife(Random.RandomFloatRangeUniform(0.3,0.5));
               _loc2_.setColor(new RGBA(255,255,255,255));
               _loc2_.addAlphaKey(255);
               _loc2_.addAlphaKey(0);
               _loc2_.finalise();
            }
         }
      }
   }
}
