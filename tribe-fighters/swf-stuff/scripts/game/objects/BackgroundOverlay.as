package game.objects
{
   import game.GameRes;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.core.zSprite;
   
   public class BackgroundOverlay
   {
       
      
      public var _pOverlayScene:GlaControllerScene;
      
      public var _pSprites:Vector.<zSprite>;
      
      public var _fScales:Vector.<Vec2F>;
      
      public var _vPositions:Vector.<Vec2F>;
      
      public var _fSpeeds:Vector.<Number>;
      
      public function BackgroundOverlay(param1:String)
      {
         super();
         this._pSprites = new Vector.<zSprite>();
         this._fScales = new Vector.<Vec2F>();
         this._vPositions = new Vector.<Vec2F>();
         this._fSpeeds = new Vector.<Number>();
         this.loadOverlay(param1);
      }
      
      public function dispose() : void
      {
         this._pOverlayScene.dispose();
         this._pOverlayScene = null;
      }
      
      public function loadOverlay(param1:String) : void
      {
         var _loc4_:GlaControllerSprite = null;
         this._pOverlayScene = new GlaControllerScene(null,null,GameRes.get()._pLevelSet.findScene(param1));
         var _loc2_:Boolean = true;
         var _loc3_:uint = 0;
         while(_loc2_)
         {
            param1 = "overlay";
            param1 += _loc3_.toString();
            if(_loc4_ = this._pOverlayScene.getSprite(param1))
            {
               _loc3_++;
               this._pSprites.push(_loc4_.getSprite());
               this._fScales.push(_loc4_.getScale());
               this._vPositions.push(_loc4_.getPosition());
               this._fSpeeds.push(1 + ScrollingBg.kfOverlaySpeedStep * Number(_loc4_.getDepth()));
            }
            else
            {
               _loc2_ = false;
            }
         }
      }
      
      public function getNumSprites() : uint
      {
         return this._pSprites.length;
      }
      
      public function GetSpriteSprite(param1:uint) : zSprite
      {
         return this._pSprites[param1];
      }
      
      public function GetSpriteScale(param1:uint) : Vec2F
      {
         return new Vec2F(this._fScales[param1].x,this._fScales[param1].y);
      }
      
      public function GetSpritePos(param1:uint) : Vec2F
      {
         return new Vec2F(this._vPositions[param1].x,this._vPositions[param1].y);
      }
      
      public function GetSpriteSpeed(param1:uint) : Number
      {
         return this._fSpeeds[param1];
      }
   }
}
