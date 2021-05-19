package game.objects
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import util.Vec2F;
   import zufflin.world2D.World2Obj;
   
   public class GameObject extends World2Obj
   {
       
      
      public var _pOwner:GameObject;
      
      public function GameObject(param1:Vec2F = null)
      {
         this._pOwner = null;
         super();
         if(param1 != null)
         {
            super.setPosition(param1);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function getOwner() : GameObject
      {
         return this._pOwner;
      }
      
      public function setOwner(param1:GameObject) : void
      {
         this._pOwner = param1;
      }
      
      override public function playSfx(param1:Sound, param2:int, param3:Number, param4:Number, param5:Boolean = true, param6:Boolean = false) : SoundChannel
      {
         var _loc7_:Vec2F = getPosition();
         if(!param6 && (_loc7_.y < -50 || _loc7_.y > Number(LegoChima.Instance().zGetScreenHeight() + 50)))
         {
            param3 = 0;
         }
         return super.playSfx(param1,param2,param3,param4,param5);
      }
      
      override public function playSfxExt(param1:Sound, param2:int, param3:Number, param4:Number, param5:Boolean = true) : SoundChannel
      {
         var _loc6_:Vec2F = null;
         if(getLayer() != null)
         {
            if((_loc6_ = getPosition()).y < -50 || _loc6_.y > Number(LegoChima.Instance().zGetScreenHeight() + 50))
            {
               param3 = 0;
            }
            return super.playSfxExt(param1,param2,param3,param4,param5);
         }
         return null;
      }
   }
}
