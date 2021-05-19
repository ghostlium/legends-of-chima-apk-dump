package game.objects.fx
{
   import game.GameConsts;
   import game.objects.GameObject;
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.core.zSprite;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   import zufflin.world2D.RenderableSprite;
   
   public class DebrisPiece extends GameObject
   {
       
      
      public var _pRS:RenderableSprite;
      
      public var _pSpr:zSprite;
      
      public var _vPos:Vec2F;
      
      public var _vScale:Vec2F;
      
      public var _fRot:Number;
      
      public var _vVel:Vec2F;
      
      public var _fRotVel:Number;
      
      public var _fLife:Number;
      
      public var _fLifeSpeed:Number;
      
      public function DebrisPiece(param1:zSprite, param2:Vec2F, param3:Vec2F, param4:Number, param5:Vec2F, param6:Number, param7:Number)
      {
         super(param2);
         this._pSpr = param1;
         this._vPos = new Vec2F(param2.x,param2.y);
         this._vScale = new Vec2F(param3.x,param3.y);
         this._fRot = param4;
         this._vVel = new Vec2F(param5.x,param5.y);
         this._fRotVel = param6;
         this._fLife = 1;
         this._fLifeSpeed = param7;
         this._pRS = new RenderableSprite(this._pSpr);
         this._pRS.setScaleV(this._vScale);
         this._pRS.setDepth(GameConsts.DEPTH_DEBRIS);
         addComponent(this._pRS);
         setRotation(param4);
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:WorldLayer = this.getLayer();
         if(_loc2_ && _loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         var _loc3_:Number = param1.getTime().dt;
         this._fLife -= this._fLifeSpeed * _loc3_;
         if(this._fLife <= 0)
         {
            deleteThis();
         }
         else
         {
            this._vPos = getPosition();
            this._vPos.x += this._vVel.x * _loc3_;
            this._vPos.y += this._vVel.y * _loc3_;
            setPosition(this._vPos);
            this._fRot = getRotation();
            this._fRot += this._fRotVel * _loc3_;
            setRotation(this._fRot);
            this._pRS.setColor(new RGBA(255,255,255,this._fLife * 255));
         }
      }
   }
}
