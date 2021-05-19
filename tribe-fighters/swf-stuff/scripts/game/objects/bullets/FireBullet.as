package game.objects.bullets
{
   import game.GameConsts;
   import game.GameRes;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   
   public class FireBullet extends Bullet
   {
       
      
      public function FireBullet(param1:Vec2F, param2:Vec2F, param3:int, param4:int)
      {
         super(GameConsts.eFireChima,param3,param4,1,"gun_fire_bullet",param1,param2,0);
      }
      
      override public function updateParticles(param1:Number) : void
      {
         var _loc2_:Particle2D = null;
         if(Random.RandomNumberRange(0,10000) % 2 == 0)
         {
            _loc2_ = _pParticles.addParticle();
            if(_loc2_ != null)
            {
               _loc2_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc2_.setSprite(GameRes.get()._pTrailFireSprite);
               _loc2_.setPosition(new Vec2F(getPosition().x + Random.RandomFloatRangeUniform(-9,9),getPosition().y + Random.RandomFloatRangeUniform(-9,9)));
               _loc2_.setSize(Random.RandomFloatRangeUniform(1,1.7));
               _loc2_.setLife(0.4);
               _loc2_.setColor(new RGBA(255,255,255,255));
               _loc2_.addAlphaKey(255);
               _loc2_.addAlphaKey(0);
               _loc2_.finalise();
            }
         }
      }
      
      override public function collisionParticles() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:Particle2D = null;
         var _loc3_:Vec2F = null;
         var _loc4_:Vec2F = null;
         _loc1_ = 0;
         while(_loc1_ < 10)
         {
            _loc2_ = _pParticles.addParticle();
            if(_loc2_ != null)
            {
               _loc2_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc2_.setSprite(GameRes.get()._pTrailFireSprite);
               _loc3_ = new Vec2F(getPosition().x + Random.RandomFloatRangeUniform(-9,9),getPosition().y + Random.RandomFloatRangeUniform(-9,9));
               _loc2_.setPosition(_loc3_);
               (_loc4_ = new Vec2F(_vel.getNormal().x,_vel.getNormal().y)).scaleBy(-Random.RandomFloatRangeUniform(400,500));
               _loc4_.rotate(Random.RandomFloatRangeUniform(-Math.PI * 0.35,Math.PI * 0.35));
               _loc2_.setVelocity(_loc4_);
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
   }
}
