package zufflin.world2D
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import util.Vec2F;
   import zufflin.physics2D.EventContact2;
   import zufflin.physics2D.RigidBody2;
   import zufflin.world.WorldObj;
   
   public class World2Obj extends WorldObj
   {
       
      
      protected var _pRigidBody:RigidBody2;
      
      public function World2Obj()
      {
         super();
         this._pRigidBody = null;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this._pRigidBody != null)
         {
            this._pRigidBody.dispose();
            this._pRigidBody = null;
         }
      }
      
      public function playSfxExt(param1:Sound, param2:int, param3:Number, param4:Number, param5:Boolean = true) : SoundChannel
      {
         if(param1 != null)
         {
            return param1.play(0,0,new SoundTransform(param3));
         }
         trace("SCG: MISSING SOUND");
         return null;
      }
      
      public function playSfx(param1:Sound, param2:int, param3:Number, param4:Number, param5:Boolean = true, param6:Boolean = false) : SoundChannel
      {
         if(param1 != null)
         {
            return param1.play(0,0,new SoundTransform(param3));
         }
         trace("SCG: MISSING SOUND");
         return null;
      }
      
      public function addComponent_RigidBody(param1:RigidBody2) : void
      {
         this._pRigidBody = param1;
         this._pRigidBody.setWorldObj(this);
      }
      
      public function removeComponent_RigidBody(param1:RigidBody2) : void
      {
         this._pRigidBody.dispose();
         this._pRigidBody.setWorldObj(null);
         this._pRigidBody = null;
      }
      
      public function doContactEvent(param1:EventContact2) : void
      {
         _ComponentLayer.dispatchEvent(param1);
      }
      
      override public function setRotation(param1:Number) : void
      {
         super.setRotation(param1);
         if(this._pRigidBody != null)
         {
            this._pRigidBody.rotationChanged(param1);
         }
      }
      
      override public function setPosition(param1:Vec2F) : void
      {
         super.setPosition(param1);
         if(this._pRigidBody != null)
         {
            this._pRigidBody.positionChanged(param1.x,param1.y);
         }
      }
      
      override public function setPosition2(param1:Number, param2:Number) : void
      {
         super.setPosition2(param1,param2);
         if(this._pRigidBody != null)
         {
            this._pRigidBody.positionChanged(param1,param2);
         }
      }
      
      public function SCG_GetRigidBody() : RigidBody2
      {
         return this._pRigidBody;
      }
   }
}
