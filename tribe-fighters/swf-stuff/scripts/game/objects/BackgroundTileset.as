package game.objects
{
   import game.GameRes;
   import util.Random;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.cobraBase.GlaScene;
   import zufflin.core.zSprite;
   
   public class BackgroundTileset
   {
       
      
      public var _name:String;
      
      public var _tileset:int;
      
      public var _pTileScene:GlaControllerScene;
      
      public var _beginTiles:Vector.<zSprite>;
      
      public var _middleTiles:Vector.<zSprite>;
      
      public var _endTiles:Vector.<zSprite>;
      
      public var _pTransitionScenes:Vector.<GlaControllerScene>;
      
      public var _transitionTiles:Vector.<Vector.<zSprite>>;
      
      public var _pOverlays:Vector.<BackgroundOverlay>;
      
      public function BackgroundTileset(param1:String, param2:int)
      {
         var _loc3_:uint = 0;
         super();
         this._beginTiles = new Vector.<zSprite>();
         this._middleTiles = new Vector.<zSprite>();
         this._endTiles = new Vector.<zSprite>();
         this._pTransitionScenes = new Vector.<GlaControllerScene>(ScrollingBg.NUM_TILESETS,true);
         this._transitionTiles = new Vector.<Vector.<zSprite>>(ScrollingBg.NUM_TILESETS,true);
         this._pOverlays = new Vector.<BackgroundOverlay>();
         this._name = param1;
         this._tileset = param2;
         this._pTileScene = new GlaControllerScene(null,null,GameRes.get()._pLevelSet.findScene(param1));
         _loc3_ = 0;
         while(_loc3_ < ScrollingBg.NUM_TILESETS)
         {
            this._pTransitionScenes[_loc3_] = null;
            this._transitionTiles[_loc3_] = new Vector.<zSprite>();
            _loc3_++;
         }
         this.loadTiles("begin",this._beginTiles);
         this.loadTiles("middle",this._middleTiles);
         this.loadTiles("end",this._endTiles);
         this.loadOverlays(this._name);
      }
      
      public function dispose() : void
      {
         var _loc1_:uint = 0;
         _loc1_ = 0;
         while(_loc1_ < ScrollingBg.NUM_TILESETS)
         {
            this._pTransitionScenes[_loc1_].dispose();
            this._pTransitionScenes[_loc1_] = null;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this._pOverlays.length)
         {
            this._pOverlays[_loc1_].dispose();
            this._pOverlays[_loc1_] = null;
            _loc1_++;
         }
         this._pTileScene.dispose();
         this._pTileScene = null;
      }
      
      public function getName() : String
      {
         return this._name;
      }
      
      public function getTileset() : int
      {
         return this._tileset;
      }
      
      public function loadTransitionTiles(param1:String, param2:int) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:uint = 0;
         var _loc5_:String = null;
         var _loc6_:GlaControllerSprite = null;
         this._pTransitionScenes[param2] = new GlaControllerScene(null,null,GameRes.get()._pLevelSet.findScene(param1));
         if(this._pTransitionScenes[param2])
         {
            _loc3_ = true;
            _loc4_ = 0;
            while(_loc3_)
            {
               _loc5_ = "transition" + _loc4_.toString();
               if((_loc6_ = this._pTransitionScenes[param2].getSprite(_loc5_)) != null)
               {
                  this._transitionTiles[param2].push(_loc6_.getSprite());
               }
               else
               {
                  _loc3_ = false;
               }
               _loc4_++;
            }
         }
      }
      
      public function getBeginTile() : zSprite
      {
         return this._beginTiles[Random.RandomNumberRange(0,10000) % this._beginTiles.length];
      }
      
      public function getMiddleTile() : zSprite
      {
         return this._middleTiles[Random.RandomNumberRange(0,10000) % this._middleTiles.length];
      }
      
      public function getEndTile() : zSprite
      {
         return this._endTiles[Random.RandomNumberRange(0,10000) % this._endTiles.length];
      }
      
      public function getNumTransitionTiles(param1:int) : uint
      {
         return this._transitionTiles[param1].length;
      }
      
      public function getTransitionTile(param1:int, param2:uint) : zSprite
      {
         var _loc3_:Vector.<zSprite> = this._transitionTiles[param1];
         return _loc3_[param2];
      }
      
      public function getNumOverlays() : uint
      {
         return this._pOverlays.length;
      }
      
      public function getOverlay(param1:uint) : BackgroundOverlay
      {
         return this._pOverlays[param1];
      }
      
      public function loadTiles(param1:String, param2:Vector.<zSprite>) : void
      {
         var _loc5_:String = null;
         var _loc6_:GlaControllerSprite = null;
         var _loc3_:Boolean = true;
         var _loc4_:uint = 0;
         while(_loc3_)
         {
            _loc5_ = param1 + _loc4_.toString();
            if((_loc6_ = this._pTileScene.getSprite(_loc5_)) != null)
            {
               param2.push(_loc6_.getSprite());
            }
            else
            {
               _loc3_ = false;
            }
            _loc4_++;
         }
      }
      
      public function loadOverlays(param1:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:GlaScene = null;
         var _loc6_:BackgroundOverlay = null;
         var _loc2_:Boolean = true;
         var _loc3_:uint = 0;
         while(_loc2_)
         {
            _loc4_ = param1 + "_overlay" + _loc3_.toString();
            if((_loc5_ = GameRes.get()._pLevelSet.findScene(_loc4_)) != null)
            {
               _loc6_ = new BackgroundOverlay(_loc4_);
               this._pOverlays.push(_loc6_);
            }
            else
            {
               _loc2_ = false;
            }
            _loc3_++;
         }
      }
   }
}
