package game.objects.fx
{
   import game.GameRes;
   import game.GameWorld;
   import game.objects.GameObject;
   import util.Random;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   
   public class EnvironmentParticleSpawner extends GameObject
   {
       
      
      public var _iObjectSpawnRate:int;
      
      public var _iFramesSincePreviousSpawn:int;
      
      public function EnvironmentParticleSpawner()
      {
         super();
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this._iObjectSpawnRate = 100;
         this._iFramesSincePreviousSpawn = 0;
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:WorldLayer = this.getLayer();
         if(_loc2_ && _loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         if(Random.RandomNumberRange(0,10000) % this._iObjectSpawnRate == 0 && this._iFramesSincePreviousSpawn > 20)
         {
            this.spawnNewObject();
         }
         ++this._iFramesSincePreviousSpawn;
      }
      
      public function spawnNewObject() : void
      {
         this._iFramesSincePreviousSpawn = 0;
         var _loc1_:int = GameWorld.get().getBackground().getCurrentTileset().getTileset();
         var _loc2_:FallingAnim = null;
         switch(_loc1_)
         {
            case 0:
               _loc2_ = new FallingAnim(GameRes.get()._pParticleEffectsSet.findScene("leaf_particle_anim"));
               this._iObjectSpawnRate = 130;
               break;
            case 1:
               _loc2_ = new FallingAnim(GameRes.get()._pParticleEffectsSet.findScene("snowflake_particle_anim"));
               this._iObjectSpawnRate = 100;
               break;
            case 2:
               break;
            case 3:
         }
         if(_loc2_)
         {
            getLayer().addObject(_loc2_);
         }
      }
   }
}
