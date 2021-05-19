package game.objects.guns
{
   import game.GameRes;
   import game.objects.ChimaGameObject;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.world2D.Component2;
   import zufflin.world2D.RenderableParticleSystem;
   
   public class Gun extends Component2
   {
       
      
      public var _side:int;
      
      public var _position:Vec2F;
      
      public var _pMuzzleParticles:RenderableParticleSystem;
      
      public function Gun(param1:int, param2:Vec2F)
      {
         super();
         this._side = param1;
         this._position = new Vec2F(param2.x,param2.y);
         this._pMuzzleParticles = null;
         setName("Gun");
      }
      
      public function fire() : void
      {
      }
      
      public function getPosition() : Vec2F
      {
         var _loc1_:Vec2F = new Vec2F((getWorldObj() as ChimaGameObject).getPosition().x,(getWorldObj() as ChimaGameObject).getPosition().y);
         _loc1_.x += this._position.x;
         _loc1_.y += this._position.y;
         return _loc1_;
      }
      
      public function wandMuzzleFlash(param1:Vec2F, param2:Boolean) : void
      {
         var _loc3_:Particle2D = null;
         var _loc4_:uint = 0;
         var _loc8_:Vec2F = null;
         if(!this._pMuzzleParticles)
         {
            this._pMuzzleParticles = new RenderableParticleSystem(25);
            this._pMuzzleParticles.setWorldSpace(false);
            getWorldObj().addComponent(this._pMuzzleParticles);
         }
         var _loc5_:Number = Math.PI * -0.25;
         var _loc6_:int = 5;
         var _loc7_:Number = Math.abs(_loc5_ * 2 * (1 / (_loc6_ - 1)));
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc3_ = this._pMuzzleParticles.addParticle();
            if(_loc3_ != null)
            {
               _loc3_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               if(param2)
               {
                  _loc3_.setSprite(GameRes.get()._pDiscTrailFireSprite);
               }
               else
               {
                  _loc3_.setSprite(GameRes.get()._pDiscTrailIceSprite);
               }
               _loc3_.setPosition(this._position);
               (_loc8_ = new Vec2F(param1.x,param1.y)).normalize(1);
               _loc8_.scaleBy(320);
               _loc8_.rotate(_loc5_);
               _loc3_.setVelocity(_loc8_);
               _loc3_.setRotation(_loc8_.getAngle());
               _loc3_.setSize(Random.RandomFloatRangeUniform(1,1.7));
               _loc3_.setLife(Random.RandomFloatRangeUniform(0.1,0.3));
               _loc3_.setColor(new RGBA(255,255,255,255));
               _loc3_.addAlphaKey(255);
               _loc3_.addAlphaKey(0);
               _loc3_.finalise();
            }
            _loc3_ = this._pMuzzleParticles.addParticle();
            if(_loc3_ != null)
            {
               _loc3_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               if(param2)
               {
                  _loc3_.setSprite(GameRes.get()._pDiscTrailFireSprite);
               }
               else
               {
                  _loc3_.setSprite(GameRes.get()._pDiscTrailIceSprite);
               }
               _loc3_.setPosition(this._position);
               (_loc8_ = new Vec2F(param1.x,param1.y)).normalize(1);
               _loc8_.scaleBy(160);
               _loc8_.rotate(_loc5_);
               _loc3_.setVelocity(_loc8_);
               _loc3_.setRotation(_loc8_.getAngle());
               _loc3_.setSize(Random.RandomFloatRangeUniform(1,1.7));
               _loc3_.setLife(Random.RandomFloatRangeUniform(0.1,0.3));
               _loc3_.setColor(new RGBA(255,255,255,255));
               _loc3_.addAlphaKey(255);
               _loc3_.addAlphaKey(0);
               _loc3_.finalise();
            }
            _loc5_ += _loc7_;
            _loc4_++;
         }
      }
      
      public function gunMuzzleFlash(param1:Vec2F, param2:Boolean) : void
      {
         var _loc3_:Particle2D = null;
         if(!this._pMuzzleParticles)
         {
            this._pMuzzleParticles = new RenderableParticleSystem(25);
            this._pMuzzleParticles.setWorldSpace(false);
            getWorldObj().addComponent(this._pMuzzleParticles);
         }
         _loc3_ = this._pMuzzleParticles.addParticle();
         if(_loc3_ != null)
         {
            _loc3_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
            if(param2)
            {
               _loc3_.setSprite(GameRes.get()._pHitFireSprite);
            }
            else
            {
               _loc3_.setSprite(GameRes.get()._pHitIceSprite);
            }
            _loc3_.setPosition(this._position);
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
      
      public function swordMuzzleFlash(param1:Vec2F, param2:Boolean) : void
      {
         var _loc3_:Particle2D = null;
         var _loc4_:uint = 0;
         var _loc8_:Vec2F = null;
         var _loc9_:Vec2F = null;
         var _loc10_:Vec2F = null;
         var _loc11_:Number = NaN;
         if(!this._pMuzzleParticles)
         {
            this._pMuzzleParticles = new RenderableParticleSystem(25);
            this._pMuzzleParticles.setWorldSpace(false);
            getWorldObj().addComponent(this._pMuzzleParticles);
         }
         var _loc5_:Number = Math.PI * -0.25;
         var _loc6_:int = 7;
         var _loc7_:Number = Math.abs(_loc5_ * 2 * (1 / (_loc6_ - 1)));
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc3_ = this._pMuzzleParticles.addParticle();
            if(_loc3_ != null)
            {
               _loc3_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               if(param2)
               {
                  _loc3_.setSprite(GameRes.get()._pDiscTrailFireSprite);
               }
               else
               {
                  _loc3_.setSprite(GameRes.get()._pDiscTrailIceSprite);
               }
               (_loc8_ = new Vec2F(param1.x,param1.y)).normalize(1);
               _loc9_ = new Vec2F(this._position.x - _loc8_.x * 80,this._position.y - _loc8_.y * 80);
               _loc8_.rotate(_loc5_);
               _loc8_.scaleBy(70);
               _loc10_ = new Vec2F(_loc9_.x + _loc8_.x,_loc9_.y + _loc8_.y);
               _loc3_.setPosition(_loc10_);
               _loc3_.setRotation(param1.getAngle() + _loc5_);
               _loc3_.setSize(Random.RandomFloatRangeUniform(1,1.3));
               _loc3_.setLife(0.08);
               _loc3_.setColor(new RGBA(255,255,255,128));
               _loc3_.addAlphaKey(255);
               _loc3_.addAlphaKey(0);
               _loc11_ = (_loc6_ - 1) * 2 - _loc4_ * 2;
               _loc3_.setDelay(int(_loc11_ * 0.75));
               _loc3_.finalise();
            }
            _loc5_ += _loc7_;
            _loc4_++;
         }
      }
      
      public function discMuzzleFlash(param1:Vec2F, param2:Boolean) : void
      {
         var _loc3_:Particle2D = null;
         var _loc4_:uint = 0;
         var _loc5_:Vec2F = null;
         if(!this._pMuzzleParticles)
         {
            this._pMuzzleParticles = new RenderableParticleSystem(25);
            this._pMuzzleParticles.setWorldSpace(false);
            getWorldObj().addComponent(this._pMuzzleParticles);
         }
         _loc4_ = 0;
         while(_loc4_ < 5)
         {
            _loc3_ = this._pMuzzleParticles.addParticle();
            if(_loc3_ != null)
            {
               _loc3_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               if(param2)
               {
                  _loc3_.setSprite(GameRes.get()._pDiscTrailFireSprite);
               }
               else
               {
                  _loc3_.setSprite(GameRes.get()._pDiscTrailIceSprite);
               }
               _loc3_.setPosition(new Vec2F(this._position.x + Random.RandomFloatRangeUniform(-10,10),this._position.y + Random.RandomFloatRangeUniform(-10,10)));
               (_loc5_ = new Vec2F(param1.getNormal().x,param1.getNormal().y)).scaleBy(-Random.RandomFloatRangeUniform(400,500));
               _loc5_.rotate(param1.getAngle() + Random.RandomFloatRangeUniform(Math.PI * -0.25,Math.PI * 0.25));
               _loc3_.setVelocity(_loc5_);
               _loc3_.setRotation(_loc5_.getAngle());
               _loc3_.setSize(Random.RandomFloatRangeUniform(1.3,2.3));
               _loc3_.setLife(0.1);
               _loc3_.setColor(new RGBA(255,255,255,255));
               _loc3_.addAlphaKey(255);
               _loc3_.addAlphaKey(0);
               _loc3_.finalise();
            }
            _loc4_++;
         }
      }
   }
}
