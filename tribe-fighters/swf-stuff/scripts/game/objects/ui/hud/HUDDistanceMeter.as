package game.objects.ui.hud
{
   import game.CharData;
   import game.GameRes;
   import game.GameWorld;
   import game.Util;
   import game.objects.events.EventPlayerDistanceRan;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.world.EventUpdate;
   
   public class HUDDistanceMeter extends UIComponent
   {
       
      
      public var _pAnim:GlaControllerScene;
      
      public var _vDistancePos:Vec2F;
      
      public var _pParticles:ParticleManager2D;
      
      public var _bPassedBestDistance:Boolean;
      
      public var _fTempDistance:Number;
      
      public var _uDistance:uint;
      
      public var _distanceText:String;
      
      public var _fScale:Number;
      
      public var _pTweener:cTweener;
      
      private var _tf:TextField;
      
      public function HUDDistanceMeter()
      {
         super();
         this._vDistancePos = new Vec2F();
         this._fTempDistance = 0;
         this._uDistance = 0;
         this._fScale = 1;
         this._distanceText = "";
         this._bPassedBestDistance = false;
         setSlideDir(eUISlideRight);
         this._pAnim = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("hud_distance"));
         this._pAnim.setPosition(new Vec2F(LegoChima.Instance().zGetScreenWidth(),0));
         this._vDistancePos = this._pAnim.getRectangle("hud_distance").getPosition();
         this._pTweener = new cTweener();
         this._pParticles = new ParticleManager2D(20);
         this.addChild(this._pAnim);
         this._tf = new TextField(200,44,"",GameRes.get()._pArialUnicode32,32,16777215);
         this._tf.alignPivot(HAlign.RIGHT,VAlign.TOP);
         this._tf.touchable = false;
         this._tf.autoScale = true;
         this._tf.hAlign = HAlign.RIGHT;
         this._tf.vAlign = VAlign.CENTER;
         this._tf.x = this._vDistancePos.x;
         this._tf.y = this._vDistancePos.y;
         this.addChild(this._tf);
         this.addChild(this._pParticles);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._pAnim);
         this._pAnim.dispose();
         this._pAnim = null;
         this._pTweener.dispose();
         this._pTweener = null;
         this.removeChild(this._pParticles);
         this._pParticles.dispose();
         this._pParticles = null;
         super.dispose();
      }
      
      public function getDistance() : uint
      {
         return this._uDistance;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._pAnim.x = this._vDistancePos.x + this._pAnim.getPosition().x;
         this._pAnim.y = this._vDistancePos.y + this._pAnim.getPosition().y;
         this._tf.x = this._pAnim.x;
         this._tf.y = this._pAnim.y;
         this._tf.scaleX = this._fScale;
         this._tf.scaleY = this._fScale;
         this._tf.text = this._distanceText;
         this._pTweener.tick(param1.getTime().dt);
         this._pParticles.x = this._pAnim.x;
         this._pParticles.y = this._pAnim.y;
         this._pParticles.update(param1.getTime());
      }
      
      public function addDistance(param1:Number) : void
      {
         var _loc2_:CharData = null;
         this._fTempDistance += param1;
         if(this._fTempDistance >= 1)
         {
            this._fTempDistance = this._fTempDistance - 1;
            ++this._uDistance;
            this.updateDistanceText();
            if(this._uDistance % 10 == 0)
            {
               if(isAnythingVisible())
               {
                  GameRes.get()._pDistanceSound.play();
               }
               this._pTweener.addTween(this,"distancescale","_fScale",1,1.5,0.1,0,cTweener.CIRC,cTweener.EASE_OUT);
               this._pTweener.addTween(this,"distancescale","_fScale",1.5,1,0.3,0.1,cTweener.LINEAR,cTweener.EASE_IN,0,false);
            }
            if(GameWorld.get().getPlayer() && !this._bPassedBestDistance)
            {
               _loc2_ = GameWorld.get().getSaveData().getCharSlot(GameWorld.get().getPlayer().getSaveSlot());
               if(this._uDistance >= _loc2_.highestDistanceTravelled && _loc2_.highestDistanceTravelled != 0)
               {
                  this.passedPreviousBest();
               }
            }
            Main.Instance().m_app.dispatchEvent(new EventPlayerDistanceRan(EventPlayerDistanceRan.EVENT_PLAYER_DISTANCE_RAN,false,this._uDistance,1));
         }
      }
      
      public function setDistance(param1:uint) : void
      {
         this._bPassedBestDistance = false;
         this._fTempDistance = 0;
         this._uDistance = param1;
         this.updateDistanceText();
      }
      
      public function updateDistanceText() : void
      {
         this._distanceText = GameWorld.get().getLanguage().getString("hud_distance");
         this._distanceText = this._distanceText.replace("$(DISTANCE)",Util.getFormattedNumber(this._uDistance));
         this._distanceText = this._distanceText.replace("$(METRES)",GameWorld.get().getLanguage().getString("metres"));
      }
      
      public function passedPreviousBest() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:Particle2D = null;
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         if(isAnythingVisible())
         {
            GameRes.get()._pPassedBestSound.play();
         }
         this._bPassedBestDistance = true;
         if(this._uDistance > 1)
         {
            _loc1_ = 10 + Random.RandomNumberRange(0,10);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this._pParticles.addParticle();
               if(_loc3_ != null)
               {
                  _loc3_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
                  _loc3_.setSprite(GameRes.get()._pPickUpGreenSparkleSprite);
                  _loc4_ = new Vec2F();
                  _loc3_.setPosition(_loc4_);
                  _loc5_ = new Vec2F(Random.RandomFloatRangeUniform(-1,1),Random.RandomFloatRangeUniform(-1,1));
                  while(_loc5_.length == 0)
                  {
                     _loc5_ = new Vec2F(Random.RandomFloatRangeUniform(-1,1),Random.RandomFloatRangeUniform(-1,1));
                  }
                  _loc5_.normalize(1);
                  _loc5_.scaleBy(Random.RandomFloatRangeUniform(100,300));
                  _loc3_.setVelocity(_loc5_,0.7);
                  _loc3_.setRotationAndSpeed(Random.RandomFloatRangeUniform(0,Math.PI * 2),Random.RandomFloatRangeUniform(-10,10));
                  _loc3_.setSize(0);
                  _loc3_.addSizeKeyF(0);
                  _loc3_.addSizeKeyF(Random.RandomFloatRangeUniform(0.8,2.3));
                  _loc3_.addSizeKeyF(0);
                  _loc3_.setLife(1);
                  _loc3_.setColor(new RGBA(255,255,255,0));
                  _loc3_.addAlphaKey(0);
                  _loc3_.addAlphaKey(255);
                  _loc3_.addAlphaKey(0);
                  _loc3_.finalise();
               }
               _loc2_++;
            }
         }
      }
   }
}
