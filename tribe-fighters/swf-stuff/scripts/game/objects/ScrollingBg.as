package game.objects
{
   import game.GameConsts;
   import game.GameWorld;
   import game.tween.cTweener;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.zSprite;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.RenderableSprite;
   import zufflin.world2D.World2Obj;
   
   public class ScrollingBg extends World2Obj
   {
      
      public static const TILESET_FOREST:int = 0;
      
      public static const TILESET_ICE:int = 1;
      
      public static const TILESET_CAVE:int = 2;
      
      public static const TILESET_FIRE:int = 3;
      
      public static const NUM_TILESETS:int = 4;
      
      public static const TILE_BEGIN:int = 0;
      
      public static const TILE_MIDDLE:int = 1;
      
      public static const TILE_END:int = 2;
      
      public static const kfMetreScale:Number = 0.01;
      
      public static const kfBackgroundSpeed:Number = 150;
      
      public static const kfSpeedBoost:Number = 150;
      
      public static const kfOverlaySpeedStep:Number = 0.1;
      
      public static const kfMinDistanceForNewOverlay:Number = 6;
      
      public static const kfMaxDistanceForNewOverlay:Number = 9;
      
      public static const kfMinDistanceForBgTransition:Number = 50;
      
      public static const kfMaxDistanceForBgTransition:Number = 100;
      
      private static var names:Vector.<String> = new <String>["forest","ice","cave","fire"];
       
      
      public var _sprites:Vector.<RenderableSprite>;
      
      public var _overlaySprites:Vector.<RenderableSprite>;
      
      public var _fScale:Number;
      
      public var _fScaledHeight:Number;
      
      public var _fSpeed:Number;
      
      public var _fSpeedBoost:Number;
      
      public var _fDistanceSinceLastOverlay:Number;
      
      public var _lastOverlayAdded:uint;
      
      public var _fDistanceUntilTransition:Number;
      
      public var _fDistanceSinceTransition:Number;
      
      public var _fDt:Number;
      
      public var _lastTileType:int;
      
      public var _pTilesets:Vector.<BackgroundTileset>;
      
      public var _pCurrTileset:BackgroundTileset;
      
      public var _pTweener:cTweener;
      
      private var _overlayLayer:World2Obj;
      
      private var _fOrigScale:Number;
      
      public function ScrollingBg(param1:int, param2:World2Obj)
      {
         this._overlayLayer = param2;
         super();
         this._sprites = new Vector.<RenderableSprite>();
         this._overlaySprites = new Vector.<RenderableSprite>();
         this._pTilesets = new Vector.<BackgroundTileset>(NUM_TILESETS,true);
         this._fDistanceSinceLastOverlay = kfMinDistanceForNewOverlay;
         this._lastOverlayAdded = 0;
         this._fDistanceSinceTransition = 0;
         this._fSpeedBoost = 0;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this.loadTileSets();
         this.setTileset(param1);
         this._fScale = Number(LegoChima.Instance().zGetScreenWidth()) / Number(this._pCurrTileset.getMiddleTile().getWidth());
         this._fOrigScale = 768 / 1024;
         this._fScaledHeight = this._fScale * Number(this._pCurrTileset.getMiddleTile().getWidth());
         this.setSpeed(kfBackgroundSpeed);
         this.initialise();
         this._pTweener = new cTweener();
      }
      
      override public function dispose() : void
      {
         var _loc1_:uint = 0;
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         _loc1_ = 0;
         while(_loc1_ < NUM_TILESETS)
         {
            this._pTilesets[_loc1_].dispose();
            this._pTilesets[_loc1_] = null;
            _loc1_++;
         }
         this._pTweener.dispose();
         this._pTweener = null;
         super.dispose();
      }
      
      public function getSpeed() : Number
      {
         return this._fSpeed + this._fSpeedBoost;
      }
      
      public function getSpeedBoost() : Number
      {
         return this._fSpeedBoost;
      }
      
      public function getDistanceSinceTransition() : Number
      {
         return this._fDistanceSinceTransition;
      }
      
      public function getCurrentTileset() : BackgroundTileset
      {
         return this._pCurrTileset;
      }
      
      public function initialise() : void
      {
         var _loc2_:Vec2F = null;
         this._fDistanceUntilTransition = Random.RandomNumberRange(kfMinDistanceForBgTransition,kfMaxDistanceForBgTransition);
         this._lastTileType = TILE_MIDDLE;
         var _loc1_:Number = Number(LegoChima.Instance().zGetScreenHeight());
         do
         {
            _loc2_ = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),_loc1_ - this._fScaledHeight * 0.5);
            this.addTile(_loc2_);
            _loc1_ -= this._fScaledHeight;
         }
         while(_loc1_ > 0);
         
      }
      
      public function loadTileSets() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         _loc1_ = 0;
         while(_loc1_ < NUM_TILESETS)
         {
            this._pTilesets[_loc1_] = new BackgroundTileset(names[_loc1_],_loc1_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < NUM_TILESETS)
         {
            _loc2_ = 0;
            while(_loc2_ < NUM_TILESETS)
            {
               if(_loc1_ != _loc2_)
               {
                  _loc3_ = names[_loc1_] + "_to_" + names[_loc2_];
                  this._pTilesets[_loc1_].loadTransitionTiles(_loc3_,_loc2_);
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function setTileset(param1:int) : void
      {
         this._pCurrTileset = this._pTilesets[param1];
      }
      
      public function transitionToTileset(param1:int) : void
      {
         if(param1 != this._pCurrTileset.getTileset())
         {
            this.addTransitionTiles(param1);
            this._pCurrTileset = this._pTilesets[param1];
            this._fDistanceSinceLastOverlay = kfMinDistanceForNewOverlay;
         }
      }
      
      public function getMetreScale() : Number
      {
         return kfMetreScale;
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc4_:uint = 0;
         var _loc6_:RenderableSprite = null;
         var _loc7_:Vec2F = null;
         var _loc8_:Vec2F = null;
         var _loc9_:int = 0;
         if(getLayer().isUpdateEnabled() == false)
         {
            return;
         }
         this._fDt = param1.getTime().dt;
         this._pTweener.tick(this._fDt);
         var _loc2_:Boolean = true;
         var _loc3_:Number = Number(LegoChima.Instance().zGetScreenHeight());
         _loc4_ = 0;
         while(_loc4_ < this._sprites.length)
         {
            _loc7_ = (_loc6_ = this._sprites[_loc4_]).getPosition();
            _loc7_.y += (this._fSpeed + this._fSpeedBoost) * this._fDt;
            _loc6_.setPosition(_loc7_);
            if(_loc7_.y - 0.5 * this._fScaledHeight < _loc3_)
            {
               _loc3_ = _loc7_.y - 0.5 * this._fScaledHeight;
            }
            if(_loc7_.y - 0.5 * this._fScaledHeight >= Number(LegoChima.Instance().zGetScreenHeight()))
            {
               removeComponent(_loc6_);
               this._sprites.splice(_loc4_,1);
            }
            else
            {
               if(_loc6_.getPosition().y - 0.5 * this._fScaledHeight <= 0)
               {
                  _loc2_ = false;
               }
               _loc4_++;
            }
         }
         if(_loc2_)
         {
            _loc8_ = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),_loc3_ - 0.5 * this._fScaledHeight);
            this.addTile(_loc8_);
         }
         _loc4_ = 0;
         while(_loc4_ < this._overlaySprites.length)
         {
            _loc7_ = (_loc6_ = this._overlaySprites[_loc4_]).getPosition();
            _loc7_.y += (this._fSpeed + this._fSpeedBoost) * _loc6_._fUserData1 * this._fDt;
            _loc6_.setPosition(_loc7_);
            if(_loc7_.y - 0.5 * _loc6_.getScale().y * Number(_loc6_.getSprite().getHeight()) > Number(LegoChima.Instance().zGetScreenHeight()))
            {
               this._overlayLayer.removeComponent(_loc6_);
               this._overlaySprites.splice(_loc4_,1);
            }
            else
            {
               _loc4_++;
            }
         }
         this._fDistanceSinceLastOverlay -= (this._fSpeed + this._fSpeedBoost) * this._fDt * kfMetreScale;
         if(this._fDistanceSinceLastOverlay <= 0)
         {
            this._fDistanceSinceLastOverlay = Random.RandomFloatRangeUniform(kfMinDistanceForNewOverlay,kfMaxDistanceForNewOverlay);
            this.addOverlay();
         }
         var _loc5_:Number = (this._fSpeed + this._fSpeedBoost) * this._fDt * kfMetreScale;
         GameWorld.get().getHUD().getDistanceMeter().addDistance(_loc5_);
         this._fDistanceSinceTransition += _loc5_;
         if(this._fDistanceSinceTransition >= this._fDistanceUntilTransition)
         {
            this._fDistanceSinceTransition = 0;
            this._fDistanceUntilTransition = Random.RandomFloatRangeUniform(kfMinDistanceForBgTransition,kfMaxDistanceForBgTransition);
            if((_loc9_ = Random.RandomNumberRange(0,10000) % NUM_TILESETS) == this._pCurrTileset.getTileset())
            {
               _loc9_ = (_loc9_ + 1) % NUM_TILESETS;
            }
            this.transitionToTileset(_loc9_);
         }
      }
      
      public function setSpeed(param1:Number) : void
      {
         this._fSpeed = param1;
      }
      
      public function activateSpeedBoost() : void
      {
         this._pTweener.reset();
         this._pTweener.addTween(this,"bgspeedboost","_fSpeedBoost",this._fSpeedBoost,kfSpeedBoost,0.5,0,cTweener.LINEAR);
      }
      
      public function deactivateSpeedBoost() : void
      {
         this._pTweener.reset();
         this._pTweener.addTween(this,"bgspeedboost","_fSpeedBoost",this._fSpeedBoost,0,0.5,0,cTweener.LINEAR);
      }
      
      public function addTile(param1:Vec2F) : void
      {
         var _loc2_:zSprite = null;
         switch(this._lastTileType)
         {
            case TILE_BEGIN:
               _loc2_ = this._pCurrTileset.getMiddleTile();
               this._lastTileType = TILE_MIDDLE;
               break;
            case TILE_MIDDLE:
               if(Random.RandomNumberRange(0,10000) % 2 == 0)
               {
                  _loc2_ = this._pCurrTileset.getEndTile();
                  this._lastTileType = TILE_END;
               }
               else
               {
                  _loc2_ = this._pCurrTileset.getMiddleTile();
                  this._lastTileType = TILE_MIDDLE;
               }
               break;
            case TILE_END:
               _loc2_ = this._pCurrTileset.getBeginTile();
               this._lastTileType = TILE_BEGIN;
         }
         var _loc3_:RenderableSprite = new RenderableSprite(_loc2_);
         _loc3_.setPosition(param1);
         _loc3_.setScale(this._fScale);
         _loc3_.setDepth(GameConsts.DEPTH_GROUND);
         addComponent(_loc3_);
         this._sprites.push(_loc3_);
      }
      
      public function addTransitionTiles(param1:int) : void
      {
         var _loc3_:uint = 0;
         var _loc5_:RenderableSprite = null;
         var _loc6_:Vec2F = null;
         var _loc7_:zSprite = null;
         var _loc2_:Number = Number(LegoChima.Instance().zGetScreenHeight());
         _loc3_ = 0;
         while(_loc3_ < this._sprites.length)
         {
            if((_loc6_ = (_loc5_ = this._sprites[_loc3_]).getPosition()).y - 0.5 * this._fScaledHeight < _loc2_)
            {
               _loc2_ = _loc6_.y - 0.5 * this._fScaledHeight;
            }
            _loc3_++;
         }
         var _loc4_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),_loc2_ - 0.5 * this._fScaledHeight);
         _loc3_ = 0;
         while(_loc3_ < this._pCurrTileset.getNumTransitionTiles(param1))
         {
            _loc7_ = this._pCurrTileset.getTransitionTile(param1,_loc3_);
            (_loc5_ = new RenderableSprite(_loc7_)).setPosition(_loc4_);
            _loc5_.setScale(this._fScale);
            _loc5_.setDepth(GameConsts.DEPTH_GROUND);
            addComponent(_loc5_);
            this._sprites.push(_loc5_);
            _loc4_.y -= this._fScaledHeight;
            _loc3_++;
         }
      }
      
      public function addOverlay() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BackgroundOverlay = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:zSprite = null;
         var _loc7_:Vec2F = null;
         var _loc8_:Vec2F = null;
         var _loc9_:Number = NaN;
         var _loc10_:RenderableSprite = null;
         var _loc1_:uint = this._pCurrTileset.getNumOverlays();
         if(_loc1_ > 0)
         {
            _loc2_ = 0;
            if(_loc1_ > 1)
            {
               _loc2_ = Random.RandomNumberRange(0,10000) % _loc1_;
               if(_loc2_ == this._lastOverlayAdded)
               {
                  _loc2_ = (_loc2_ + 1) % _loc1_;
               }
               this._lastOverlayAdded = _loc2_;
            }
            _loc3_ = this._pCurrTileset.getOverlay(_loc2_);
            _loc4_ = 0;
            _loc5_ = 0;
            while(_loc5_ < _loc3_.getNumSprites())
            {
               _loc6_ = _loc3_.GetSpriteSprite(_loc5_);
               _loc7_ = _loc3_.GetSpriteScale(_loc5_);
               _loc8_ = _loc3_.GetSpritePos(_loc5_);
               _loc9_ = _loc3_.GetSpriteSpeed(_loc5_);
               _loc8_.scaleBy(this._fOrigScale);
               _loc8_.x += 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
               _loc8_.y += 0.5 * Number(LegoChima.Instance().zGetScreenHeight());
               _loc8_.y -= Number(LegoChima.Instance().zGetScreenHeight());
               (_loc10_ = new RenderableSprite(_loc6_)).setPosition(_loc8_);
               _loc7_.scaleBy(this._fOrigScale);
               _loc10_.setScaleV(_loc7_);
               _loc10_.setDepth(GameConsts.DEPTH_OVERLAY - _loc4_++);
               _loc10_._fUserData1 = _loc9_;
               this._overlayLayer.addComponent(_loc10_);
               this._overlaySprites.push(_loc10_);
               _loc5_++;
            }
         }
      }
   }
}
