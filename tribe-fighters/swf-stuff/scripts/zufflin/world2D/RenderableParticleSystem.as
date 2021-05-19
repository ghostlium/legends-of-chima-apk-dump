package zufflin.world2D
{
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   import zufflin.world.WorldObj;
   
   public class RenderableParticleSystem extends Renderable2
   {
       
      
      public var pManager:ParticleManager2D;
      
      private var bWorldSpace:Boolean;
      
      public function RenderableParticleSystem(param1:int = 64)
      {
         super();
         this.bWorldSpace = false;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this.pManager = new ParticleManager2D(param1);
         this.pManager.setClipping(ParticleManager2D.CLIP_SYSTEM);
         this.setColor(new RGBA(255,255,255,255));
         this.addChild(this.pManager);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this.pManager);
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
         this.pManager.dispose();
         this.pManager = null;
      }
      
      public function setWorldSpace(param1:Boolean) : void
      {
         this.bWorldSpace = param1;
         this.pManager.setWorldSpace(this.bWorldSpace);
      }
      
      public function getWorldSpace() : Boolean
      {
         return this.bWorldSpace;
      }
      
      public function getParticleManager() : ParticleManager2D
      {
         return this.pManager;
      }
      
      public function addParticle() : Particle2D
      {
         return this.pManager.addParticle();
      }
      
      public function hasActiveParticles() : Boolean
      {
         return this.pManager.hasActiveParticles();
      }
      
      public function enableZ(param1:Boolean) : void
      {
         this.pManager.enableZ(param1);
      }
      
      public function setGravityZ(param1:Number) : void
      {
         this.pManager.setGravityZ(param1);
      }
      
      public function setVisualScaleZ(param1:Number, param2:Number, param3:Number) : void
      {
         this.pManager.setVisualScaleZ(param1,param2,param3);
      }
      
      public function setMaxShadowDistance(param1:Number) : void
      {
         this.pManager.setMaxShadowDistance(param1);
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:WorldObj = this.getParentWorldObj();
         var _loc3_:WorldLayer = _loc2_ != null ? _loc2_.getLayer() : null;
         if(_loc3_ && _loc3_.isUpdateEnabled() == false)
         {
            return;
         }
         if(this.pManager)
         {
            this.pManager.update(param1.getTime());
         }
      }
   }
}
