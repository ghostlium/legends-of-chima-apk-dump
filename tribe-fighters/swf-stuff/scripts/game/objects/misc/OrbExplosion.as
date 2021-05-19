package game.objects.misc
{
   import game.GameConsts;
   import game.objects.ChimaGameObject;
   import game.objects.enemies.Enemy;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   import zufflin.core.RGBA;
   import zufflin.core.zMaterial;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   
   public class OrbExplosion extends ChimaGameObject
   {
      
      public static const kfSpeed:Number = 3;
      
      public static const kfStartScale:Number = 0.1;
      
      public static const kfEndScale:Number = 2.5;
      
      public static const kfShockwaveScale:Number = 0.3;
       
      
      public var _fProgress:Number;
      
      public var _fOldScale:Number;
      
      public function OrbExplosion(param1:int, param2:Vec2F, param3:GlaSet, param4:String)
      {
         super(param1,param2,kfStartScale,GameConsts.ePlayerBulletCollisionCat,GameConsts.eEnemyCollisionCat,param3,param4);
         this._fProgress = 0;
         this._fOldScale = kfStartScale;
         setEnableShadow(false);
         _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].setBlendMode(zMaterial.Z_BLEND_ALPHA_ADD);
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this._fProgress += param1.getTime().dt * kfSpeed;
         if(this._fProgress >= 1)
         {
            deleteThis();
         }
         else
         {
            _loc2_ = 0;
            if(this._fProgress >= 0 && this._fProgress < 0.1)
            {
               _loc2_ = this._fProgress * 10;
            }
            else if(this._fProgress >= 0.1 && this._fProgress < 0.5)
            {
               _loc2_ = 1;
            }
            else
            {
               _loc2_ = 1 - (this._fProgress - 0.5) * 2;
            }
            _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].setColor(new RGBA(255,255,255,_loc2_ * 255));
            _loc3_ = kfStartScale + this._fProgress * (kfEndScale - kfStartScale);
            setScaleF(_loc3_);
            _pBody.scaleCollision(new Vec2F(1 / this._fOldScale,1 / this._fOldScale));
            _pBody.scaleCollision(new Vec2F(_loc3_,_loc3_));
            this._fOldScale = _loc3_;
            _loc4_ = 1 + this._fProgress * kfShockwaveScale;
            _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].getController().getSprite("shockwave").setScale(new Vec2F(_loc4_,_loc4_));
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         if(param1.getOtherObject() is Enemy)
         {
            (param1.getOtherObject() as Enemy).takeDamage(10);
         }
      }
   }
}
