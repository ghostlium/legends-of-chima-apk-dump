package game.objects.fx
{
   import game.GameWorld;
   import game.objects.GameObject;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaScene;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   import zufflin.world2D.GlaAnimRenderable;
   
   public class FallingAnim extends GameObject
   {
       
      
      public var _vVel:Vec2F;
      
      public var _fRotVel:Number;
      
      public var _pAnim:GlaAnimRenderable;
      
      public function FallingAnim(param1:GlaScene)
      {
         super();
         this._vVel = new Vec2F();
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this._pAnim = new GlaAnimRenderable(null,param1.getState(0));
         addComponent(this._pAnim);
         this._pAnim.play(true,0.5);
         var _loc2_:Vec2F = LegoChima.GetScreenSize();
         setPosition(new Vec2F(Random.RandomFloatRangeUniform(_loc2_.x * -0.5,_loc2_.x),-Random.RandomFloatRangeUniform(_loc2_.y * 0.5,_loc2_.y * 0.1)));
         this._fRotVel = Random.RandomFloatRangeUniform(Math.PI * 0.5,Math.PI * 2);
         this._vVel.x = Random.RandomFloatRangeUniform(0.7,1.3);
         this._vVel.y = Random.RandomFloatRangeUniform(0.7,1.3);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:WorldLayer = this.getLayer();
         if(_loc2_ && _loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         _loc3_ = param1.getTime().dt;
         var _loc4_:Vec2F = getPosition();
         var _loc5_:Vec2F = new Vec2F(40,GameWorld.get().getGroundSpeed() * 1.5);
         _loc5_.x *= this._vVel.x;
         _loc5_.y *= this._vVel.y;
         _loc4_.x += _loc3_ * _loc5_.x;
         _loc4_.y += _loc3_ * _loc5_.y;
         setPosition(_loc4_);
         setRotation(getRotation() + this._fRotVel * _loc3_);
         if(_loc4_.y > LegoChima.GetScreenSize().y * 1.1)
         {
            deleteThis();
         }
      }
   }
}
