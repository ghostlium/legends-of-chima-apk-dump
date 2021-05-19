package game.objects
{
   import game.GameConsts;
   import game.objects.fx.DebrisPiece;
   import game.objects.fx.ShadowedAnimRenderable;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerElement;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.cobraBase.GlaElementRectangle;
   import zufflin.cobraBase.GlaElementZone;
   import zufflin.cobraBase.GlaScene;
   import zufflin.cobraBase.GlaSet;
   import zufflin.core.RigidBody;
   import zufflin.math.AABox2f;
   import zufflin.math.PointSet2f;
   import zufflin.physics2D.CollisionPoly2;
   import zufflin.physics2D.EventContact2;
   import zufflin.physics2D.RigidBody2;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   
   public class ChimaGameObject extends GameObject
   {
      
      public static const CHAR_ANIM_STATIC:int = 0;
      
      public static const CHAR_ANIM_RUN:int = 1;
      
      public static const CHAR_ANIM_RUN_SHOOT:int = 2;
      
      public static const CHAR_ANIM_STAND:int = 3;
      
      public static const CHAR_ANIM_STAND_SHOOT:int = 4;
      
      public static const NUM_CHAR_ANIMS:int = 5;
      
      public static const kfShakeDecreaseRate:Number = 3;
      
      public static const kfMaxShakeDistance:Number = 10;
      
      public static const kfMinDebrisRotVel:Number = 5;
      
      public static const kfMaxDebrisRotVel:Number = 10;
      
      public static const kfMinDebrisVelMag:Number = 100;
      
      public static const kfMaxDebrisVelMag:Number = 300;
      
      public static const kfMinDebrisLifeSpeed:Number = 1;
      
      public static const kfMaxDebrisLifeSpeed:Number = 5;
      
      public static const kfMaxDebrisAngleDeviate:Number = 10;
      
      public static const kuMaxStoredIds:uint = 20;
      
      public static var _nextId:uint = 0;
      
      private static var postfix:Vector.<String> = new <String>["_static","_run","_runshoot","_stand","_standshoot"];
       
      
      public var _side:int;
      
      public var _class:int;
      
      public var _classStr:String;
      
      public var _tribeStr:String;
      
      public var _pAnims:Vector.<ShadowedAnimRenderable>;
      
      public var _name:String;
      
      public var _currAnim:int;
      
      public var _fScale:Number;
      
      public var _fAnimSpeed:Number;
      
      public var _vCharacterOffset:Vec2F;
      
      public var _bHasGun:Boolean;
      
      public var _gunPosition:Vec2F;
      
      public var _pBody:RigidBody2;
      
      public var _eCollisionCat:int;
      
      public var _eCollisionMask:int;
      
      public var _fShakeMagnitude:Number;
      
      public var _bAutoDepth:Boolean;
      
      public var _iDepthOffset:int;
      
      public var _pSet:GlaSet;
      
      public var _vCollisionOffset:Vec2F;
      
      public var _otherIds:Vector.<uint>;
      
      public var _id:uint;
      
      public function ChimaGameObject(param1:int, param2:Vec2F, param3:Number, param4:int, param5:int, param6:GlaSet, param7:String)
      {
         super(param2);
         this._pAnims = new Vector.<ShadowedAnimRenderable>(NUM_CHAR_ANIMS,true);
         this._otherIds = new Vector.<uint>();
         this._side = param1;
         this._class = GameConsts.eChimaNoClass;
         this._fScale = param3;
         this._fAnimSpeed = 1;
         this._vCharacterOffset = new Vec2F();
         this._bHasGun = false;
         this._gunPosition = new Vec2F();
         this._eCollisionCat = param4;
         this._eCollisionMask = param5;
         this._name = param7;
         this._pBody = null;
         this._pSet = param6;
         this._fShakeMagnitude = 0;
         this._bAutoDepth = true;
         this._iDepthOffset = 0;
         this._classStr = "";
         this._tribeStr = "";
         this._id = getNewId();
         super.setScaleF(this._fScale);
         this.initialise();
         this.specificInit();
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this.addEventListener(EventContact2.EVENT_CONTACT2,this.eventContact);
      }
      
      public static function getNewId() : uint
      {
         return _nextId++;
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this.removeEventListener(EventContact2.EVENT_CONTACT2,this.eventContact);
         super.dispose();
      }
      
      public function getCharacterOffset() : Vec2F
      {
         return this._vCharacterOffset;
      }
      
      public function getCollisionCat() : int
      {
         return this._eCollisionCat;
      }
      
      public function getCollisionMask() : int
      {
         return this._eCollisionMask;
      }
      
      public function getGunPosition() : Vec2F
      {
         return this._gunPosition;
      }
      
      public function getSide() : int
      {
         return this._side;
      }
      
      public function setClassType(param1:int) : void
      {
         this._class = param1;
      }
      
      public function getClassType() : int
      {
         return this._class;
      }
      
      public function setClassStr(param1:String) : void
      {
         this._classStr = param1;
      }
      
      public function getClassStr() : String
      {
         return this._classStr;
      }
      
      public function setTribeStr(param1:String) : void
      {
         this._tribeStr = param1;
      }
      
      public function getTribeStr() : String
      {
         return this._tribeStr;
      }
      
      public function getBounds() : AABox2f
      {
         return this._pAnims[CHAR_ANIM_STATIC].getLocalBounds();
      }
      
      public function specificGenerateDebris() : Boolean
      {
         return false;
      }
      
      public function getId() : uint
      {
         return this._id;
      }
      
      public function getCharacterName() : String
      {
         return this._name;
      }
      
      public function initialise() : void
      {
         var _loc1_:uint = 0;
         var _loc3_:GlaControllerElement = null;
         var _loc4_:String = null;
         var _loc5_:GlaScene = null;
         var _loc6_:GlaControllerSprite = null;
         _loc1_ = 0;
         while(_loc1_ < NUM_CHAR_ANIMS)
         {
            _loc4_ = this._name + postfix[_loc1_];
            _loc5_ = this._pSet.findScene(_loc4_);
            this._pAnims[_loc1_] = null;
            if(_loc5_)
            {
               this._pAnims[_loc1_] = new ShadowedAnimRenderable(_loc5_);
               addComponent(this._pAnims[_loc1_]);
               this._pAnims[_loc1_].setEnabled(false);
               if(_loc1_ == CHAR_ANIM_STATIC)
               {
                  this.initialiseCollision(_loc5_,this._eCollisionCat,this._eCollisionMask);
                  this.initialiseGun(_loc5_);
               }
            }
            _loc1_++;
         }
         this._currAnim = CHAR_ANIM_STATIC;
         if(this._pAnims[this._currAnim] != null)
         {
            this._pAnims[this._currAnim].setEnabled(true);
            this._pAnims[this._currAnim].play(true,this._fAnimSpeed);
         }
         var _loc2_:Vector.<GlaControllerElement> = this._pAnims[CHAR_ANIM_STATIC].getController().getElements();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ is GlaControllerSprite)
            {
               _loc6_ = _loc3_ as GlaControllerSprite;
               this._vCharacterOffset.x = _loc6_.getPosition().x;
               this._vCharacterOffset.y = _loc6_.getPosition().y;
               break;
            }
         }
         this._vCollisionOffset = this._pBody.getLocalFixtureBounds().getCentre();
      }
      
      public function getCollisionOffset() : Vec2F
      {
         return this._vCollisionOffset;
      }
      
      public function specificInit() : void
      {
      }
      
      public function specificUpdate(param1:EventUpdate) : void
      {
      }
      
      public function specificContact(param1:EventContact2) : void
      {
      }
      
      public function initialiseCollision(param1:GlaScene, param2:int, param3:int) : void
      {
         var _loc5_:GlaElementZone = null;
         var _loc6_:GlaElementZone = null;
         var _loc7_:Vec2F = null;
         var _loc8_:Vector.<Vec2F> = null;
         var _loc9_:PointSet2f = null;
         var _loc10_:CollisionPoly2 = null;
         var _loc4_:Vector.<GlaElementZone> = new Vector.<GlaElementZone>();
         param1.findZones(_loc4_);
         if(_loc4_.length > 0)
         {
            this._pBody = new RigidBody2(RigidBody.Z_RIGID_BODY_DYNAMIC);
            for each(_loc5_ in _loc4_)
            {
               _loc7_ = (_loc6_ = _loc5_).getPos(0);
               _loc8_ = _loc6_.getPoints();
               (_loc9_ = new PointSet2f(_loc8_)).translate(_loc7_);
               (_loc10_ = new CollisionPoly2(_loc9_,true)).scale(new Vec2F(this._fScale,this._fScale));
               _loc10_.setCollisionCategory(param2);
               _loc10_.setCollisionMask(param3);
               _loc10_.setSensor(true);
               this._pBody.addCollisionFixture(_loc10_);
            }
            addComponent_RigidBody(this._pBody);
         }
      }
      
      public function initialiseGun(param1:GlaScene) : void
      {
         var _loc2_:GlaElementRectangle = param1.findElement("gun_position") as GlaElementRectangle;
         if(_loc2_ != null)
         {
            this._bHasGun = true;
            this._gunPosition.x = _loc2_.getPos(0).x * this._fScale;
            this._gunPosition.y = _loc2_.getPos(0).y * this._fScale;
         }
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc3_:Vec2F = null;
         var _loc4_:int = 0;
         var _loc2_:WorldLayer = getLayer();
         if(_loc2_ == null)
         {
            this.deleteThis();
            trace("SCG: Investigate - object with no layer ... been deleted?");
            return;
         }
         if(_loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         this.specificUpdate(param1);
         if(this._fShakeMagnitude >= 0)
         {
            this._fShakeMagnitude -= kfShakeDecreaseRate * param1.getTime().dt;
            if(this._fShakeMagnitude <= 0)
            {
               this._fShakeMagnitude = 0;
            }
            _loc3_ = new Vec2F(0,kfMaxShakeDistance * this._fShakeMagnitude);
            _loc3_.rotate(Random.RandomFloatRangeUniform(0,Math.PI * 2));
            _loc4_ = 0;
            while(_loc4_ < NUM_CHAR_ANIMS)
            {
               if(this._pAnims[_loc4_])
               {
                  this._pAnims[_loc4_].setPosition(_loc3_);
               }
               _loc4_++;
            }
         }
         _loc4_ = 0;
         while(_loc4_ < NUM_CHAR_ANIMS)
         {
            if(this._pAnims[_loc4_])
            {
               this._pAnims[_loc4_].updateMesh();
            }
            _loc4_++;
         }
         if(this._bAutoDepth)
         {
            this.setDepth(GameConsts.DEPTH_GAME_OBJECTS + this._iDepthOffset - int(getPosition().y));
         }
      }
      
      public function eventContact(param1:EventContact2) : void
      {
         if(param1.contactType == EventContact2.Z_CONTACT_BEGIN)
         {
            this.specificContact(param1);
         }
      }
      
      public function generateDebris(param1:Vec2F) : void
      {
         var _loc2_:GlaControllerScene = null;
         var _loc3_:Vector.<GlaControllerElement> = null;
         var _loc4_:GlaControllerElement = null;
         var _loc5_:GlaControllerElement = null;
         var _loc6_:GlaControllerSprite = null;
         var _loc7_:Vec2F = null;
         var _loc8_:Vec2F = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Vec2F = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:DebrisPiece = null;
         if(!this.specificGenerateDebris())
         {
            _loc2_ = new GlaControllerScene(null,null,this._pSet.findScene(this._name + "_debris"));
            if(_loc2_)
            {
               _loc3_ = _loc2_.getElements();
               for each(_loc4_ in _loc3_)
               {
                  if((_loc5_ = _loc4_) is GlaControllerSprite)
                  {
                     _loc6_ = _loc5_ as GlaControllerSprite;
                     (_loc7_ = new Vec2F()).x = getPosition().x + _loc5_.getPosition().x;
                     _loc7_.y = getPosition().y + _loc5_.getPosition().y;
                     _loc8_ = _loc5_.getScale();
                     _loc9_ = _loc5_.getRotation();
                     _loc10_ = Random.RandomFloatRangeUniform(kfMinDebrisRotVel,kfMaxDebrisRotVel);
                     if(Random.RandomNumberRange(0,1000) < 500)
                     {
                        _loc10_ *= -1;
                     }
                     (_loc11_ = new Vec2F(_loc5_.getPosition().x,_loc5_.getPosition().y)).normalize(1);
                     _loc11_.x *= param1.x;
                     _loc11_.y *= param1.y;
                     _loc12_ = Random.RandomFloatRangeUniform(kfMinDebrisVelMag,kfMaxDebrisVelMag);
                     _loc11_.x *= _loc12_;
                     _loc11_.y *= _loc12_;
                     _loc11_.rotate(MathsHelper.DegToRad(Random.RandomFloatRangeUniform(-0.5 * kfMaxDebrisAngleDeviate,0.5 * kfMaxDebrisAngleDeviate)));
                     _loc13_ = Random.RandomFloatRangeUniform(kfMinDebrisLifeSpeed,kfMaxDebrisLifeSpeed);
                     _loc14_ = new DebrisPiece(_loc6_.getSprite(),_loc7_,_loc8_,_loc9_,_loc11_,_loc10_,_loc13_);
                     getLayer().addObject(_loc14_);
                  }
               }
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
      }
      
      public function setAnim(param1:int) : void
      {
         if(param1 != this._currAnim && this._pAnims[this._currAnim] != null)
         {
            this._pAnims[this._currAnim].setEnabled(false);
            this._currAnim = param1;
            if(this._pAnims[this._currAnim])
            {
               this._pAnims[this._currAnim].setEnabled(true);
               this._pAnims[this._currAnim].play(true,this._fAnimSpeed);
            }
         }
      }
      
      public function pauseAnim() : void
      {
         if(this._pAnims[this._currAnim])
         {
            this._pAnims[this._currAnim].stopAnimation();
         }
      }
      
      public function resumeAnim() : void
      {
         if(this._pAnims[this._currAnim])
         {
            this._pAnims[this._currAnim].play(true,this._fAnimSpeed);
         }
      }
      
      public function getCurrAnim() : int
      {
         return this._currAnim;
      }
      
      public function setCurrAnimValue(param1:int) : void
      {
         this._currAnim = param1;
      }
      
      public function getAnims() : Vector.<ShadowedAnimRenderable>
      {
         return this._pAnims;
      }
      
      public function getAnimSpeed() : Number
      {
         return this._fAnimSpeed;
      }
      
      public function setDepth(param1:int) : void
      {
         var _loc2_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < NUM_CHAR_ANIMS)
         {
            if(this._pAnims[_loc2_])
            {
               this._pAnims[_loc2_].setDepth(param1);
            }
            _loc2_++;
         }
      }
      
      public function setDepthOffset(param1:int) : void
      {
         this._iDepthOffset = param1;
      }
      
      public function setEnableShadow(param1:Boolean) : void
      {
         var _loc2_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < NUM_CHAR_ANIMS)
         {
            if(this._pAnims[_loc2_])
            {
               this._pAnims[_loc2_].setEnableShadow(param1);
            }
            _loc2_++;
         }
      }
      
      public function setShadowOffset(param1:Vec2F) : void
      {
         var _loc2_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < NUM_CHAR_ANIMS)
         {
            if(this._pAnims[_loc2_])
            {
               this._pAnims[_loc2_].setShadowOffset(param1);
            }
            _loc2_++;
         }
      }
      
      public function storeOtherId(param1:uint) : void
      {
         if(this._otherIds.length > kuMaxStoredIds)
         {
            this._otherIds.length = 0;
         }
         this._otherIds.push(param1);
      }
      
      public function isOtherIdStored(param1:uint) : Boolean
      {
         if(this._otherIds.indexOf(param1) != -1)
         {
            return true;
         }
         return false;
      }
   }
}
