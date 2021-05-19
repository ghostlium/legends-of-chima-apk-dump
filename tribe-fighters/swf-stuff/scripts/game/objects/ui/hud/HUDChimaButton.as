package game.objects.ui.hud
{
   import game.GameRes;
   import game.GameWorld;
   import game.objects.Player;
   import game.objects.ui.UIComponent;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.events.TouchPhase;
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.core.zMaterial;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   
   public class HUDChimaButton extends UIComponent
   {
      
      public static const kfChimaButtonChargeLerpRate:Number = 6;
      
      public static const kfChimaButtonRotationSpeed:Number = 2;
       
      
      public var _pAnim:GlaControllerScene;
      
      public var _fCharge:Number;
      
      public var _fDisplayCharge:Number;
      
      public var _hitbox:AABox2f;
      
      public function HUDChimaButton()
      {
         super();
         this._fCharge = 0;
         this._fDisplayCharge = 0;
         setSlideDir(eUISlideRight);
         this._pAnim = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("hud_chimabutton"));
         this._pAnim.setPosition(new Vec2F(768,1024));
         this._hitbox = this._pAnim.getRectangle("hitbox").getSrcRectangle().getAABox(0);
         this._hitbox.translate(this._pAnim.getPosition());
         this.addEventListener(TouchEvent.TOUCH,this.eventTouch);
         this.addChild(this._pAnim);
         var _loc1_:GlaControllerSprite = this._pAnim.getSprite("star0");
         var _loc2_:GlaControllerSprite = this._pAnim.getSprite("star1");
         var _loc3_:GlaControllerSprite = this._pAnim.getSprite("glow");
         var _loc4_:GlaControllerSprite = this._pAnim.getSprite("spin");
         _loc1_.alignPivot();
         _loc2_.alignPivot();
         _loc3_.alignPivot();
         _loc4_.alignPivot();
         _loc1_.setPosition(_loc1_.getPosition());
         _loc2_.setPosition(_loc2_.getPosition());
         _loc3_.setPosition(_loc3_.getPosition());
         _loc4_.setPosition(_loc4_.getPosition());
      }
      
      override public function dispose() : void
      {
         this.removeEventListener(TouchEvent.TOUCH,this.eventTouch);
         this.removeChild(this._pAnim);
         this._pAnim.dispose();
         this._pAnim = null;
         super.dispose();
      }
      
      public function getButtonPosition() : Vec2F
      {
         return this._hitbox.getCentre();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc6_:Number = NaN;
         var _loc9_:Player = null;
         this._fDisplayCharge = MathsHelper.Lerp(this._fDisplayCharge,this._fCharge,kfChimaButtonChargeLerpRate * param1.getTime().dt);
         if(this._fDisplayCharge > 1)
         {
            this._fDisplayCharge = 1;
         }
         var _loc2_:GlaControllerSprite = this._pAnim.getSprite("star0");
         var _loc3_:GlaControllerSprite = this._pAnim.getSprite("star1");
         var _loc4_:GlaControllerSprite = this._pAnim.getSprite("glow");
         var _loc5_:GlaControllerSprite = this._pAnim.getSprite("spin");
         if(this._fCharge >= 1)
         {
            this._fCharge = 1;
            _loc5_.setActive(true);
            _loc4_.setBlendMode(zMaterial.Z_BLEND_ALPHA_ADD);
            _loc2_.setBlendMode(zMaterial.Z_BLEND_ALPHA_ADD);
            _loc3_.setBlendMode(zMaterial.Z_BLEND_ALPHA_ADD);
         }
         else
         {
            _loc5_.setActive(false);
            _loc4_.setBlendMode(zMaterial.Z_BLEND_ALPHA);
            _loc2_.setBlendMode(zMaterial.Z_BLEND_ALPHA);
            _loc3_.setBlendMode(zMaterial.Z_BLEND_ALPHA);
         }
         if((_loc6_ = (_loc6_ = _loc5_.getRotation()) + kfChimaButtonRotationSpeed * param1.getTime().dt) >= Math.PI * 2)
         {
            _loc6_ -= Math.PI * 2;
         }
         _loc5_.setRotation(_loc6_);
         if((_loc6_ = (_loc6_ = _loc2_.getRotation()) + kfChimaButtonRotationSpeed * param1.getTime().dt) >= Math.PI * 2)
         {
            _loc6_ -= Math.PI * 2;
         }
         _loc2_.setRotation(_loc6_);
         if((_loc6_ = (_loc6_ = _loc3_.getRotation()) - kfChimaButtonRotationSpeed * param1.getTime().dt) <= -Math.PI * 2)
         {
            _loc6_ += Math.PI * 2;
         }
         _loc3_.setRotation(_loc6_);
         var _loc7_:Vec2F = new Vec2F(this._fDisplayCharge,this._fDisplayCharge);
         _loc4_.setScale(_loc7_);
         _loc2_.setScale(_loc7_);
         _loc3_.setScale(_loc7_);
         var _loc8_:Number = 0.9 + 0.1 * Math.sin(_loc6_);
         _loc7_.scaleBy(_loc8_);
         _loc5_.setScale(_loc7_);
         if(LegoChima.Instance().GetKeyJustPressed(LegoChima.kiKeyboardSuperweapon,true))
         {
            if((_loc9_ = GameWorld.get().getPlayer()) != null)
            {
               _loc9_.activateChimaPower();
            }
         }
      }
      
      private function eventTouch(param1:TouchEvent) : void
      {
         var _loc3_:Player = null;
         var _loc2_:Touch = param1.getTouch(this);
         if(_loc2_ && _loc2_.phase == TouchPhase.BEGAN)
         {
            _loc3_ = GameWorld.get().getPlayer();
            if(_loc3_ != null)
            {
               _loc3_.activateChimaPower();
            }
         }
      }
      
      public function addCharge(param1:Number) : void
      {
         this._fCharge += param1;
      }
      
      public function setCharge(param1:Number) : void
      {
         this._fCharge = param1;
      }
      
      public function getCharge() : Number
      {
         return this._fCharge;
      }
   }
}
