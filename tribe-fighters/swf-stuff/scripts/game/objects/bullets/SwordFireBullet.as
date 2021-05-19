package game.objects.bullets
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.events.EventObjectDeleted;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   
   public class SwordFireBullet extends Bullet
   {
       
      
      public function SwordFireBullet(param1:Vec2F, param2:Vec2F, param3:int, param4:int)
      {
         super(GameConsts.eFireChima,param3,param4,1,"sword_fire_bullet",param1,param2,5);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function deleteThis() : void
      {
         this.eventObjectDeleted();
         super.deleteThis();
      }
      
      override public function eventObjectDeleted(param1:EventObjectDeleted = null) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Particle2D = null;
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         var _loc6_:Vec2F = null;
         super.eventObjectDeleted(param1);
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc3_ = _pParticles.addParticle();
            if(_loc3_ != null)
            {
               _loc3_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc3_.setSprite(GameRes.get()._pTrailFireSprite);
               _loc4_ = SCG_GetRigidBody().getRandomPositionInsideCollision();
               _loc5_ = new Vec2F(getPosition().x + _loc4_.x,getPosition().y + _loc4_.y);
               _loc3_.setPosition(_loc5_);
               (_loc6_ = new Vec2F(_vel.getNormal().x,_vel.getNormal().y)).scaleBy(-Random.RandomFloatRangeUniform(400,500));
               _loc3_.setVelocity(_loc6_);
               _loc3_.setSize(Random.RandomFloatRangeUniform(1,1.7));
               _loc3_.setLife(0.5);
               _loc3_.setColor(new RGBA(255,255,255,255));
               _loc3_.addAlphaKey(255);
               _loc3_.addAlphaKey(0);
               _loc3_.finalise();
            }
            _loc2_++;
         }
      }
      
      override public function updateParticles(param1:Number) : void
      {
         var _loc2_:Particle2D = null;
         var _loc3_:Vec2F = null;
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         if(Random.RandomNumberRange(0,10000) % 2 == 0)
         {
            _loc2_ = _pParticles.addParticle();
            if(_loc2_ != null)
            {
               _loc2_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc2_.setSprite(GameRes.get()._pTrailFireSprite);
               _loc3_ = this.SCG_GetRigidBody().getRandomPositionInsideCollision();
               _loc4_ = new Vec2F(getPosition().x + _loc3_.x,getPosition().y + _loc3_.y);
               _loc2_.setPosition(_loc4_);
               (_loc5_ = new Vec2F(_vel.getNormal().x,_vel.getNormal().y)).scaleBy(-Random.RandomFloatRangeUniform(400,500));
               _loc2_.setSize(Random.RandomFloatRangeUniform(1,1.7));
               _loc2_.setLife(0.5);
               _loc2_.setColor(new RGBA(255,255,255,255));
               _loc2_.addAlphaKey(255);
               _loc2_.addAlphaKey(0);
               _loc2_.finalise();
            }
         }
      }
      
      override public function reflectParticles(param1:Vec2F, param2:Vec2F) : void
      {
         var _loc3_:Particle2D = null;
         _loc3_ = _pParticles.addParticle();
         if(_loc3_ != null)
         {
            _loc3_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
            _loc3_.setSprite(GameRes.get()._pHitFireSprite);
            _loc3_.setPosition(param1);
            _loc3_.setSize2(0,Random.RandomFloatRangeUniform(0.7,1.3));
            _loc3_.setLife(Random.RandomFloatRangeUniform(0.15,0.25));
            _loc3_.setColor(new RGBA(255,255,255,255));
            _loc3_.setRotation(Random.RandomFloatRangeUniform(0,Math.PI * 2));
            _loc3_.addAlphaKey(255);
            _loc3_.addAlphaKey(255);
            _loc3_.addAlphaKey(0);
            _loc3_.finalise();
         }
      }
   }
}
