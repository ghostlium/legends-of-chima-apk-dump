package game.objects.ui.hud
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.cobraBase.GlaElement;
   import zufflin.cobraBase.GlaElementSprite;
   import zufflin.cobraBase.GlaSet;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldObj;
   import zufflin.world2D.RenderableParticleSystem;
   
   public class HUDFlagBuilder extends UIComponent
   {
      
      public static const HUD_MAX_FLAG_PIECES:int = 8;
       
      
      public var _uActiveFlagScene:uint;
      
      public var _eSide:int;
      
      public var _iNumPieces:int;
      
      public var _pScene:GlaControllerScene;
      
      public var _pFlagScene:Vector.<GlaControllerScene>;
      
      public var _vFlagPos:Vec2F;
      
      public var _fFlagOverallAlpha0:Number;
      
      public var _fFlagOverallAlpha1:Number;
      
      public var _fFlagPieceAlphas00:Number;
      
      public var _fFlagPieceAlphas01:Number;
      
      public var _fFlagPieceAlphas02:Number;
      
      public var _fFlagPieceAlphas03:Number;
      
      public var _fFlagPieceAlphas04:Number;
      
      public var _fFlagPieceAlphas05:Number;
      
      public var _fFlagPieceAlphas06:Number;
      
      public var _fFlagPieceAlphas07:Number;
      
      public var _fFlagPieceAlphas10:Number;
      
      public var _fFlagPieceAlphas11:Number;
      
      public var _fFlagPieceAlphas12:Number;
      
      public var _fFlagPieceAlphas13:Number;
      
      public var _fFlagPieceAlphas14:Number;
      
      public var _fFlagPieceAlphas15:Number;
      
      public var _fFlagPieceAlphas16:Number;
      
      public var _fFlagPieceAlphas17:Number;
      
      public var _pOverallTweener:Vector.<cTweener>;
      
      public var _pFlagPieceTweener:Vector.<cTweener>;
      
      public var _pParticles:RenderableParticleSystem;
      
      public function HUDFlagBuilder()
      {
         super();
         this._pFlagScene = new Vector.<GlaControllerScene>(2,true);
         this._pOverallTweener = new Vector.<cTweener>(2,true);
         this._pFlagPieceTweener = new Vector.<cTweener>(2,true);
         this._uActiveFlagScene = 0;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("hud_flagbuilder"));
         this._vFlagPos = new Vec2F(this._pScene.getRectangle("flagpos").getPosition().x,this._pScene.getRectangle("flagpos").getPosition().y);
         this._vFlagPos.y += LegoChima.Instance().zGetScreenHeight();
         this._pFlagScene[0] = null;
         this._pFlagScene[1] = null;
         this._pOverallTweener[0] = new cTweener();
         this._pOverallTweener[1] = new cTweener();
         this._pFlagPieceTweener[0] = new cTweener();
         this._pFlagPieceTweener[1] = new cTweener();
         this._fFlagOverallAlpha0 = 1;
         this._fFlagOverallAlpha1 = 1;
         this._fFlagPieceAlphas00 = 0;
         this._fFlagPieceAlphas01 = 0;
         this._fFlagPieceAlphas02 = 0;
         this._fFlagPieceAlphas03 = 0;
         this._fFlagPieceAlphas04 = 0;
         this._fFlagPieceAlphas05 = 0;
         this._fFlagPieceAlphas06 = 0;
         this._fFlagPieceAlphas07 = 0;
         this._fFlagPieceAlphas10 = 0;
         this._fFlagPieceAlphas11 = 0;
         this._fFlagPieceAlphas12 = 0;
         this._fFlagPieceAlphas13 = 0;
         this._fFlagPieceAlphas14 = 0;
         this._fFlagPieceAlphas15 = 0;
         this._fFlagPieceAlphas16 = 0;
         this._fFlagPieceAlphas17 = 0;
         setSlideDir(eUISlideLeft);
         this._eSide = GameConsts.eFireChima;
         this._iNumPieces = HUD_MAX_FLAG_PIECES;
      }
      
      override public function dispose() : void
      {
         this._pScene.dispose();
         this._pScene = null;
         if(this._pFlagScene[0] != null)
         {
            this.removeChild(this._pFlagScene[0]);
            this._pFlagScene[0].dispose();
            this._pFlagScene[0] = null;
         }
         if(this._pFlagScene[1] != null)
         {
            this.removeChild(this._pFlagScene[1]);
            this._pFlagScene[1].dispose();
            this._pFlagScene[1] = null;
         }
         this._pOverallTweener[0].dispose();
         this._pOverallTweener[0] = null;
         this._pOverallTweener[1].dispose();
         this._pOverallTweener[1] = null;
         this._pFlagPieceTweener[0].dispose();
         this._pFlagPieceTweener[0] = null;
         this._pFlagPieceTweener[1].dispose();
         this._pFlagPieceTweener[1] = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:GlaControllerSprite = null;
         var _loc7_:String = null;
         var _loc8_:Number = NaN;
         _loc2_ = 0;
         while(_loc2_ < 2)
         {
            if(this._pFlagScene[_loc2_] != null)
            {
               this._pFlagScene[_loc2_].x = this._vFlagPos.x;
               this._pFlagScene[_loc2_].y = this._vFlagPos.y;
            }
            _loc2_++;
         }
         this._pOverallTweener[0].tick(param1.getTime().dt);
         this._pOverallTweener[1].tick(param1.getTime().dt);
         this._pFlagPieceTweener[0].tick(param1.getTime().dt);
         this._pFlagPieceTweener[1].tick(param1.getTime().dt);
         _loc2_ = 0;
         while(_loc2_ < 2)
         {
            _loc4_ = "_fFlagOverallAlpha" + _loc2_.toString();
            if(this._pFlagScene[_loc2_])
            {
               _loc3_ = 0;
               while(_loc3_ < HUD_MAX_FLAG_PIECES)
               {
                  _loc5_ = "build" + _loc3_.toString();
                  if(_loc6_ = this._pFlagScene[_loc2_].getSprite(_loc5_))
                  {
                     _loc7_ = "_fFlagPieceAlphas" + _loc2_.toString() + _loc3_.toString();
                     _loc8_ = this[_loc4_] * this[_loc7_];
                     _loc6_.setAlpha(uint(255 * _loc8_));
                  }
                  _loc3_++;
               }
            }
            _loc2_++;
         }
      }
      
      public function setTribe(param1:GlaSet, param2:String, param3:uint, param4:int = 0) : void
      {
         var _loc5_:String = null;
         var _loc6_:uint = 0;
         var _loc7_:String = null;
         if(this._uActiveFlagScene == 0)
         {
            this._pOverallTweener[this._uActiveFlagScene].addTween(this,"overallflag","_fFlagOverallAlpha0",1,0,1,1,cTweener.LINEAR);
         }
         else
         {
            this._pOverallTweener[this._uActiveFlagScene].addTween(this,"overallflag","_fFlagOverallAlpha1",1,0,1,1,cTweener.LINEAR);
         }
         this._uActiveFlagScene = (this._uActiveFlagScene + 1) % 2;
         this._pOverallTweener[this._uActiveFlagScene].reset();
         if(this._uActiveFlagScene == 0)
         {
            this._fFlagOverallAlpha0 = 1;
            _loc5_ = "_fFlagPieceAlphas0";
         }
         else
         {
            this._fFlagOverallAlpha1 = 1;
            _loc5_ = "_fFlagPieceAlphas1";
         }
         _loc6_ = 0;
         while(_loc6_ < param3)
         {
            this._pFlagPieceTweener[this._uActiveFlagScene].reset();
            _loc7_ = _loc5_ + _loc6_.toString();
            this[_loc7_] = 0;
            _loc6_++;
         }
         if(this._pFlagScene[this._uActiveFlagScene] != null)
         {
            this.removeChild(this._pFlagScene[this._uActiveFlagScene]);
            this._pFlagScene[this._uActiveFlagScene].dispose();
            this._pFlagScene[this._uActiveFlagScene] = null;
         }
         var _loc8_:String = "flag_" + param2;
         this._pFlagScene[this._uActiveFlagScene] = new GlaControllerScene(null,null,param1.findScene(_loc8_));
         this.addChild(this._pFlagScene[this._uActiveFlagScene]);
         this._eSide = param4;
         this._iNumPieces = param3;
      }
      
      public function piecePickedUp(param1:uint) : void
      {
         var _loc2_:uint = 0;
         if(param1 > 0)
         {
            _loc2_ = param1 - 1;
            this.disablePiece(_loc2_);
         }
         this.enablePiece(param1);
      }
      
      public function enablePiece(param1:uint) : void
      {
         var _loc2_:String = null;
         if(this._pFlagScene)
         {
            if(this._uActiveFlagScene == 0)
            {
               _loc2_ = "_fFlagPieceAlphas0" + param1.toString();
            }
            else
            {
               _loc2_ = "_fFlagPieceAlphas1" + param1.toString();
            }
            this._pFlagPieceTweener[this._uActiveFlagScene].addTween(this,"flagpiece",_loc2_,0,1,0.5,0,cTweener.LINEAR);
         }
         if(int(param1) >= this._iNumPieces - 1)
         {
            this.completeParticles();
         }
      }
      
      public function disablePiece(param1:uint) : void
      {
         if(!this._pFlagScene)
         {
         }
      }
      
      public function completeParticles() : void
      {
         var _loc4_:GlaElement = null;
         var _loc5_:Vec2F = null;
         var _loc6_:Particle2D = null;
         var _loc7_:uint = 0;
         var _loc8_:Object = null;
         var _loc9_:WorldObj = null;
         var _loc10_:GlaElementSprite = null;
         var _loc11_:Vec2F = null;
         var _loc12_:Vec2F = null;
         var _loc13_:Vec2F = null;
         GameRes.get()._pFlagCompletedSound.play();
         if(!this._pParticles)
         {
            if((_loc8_ = getWorldObj()) && _loc8_ is WorldObj)
            {
               _loc9_ = _loc8_ as WorldObj;
               this._pParticles = _loc9_.getComponentRenderableParticleSystem();
            }
            if(this._pParticles == null)
            {
               throw new Error("SCG: Need to fix this");
            }
         }
         var _loc1_:Vec2F = new Vec2F(-1000,-1000);
         var _loc2_:Vec2F = new Vec2F(1000,1000);
         var _loc3_:Vector.<GlaElement> = this._pFlagScene[this._uActiveFlagScene].getSrcSceneState().getVisibleElements();
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_ is GlaElementSprite)
            {
               _loc10_ = _loc4_ as GlaElementSprite;
               _loc11_ = new Vec2F(_loc10_.getSprite().getWidth() * 0.5,_loc10_.getSprite().getHeight() * 0.5);
               _loc11_.x += _loc10_.getPos(0).x;
               _loc11_.y += _loc10_.getPos(0).y;
               _loc12_ = new Vec2F(_loc10_.getSprite().getWidth() * -0.5,_loc10_.getSprite().getHeight() * -0.5);
               _loc12_.x += _loc10_.getPos(0).x;
               _loc12_.y += _loc10_.getPos(0).y;
               _loc1_.x = Math.max(_loc1_.x,_loc11_.x);
               _loc1_.y = Math.max(_loc1_.y,_loc11_.y);
               _loc2_.x = Math.min(_loc2_.x,_loc12_.x);
               _loc2_.y = Math.min(_loc2_.y,_loc12_.y);
            }
         }
         _loc5_ = new Vec2F(_loc1_.x - _loc2_.x,_loc1_.y - _loc2_.y);
         _loc7_ = 0;
         while(_loc7_ < 7)
         {
            if((_loc6_ = this._pParticles.addParticle()) != null)
            {
               _loc6_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc6_.setSprite(GameRes.get()._pPickUpGreenSparkleSprite);
               (_loc13_ = new Vec2F()).x = Random.RandomFloatRangeUniform(_loc5_.x * -0.5,_loc5_.x * 0.5);
               _loc13_.y = -Random.RandomFloatRangeUniform(0,_loc5_.y);
               _loc6_.setPosition(new Vec2F(this._vFlagPos.x + _loc13_.x,this._vFlagPos.y + _loc13_.y),true);
               _loc6_.addSizeKeyF(0);
               _loc6_.addSizeKeyF(Random.RandomFloatRangeUniform(3,4));
               _loc6_.setLife(Random.RandomFloatRangeUniform(0.3,0.5));
               _loc6_.setRotation(Random.RandomFloatRangeUniform(0,Math.PI * 2));
               _loc6_.setColor(new RGBA(255,255,255,255));
               _loc6_.addAlphaKey(255);
               _loc6_.addAlphaKey(0);
               _loc6_.setDelay(5 + (_loc7_ * 3 + Random.RandomNumberRange(0,2)));
               _loc6_.finalise();
            }
            _loc7_++;
         }
      }
   }
}
