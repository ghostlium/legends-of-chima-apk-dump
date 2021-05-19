package game.objects.pickups
{
   import flash.utils.getTimer;
   import game.GameConsts;
   import game.GameWorld;
   import game.objects.GameObject;
   import game.objects.Player;
   import util.Random;
   import util.Vec2F;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   
   public class StudExplosion extends GameObject
   {
      
      public static const kfStudInitialOffset:Number = 20;
      
      public static const kfStudMinVel:Number = 50;
      
      public static const kfStudMaxVel:Number = 300;
      
      public static const kuBlueStudChance:uint = 12;
      
      public static const kuGoldStudChance:uint = 5;
      
      public static const kuHeartChance:uint = 10;
      
      public static const kuChiCrystalChance:uint = 8;
      
      public static const kuPowerupChance:uint = 18;
      
      public static const kuMinTimeBetweenPowerups:uint = 30000;
      
      public static const kuMinTimeBetweenChi:uint = 1000;
      
      public static var _uAllowedToSpawnPowerupTime:uint = 0;
      
      public static var _uAllowedToSpawnChiTime:uint = 0;
       
      
      public var _side:int;
      
      public function StudExplosion(param1:int, param2:Vec2F)
      {
         super(param2);
         this._side = param1;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc4_:uint = 0;
         var _loc2_:WorldLayer = this.getLayer();
         if(_loc2_ && _loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         var _loc3_:uint = 3 + Random.RandomNumberRange(0,5);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(Random.RandomNumberRange(0,10000) % kuBlueStudChance == 0)
            {
               this.addStud(2);
            }
            else if(Random.RandomNumberRange(0,10000) % kuGoldStudChance == 0)
            {
               this.addStud(1);
            }
            else
            {
               this.addStud(0);
            }
            _loc4_++;
         }
         if(Random.RandomNumberRange(0,10000) % kuHeartChance == 0)
         {
            this.addHeart();
         }
         if(getTimer() > _uAllowedToSpawnChiTime && Random.RandomNumberRange(0,10000) % kuChiCrystalChance == 0)
         {
            this.addChiCrystal();
            _uAllowedToSpawnChiTime = getTimer() + kuMinTimeBetweenChi;
         }
         if(getTimer() > _uAllowedToSpawnPowerupTime && Random.RandomNumberRange(0,10000) % kuPowerupChance == 0)
         {
            this.addPowerUp();
            _uAllowedToSpawnPowerupTime = getTimer() + kuMinTimeBetweenPowerups;
         }
         deleteThis();
      }
      
      public function addStud(param1:uint) : void
      {
         var _loc2_:Stud = null;
         var _loc3_:Vec2F = new Vec2F(0,kfStudInitialOffset);
         _loc3_.rotate(Random.RandomFloatRangeUniform(0,Math.PI * 2));
         var _loc4_:Vec2F;
         (_loc4_ = new Vec2F(_loc3_.x,_loc3_.y)).normalize(1);
         _loc4_.scaleBy(Random.RandomFloatRangeUniform(kfStudMinVel,kfStudMaxVel));
         var _loc5_:Vec2F = new Vec2F(getPosition().x + _loc3_.x,getPosition().y + _loc3_.y);
         switch(param1)
         {
            case 0:
               _loc2_ = new SilverStud(this._side,_loc5_,_loc4_);
               break;
            case 1:
               _loc2_ = new GoldStud(this._side,_loc5_,_loc4_);
               break;
            case 2:
               _loc2_ = new BlueStud(this._side,_loc5_,_loc4_);
         }
         getLayer().addObject(_loc2_);
      }
      
      public function addHeart() : void
      {
         var _loc1_:Heart = null;
         var _loc2_:Vec2F = new Vec2F(0,kfStudInitialOffset);
         _loc2_.rotate(Random.RandomFloatRangeUniform(0,Math.PI * 2));
         var _loc3_:Vec2F = new Vec2F(_loc2_.x,_loc2_.y);
         _loc3_.normalize(1);
         _loc3_.scaleBy(Random.RandomFloatRangeUniform(kfStudMinVel,kfStudMaxVel));
         var _loc4_:Vec2F = new Vec2F(getPosition().x + _loc2_.x,getPosition().y + _loc2_.y);
         _loc1_ = new Heart(this._side,_loc4_,_loc3_);
         getLayer().addObject(_loc1_);
      }
      
      public function addChiCrystal() : void
      {
         var _loc1_:ChiCrystal = null;
         var _loc2_:Vec2F = new Vec2F(0,kfStudInitialOffset);
         _loc2_.rotate(Random.RandomFloatRangeUniform(0,Math.PI * 2));
         var _loc3_:Vec2F = new Vec2F(_loc2_.x,_loc2_.y);
         _loc3_.normalize(1);
         _loc3_.scaleBy(Random.RandomFloatRangeUniform(kfStudMinVel,kfStudMaxVel));
         var _loc4_:Vec2F = new Vec2F(getPosition().x + _loc2_.x,getPosition().y + _loc2_.y);
         _loc1_ = new ChiCrystal(this._side,_loc4_,_loc3_);
         getLayer().addObject(_loc1_);
      }
      
      public function addPowerUp() : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:PowerUp = null;
         var _loc1_:Player = GameWorld.get().getPlayer();
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.getSide();
            if(_loc2_ == GameConsts.eFireChima)
            {
               _loc3_ = "fire";
            }
            else
            {
               _loc3_ = "ice";
            }
            _loc4_ = null;
            switch(Random.RandomNumberRange(0,10000) % 2)
            {
               case 0:
                  _loc4_ = new SpeedBoostPowerUp(_loc2_,_loc3_,getPosition());
                  break;
               case 1:
                  _loc4_ = new SuperShieldPowerUp(_loc2_,_loc3_,getPosition());
            }
            getLayer().addObject(_loc4_);
         }
      }
   }
}
