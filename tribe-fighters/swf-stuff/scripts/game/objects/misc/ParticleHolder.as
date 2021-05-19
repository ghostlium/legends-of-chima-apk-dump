package game.objects.misc
{
   import game.objects.GameObject;
   import util.SpriteExt;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.RenderableParticleSystem;
   
   public class ParticleHolder extends GameObject
   {
       
      
      public var _pParticles:RenderableParticleSystem;
      
      public function ParticleHolder(param1:RenderableParticleSystem)
      {
         super();
         this._pParticles = param1;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         if(this._pParticles != null)
         {
            this._pParticles.getParticleManager().disableExternalVelocity();
            if(this._pParticles.parent != null)
            {
               this._pParticles.parent.removeChild(this._pParticles);
            }
         }
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
      }
      
      public function eventAddedToLayer() : void
      {
         if(this._pParticles)
         {
            if(this._pParticles.parent == null)
            {
               addComponent(this._pParticles);
            }
         }
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc3_:SpriteExt = null;
         var _loc2_:ParticleHolder = null;
         if(this._pParticles.parent != null && this._pParticles.parent is SpriteExt)
         {
            _loc3_ = this._pParticles.parent as SpriteExt;
            if(_loc3_._worldObj != null && _loc3_._worldObj is ParticleHolder)
            {
               _loc2_ = _loc3_._worldObj as ParticleHolder;
            }
         }
         if(!this._pParticles || !this._pParticles.hasActiveParticles() || _loc2_ == null || _loc2_ != this)
         {
            deleteThis();
         }
      }
   }
}
