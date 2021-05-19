package game.objects.enemies.orbs
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.EnemyManager;
   import game.objects.controllers.OrbEnemyController;
   import game.objects.enemies.Enemy;
   import game.objects.misc.OrbExplosion;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   
   public class OrbEnemy extends Enemy
   {
       
      
      public function OrbEnemy(param1:int, param2:Vec2F, param3:GlaSet, param4:String)
      {
         super(param1,param2,1,1,param3,param4);
         _pController = new OrbEnemyController(this);
         addComponent(_pController);
         _bDamagePlayerOnContact = false;
         _bSpawnFootprints = false;
      }
      
      override public function specificTakeDamage(param1:Number) : void
      {
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:AABox2f = getBounds();
         _loc2_.translate(getPosition());
         if(_loc2_.min.y > LegoChima.Instance().zGetScreenHeight())
         {
            if(_pOwner)
            {
               (_pOwner as EnemyManager).enemyDied(this,false);
            }
            deleteThis();
         }
      }
      
      override public function specificDie() : void
      {
         var _loc1_:OrbExplosion = null;
         if(_side == GameConsts.eFireChima)
         {
            _loc1_ = new OrbExplosion(_side,getPosition(),GameRes.get()._pFireOrbsCharSet,"orb_fire_explosion");
         }
         else
         {
            _loc1_ = new OrbExplosion(_side,getPosition(),GameRes.get()._pIceOrbsCharSet,"orb_ice_explosion");
         }
         getLayer().addObject(_loc1_);
         playSfxExt(GameRes.get()._pExplosionSounds.rand_element(),0,1,1,false);
      }
   }
}
