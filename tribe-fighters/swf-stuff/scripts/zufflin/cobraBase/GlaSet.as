package zufflin.cobraBase
{
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import resource.ResManager;
   import util.ByteArrayExt;
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.core.SCG_Texture;
   import zufflin.core.zSprite;
   import zufflin.math.zTriangulate;
   
   public class GlaSet
   {
      
      public static const MAX_SUPPORTED_VERSION:int = 21;
      
      public static const PROP_TYPE_INT:int = 1;
      
      public static const PROP_TYPE_FLOAT:int = 2;
      
      public static const PROP_TYPE_REF_ELEMENT:int = 3;
      
      public static const PROP_TYPE_REF_SCENE:int = 4;
      
      public static const PROP_TYPE_REF_TEMPLATE:int = 5;
      
      public static const PROP_TYPE_STRING:int = 6;
      
      public static const PROP_TYPE_BOOL:int = 7;
      
      public static const PROP_TYPE_ENUM:int = 8;
      
      public static const PROP_TYPE_REF_MODEL:int = 9;
      
      public static const PROP_TYPE_RGBA:int = 10;
      
      public static const PROP_TYPE_TEXTURE:int = 11;
      
      public static const PROP_TYPE_REF_SCENE_STATE:int = 12;
      
      public static const PROP_TYPE_REF_SCRIPT:int = 13;
      
      public static const ELEMENT_SPRITE:int = 1;
      
      public static const ELEMENT_SPRITE_POS:int = 2;
      
      public static const ELEMENT_SPRITE_STATIC:int = 3;
      
      public static const ELEMENT_PATH:int = 4;
      
      public static const ELEMENT_RECTANGLE:int = 5;
      
      public static const ELEMENT_GAME_OBJ:int = 6;
      
      public static const ELEMENT_POLY:int = 7;
      
      public static const ELEMENT_MARKER:int = 8;
      
      public static const ELEMENT_SPRITE_CLIP:int = 9;
      
      public static const ELEMENT_TEXT_BOX:int = 10;
      
      public static const ELEMENT_SCENE:int = 11;
      
      public static const ELEMENT_EVENT:int = 12;
      
      public static const ELEMENT_MULTI_SPRITE:int = 13;
      
      public static const ELEMENT_SURFACE:int = 14;
      
      public static const ELEMENT_ZONE:int = 15;
      
      public static const ELEMENT_GROUP:int = 16;
      
      public static const ELEMENT_POLY_TEXTURED:int = 17;
      
      public static const ELEMENT_MODEL:int = 18;
      
      public static const ELEMENT_AI_PATH:int = 19;
      
      public static const ELEMENT_MODEL_V2:int = 20;
      
      public static const ELEMENT_PARTICLE_EMITER:int = 21;
      
      public static const ELEMENT_TILEMAP:int = 22;
      
      public static const ELEMENT_CUSTOM:int = 23;
      
      public static const ELEMENT_SHIP_PATH:int = 24;
      
      public static var loadVersion:int = 0;
      
      public static var scene_ref_patches:Vector.<SceneRefPatch> = new Vector.<SceneRefPatch>();
      
      public static var element_ref_patches:Vector.<ElementRefPatch> = new Vector.<ElementRefPatch>();
       
      
      public var vScenes:Vector.<GlaScene>;
      
      public var vTemplates:Vector.<GlaTemplate>;
      
      public var vEnumSets:Vector.<GlaEnumSet>;
      
      public var bPartialLoad:Boolean;
      
      public var currentScale:Number;
      
      public function GlaSet()
      {
         super();
         this.bPartialLoad = false;
         this.currentScale = 1;
         this.vScenes = new Vector.<GlaScene>();
         this.vTemplates = new Vector.<GlaTemplate>();
         this.vEnumSets = new Vector.<GlaEnumSet>();
      }
      
      public static function loadSprite(param1:String, param2:String, param3:uint) : zSprite
      {
         var _loc5_:int;
         var _loc4_:String;
         if((_loc5_ = (_loc4_ = param1).lastIndexOf(".cgla")) >= 0)
         {
            while(_loc5_ > 0 && _loc4_.charAt(_loc5_) != "/")
            {
               _loc5_--;
            }
            _loc4_ = _loc4_.slice(0,_loc5_);
         }
         var _loc6_:String = _loc4_ + "/" + param2;
         var _loc7_:SCG_Texture = ResManager.getTexture(_loc6_);
         var _loc8_:zSprite;
         (_loc8_ = new zSprite(_loc7_)).setName(param2);
         return _loc8_;
      }
      
      public static function loadTexture(param1:String) : SCG_Texture
      {
         return ResManager.getTexture(param1);
      }
      
      public static function loadBoolTrack(param1:ByteArray, param2:GlaTrackBool) : void
      {
         var _loc5_:GlaKey = null;
         var _loc3_:int = param1.readUnsignedShort();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new GlaKey()).frame = param1.readInt();
            _loc5_.value = param1.readBoolean();
            param2.vKeys.push(_loc5_);
            _loc4_++;
         }
      }
      
      public static function loadFloatTrack(param1:ByteArray, param2:GlaTrackFloat) : void
      {
         var _loc5_:GlaKey = null;
         var _loc3_:int = param1.readUnsignedShort();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new GlaKey()).frame = param1.readInt();
            _loc5_.value = param1.readFloat();
            param2.vKeys.push(_loc5_);
            _loc4_++;
         }
      }
      
      public static function loadIntTrack(param1:ByteArray, param2:GlaTrackInt) : void
      {
         var _loc5_:GlaKey = null;
         var _loc3_:int = param1.readUnsignedShort();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new GlaKey()).frame = param1.readInt();
            _loc5_.value = param1.readInt();
            param2.vKeys.push(_loc5_);
            _loc4_++;
         }
      }
      
      public static function loadRotationTrack(param1:ByteArray, param2:GlaTrackFloat) : void
      {
         var _loc5_:GlaKey = null;
         var _loc3_:int = param1.readUnsignedShort();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new GlaKey()).frame = param1.readInt();
            _loc5_.value = -param1.readFloat();
            param2.vKeys.push(_loc5_);
            _loc4_++;
         }
      }
      
      public static function skipFloatTrack(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readUnsignedShort();
         param1.position = _loc2_ * 8 + param1.position;
      }
      
      public static function loadVec2fTrack(param1:ByteArray, param2:GlaTrackVec2f) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:GlaKey = null;
         var _loc6_:Vec2F = null;
         if(loadVersion == 1)
         {
            throw new Error("SCG - Should not be in here");
         }
         _loc3_ = param1.readUnsignedShort();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new GlaKey()).frame = param1.readInt();
            (_loc6_ = new Vec2F()).x = param1.readFloat();
            _loc6_.y = param1.readFloat();
            _loc5_.value = _loc6_;
            param2.vKeys.push(_loc5_);
            _loc4_++;
         }
      }
      
      public static function loadColorTrack(param1:ByteArray, param2:GlaTrackRGBA) : void
      {
         var _loc5_:GlaKey = null;
         var _loc6_:RGBA = null;
         var _loc3_:int = param1.readUnsignedShort();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new GlaKey()).frame = param1.readInt();
            (_loc6_ = new RGBA()).setFromUint32(param1.readUnsignedInt());
            _loc5_.value = _loc6_;
            param2.vKeys.push(_loc5_);
            _loc4_++;
         }
      }
      
      public static function loadSpriteTrack(param1:String, param2:ByteArray, param3:GlaTrackSprite, param4:int) : void
      {
         var _loc7_:GlaKey = null;
         var _loc8_:String = null;
         var _loc9_:zSprite = null;
         var _loc5_:int = param2.readUnsignedShort();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            (_loc7_ = new GlaKey()).frame = param2.readInt();
            if((_loc8_ = ByteArrayExt.readString8_Old(param2)).length != 0)
            {
               _loc9_ = GlaSet.loadSprite(param1,_loc8_,param4);
               _loc7_.value = _loc9_;
            }
            else
            {
               _loc7_.value = null;
            }
            param3.vKeys.push(_loc7_);
            _loc6_++;
         }
      }
      
      public static function loadTextureTrack(param1:ByteArray, param2:GlaTrackTexture) : void
      {
         var _loc5_:GlaKey = null;
         var _loc6_:String = null;
         var _loc7_:SCG_Texture = null;
         var _loc3_:int = param1.readUnsignedShort();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new GlaKey()).frame = param1.readInt();
            if((_loc6_ = ByteArrayExt.readString8_Old(param1)).length != 0)
            {
               _loc7_ = GlaSet.loadTexture(_loc6_);
               _loc5_.value = _loc7_;
            }
            else
            {
               _loc5_.value = null;
            }
            param2.vKeys.push(_loc5_);
            _loc4_++;
         }
      }
      
      public static function loadTextureNrmlTrack(param1:GlaTrackTexture, param2:GlaTrackTexture) : void
      {
         var _loc5_:GlaKey = null;
         var _loc3_:int = param1.getNumKeys();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new GlaKey();
            param2.vKeys.push(_loc5_);
            _loc4_++;
         }
      }
      
      public static function loadSceneRefTrack(param1:ByteArray, param2:GlaTrackSceneRef, param3:int) : void
      {
         var _loc6_:GlaKey = null;
         var _loc7_:String = null;
         var _loc4_:int = param1.readUnsignedShort();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            (_loc6_ = new GlaKey()).frame = param1.readInt();
            _loc7_ = ByteArrayExt.readString8_Old(param1);
            _loc6_.value = null;
            param2.vKeys.push(_loc6_);
            scene_ref_patches.push(new SceneRefPatch(_loc7_,_loc6_));
            _loc5_++;
         }
      }
      
      public static function loadProp(param1:String, param2:GlaSceneState, param3:ByteArray, param4:Boolean = false) : GlaProp
      {
         var _loc7_:RGBA = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:SCG_Texture = null;
         var _loc11_:GlaPropTexture = null;
         var _loc5_:String = ByteArrayExt.readString8_Old(param3);
         var _loc6_:int = param3.readByte();
         switch(_loc6_)
         {
            case PROP_TYPE_INT:
               return new GlaPropInt(_loc5_,param3.readInt());
            case PROP_TYPE_FLOAT:
               return new GlaPropFloat(_loc5_,param3.readFloat());
            case PROP_TYPE_REF_ELEMENT:
               throw new Error("SCG : prop type PROP_TYPE_REF_ELEMENT");
            case PROP_TYPE_REF_SCENE:
               return new GlaPropRefScene(param2,_loc5_,ByteArrayExt.readString8_Old(param3));
            case PROP_TYPE_REF_TEMPLATE:
               throw new Error("SCG : prop type PROP_TYPE_REF_TEMPLATE");
            case PROP_TYPE_STRING:
               return new GlaPropString(_loc5_,ByteArrayExt.readString8_Old(param3));
            case PROP_TYPE_BOOL:
               return new GlaPropBool(_loc5_,param3.readBoolean());
            case PROP_TYPE_ENUM:
               return new GlaPropEnum(_loc5_,param3.readInt());
            case PROP_TYPE_REF_MODEL:
               break;
            case PROP_TYPE_RGBA:
               (_loc7_ = new RGBA()).setFromUint32(param3.readUnsignedInt());
               return new GlaPropRGBA(_loc5_,_loc7_);
            case PROP_TYPE_TEXTURE:
               if(!(_loc8_ = ByteArrayExt.readString8_Old(param3)).length == 0)
               {
                  _loc9_ = param1 + "/" + _loc8_;
                  _loc10_ = null;
                  if(!param4)
                  {
                     _loc10_ = GlaSet.loadTexture(_loc9_);
                  }
                  return new GlaPropTexture(_loc5_,_loc10_,_loc9_);
               }
               return new GlaPropTexture(_loc5_,null,null);
               break;
            case PROP_TYPE_REF_SCENE_STATE:
               return new GlaPropRefState(param2,_loc5_,ByteArrayExt.readString8_Old(param3));
            case PROP_TYPE_REF_SCRIPT:
               throw new Error("SCG : prop type PROP_TYPE_REF_SCRIPT");
         }
         return null;
      }
      
      public static function loadAll(param1:String, param2:ByteArray, param3:int = 0, param4:Boolean = false) : GlaSet
      {
         scene_ref_patches.length = 0;
         return load(param1,param2,null,param3,param4);
      }
      
      public static function load(param1:String, param2:ByteArray, param3:Vector.<String> = null, param4:int = 0, param5:Boolean = false) : GlaSet
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:GlaTemplate = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:String = null;
         var _loc19_:GlaEnumSet = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:uint = 0;
         var _loc23_:String = null;
         var _loc24_:GlaScene = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:String = null;
         var _loc31_:GlaSceneState = null;
         var _loc32_:GlaScene = null;
         var _loc33_:GlaElement = null;
         var _loc6_:GlaSet = new GlaSet();
         if(param3 != null && param3.length == 0)
         {
            _loc6_.bPartialLoad = true;
         }
         param2.position = 0;
         param2.endian = Endian.LITTLE_ENDIAN;
         loadVersion = param2.readUnsignedShort();
         var _loc7_:Boolean = !!(loadVersion & 32768) ? true : false;
         loadVersion &= 32767;
         param2.readUnsignedShort();
         param2.readUnsignedInt();
         var _loc8_:int = param2.readUnsignedShort();
         var _loc9_:GlaTemplate = new GlaTemplate();
         _loc6_.vTemplates.push(_loc9_);
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc14_ = new GlaTemplate();
            _loc6_.vTemplates.push(_loc14_);
            _loc14_.name = ByteArrayExt.readString8_Old(param2);
            _loc14_.nameHash.set(_loc14_.name);
            _loc15_ = param2.readUnsignedShort();
            _loc16_ = 0;
            while(_loc16_ < _loc15_)
            {
               _loc17_ = param2.readByte();
               _loc18_ = ByteArrayExt.readString8_Old(param2);
               _loc14_.vTypes[_loc18_] = _loc17_;
               if(_loc17_ == PROP_TYPE_ENUM)
               {
                  _loc19_ = new GlaEnumSet();
                  _loc6_.vEnumSets.push(_loc19_);
                  _loc20_ = param2.readInt();
                  _loc21_ = 0;
                  while(_loc21_ < _loc20_)
                  {
                     _loc19_.names.push(ByteArrayExt.readString8_Old(param2));
                     _loc21_++;
                  }
               }
               _loc16_++;
            }
            _loc10_++;
         }
         var _loc11_:int = param2.readUnsignedShort();
         _loc12_ = 0;
         for(; _loc12_ < _loc11_; _loc12_++)
         {
            _loc22_ = param2.readUnsignedInt() + param2.position;
            _loc23_ = ByteArrayExt.readString8_Old(param2);
            if(param3 != null && param3.length > 0)
            {
               if((_loc27_ = param3.indexOf(_loc23_)) == -1)
               {
                  param2.position = _loc22_;
                  continue;
               }
            }
            _loc24_ = new GlaScene();
            _loc6_.addScene(_loc24_);
            _loc24_.setName(_loc23_);
            _loc25_ = param2.readUnsignedShort();
            _loc26_ = 0;
            while(_loc26_ < _loc25_)
            {
               ByteArrayExt.readString8_Old(param2);
               _loc26_++;
            }
            if(loadVersion < 13)
            {
               throw new Error("load version <= 13");
            }
            _loc24_.pTemplate = _loc6_.findTemplate(ByteArrayExt.readString8_Old(param2));
            _loc15_ = param2.readUnsignedShort();
            _loc16_ = 0;
            while(_loc16_ < _loc15_)
            {
               _loc24_.addProp(loadProp(param1,null,param2));
               _loc16_++;
            }
            if(loadVersion >= 16)
            {
               if((_loc30_ = ByteArrayExt.readString8_Old(param2)).length > 0)
               {
                  _loc24_.customRendererName = _loc30_;
               }
            }
            _loc28_ = param2.readUnsignedShort();
            _loc29_ = 0;
            while(_loc29_ < _loc28_)
            {
               _loc31_ = new GlaSceneState();
               _loc24_.addState(_loc31_);
               _loc31_.setName(ByteArrayExt.readString8_Old(param2));
               _loc31_.size.x = param2.readFloat();
               _loc31_.size.y = param2.readFloat();
               _loc31_.fps = param2.readFloat();
               _loc31_.background.setFromUint32(param2.readUnsignedInt());
               _loc31_.numFrames = param2.readShort();
               _loc31_.maxBounds.min.x = param2.readFloat();
               _loc31_.maxBounds.min.y = param2.readFloat();
               _loc31_.maxBounds.max.x = param2.readFloat();
               _loc31_.maxBounds.max.y = param2.readFloat();
               _loc31_.pTemplate = _loc6_.findTemplate(ByteArrayExt.readString8_Old(param2));
               _loc15_ = param2.readShort();
               _loc16_ = 0;
               while(_loc16_ < _loc15_)
               {
                  _loc31_.addProp(loadProp(param1,_loc31_,param2));
                  _loc16_++;
               }
               loadElements(param1,param2,_loc6_,_loc31_,param4,param5,_loc7_);
               _loc29_++;
            }
         }
         _loc13_ = 0;
         while(_loc13_ < scene_ref_patches.length)
         {
            if((_loc32_ = _loc6_.findScene(scene_ref_patches[_loc13_].sceneName)) != null)
            {
               scene_ref_patches[_loc13_].ppScene.value = _loc32_;
            }
            _loc13_++;
         }
         scene_ref_patches.length = 0;
         _loc13_ = 0;
         while(_loc13_ < element_ref_patches.length)
         {
            if((_loc33_ = element_ref_patches[_loc13_].pState.findElement(element_ref_patches[_loc13_].elementName)) != null)
            {
               element_ref_patches[_loc13_].ppElement.pElement = _loc33_;
            }
            _loc13_++;
         }
         element_ref_patches.length = 0;
         return _loc6_;
      }
      
      public static function loadElements(param1:String, param2:ByteArray, param3:GlaSet, param4:GlaSceneState, param5:int, param6:Boolean = false, param7:Boolean = false) : void
      {
         var _loc10_:int = 0;
         var _loc11_:GlaElementSprite = null;
         var _loc12_:GlaElementPath = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Vec2F = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:GlaElementRectangle = null;
         var _loc19_:GlaElementGameObj = null;
         var _loc20_:int = 0;
         var _loc21_:GlaKey = null;
         var _loc22_:GlaProp = null;
         var _loc23_:GlaElementMarker = null;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:GlaElementSprite = null;
         var _loc27_:GlaElementTextBox = null;
         var _loc28_:GlaElementScene = null;
         var _loc29_:GlaKey = null;
         var _loc30_:GlaElementZone = null;
         var _loc31_:int = 0;
         var _loc32_:Vec2F = null;
         var _loc33_:String = null;
         var _loc34_:ElementAndMsg = null;
         var _loc35_:GlaElementPolyTextured = null;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:Vec2F = null;
         var _loc39_:GlaElementShipPath = null;
         var _loc40_:int = 0;
         var _loc41_:int = 0;
         var _loc42_:int = 0;
         var _loc43_:int = 0;
         var _loc44_:ShipDetails = null;
         var _loc45_:String = null;
         var _loc8_:int = param2.readShort();
         var _loc9_:int = 0;
         while(true)
         {
            if(_loc9_ >= _loc8_)
            {
               return;
            }
            _loc10_ = param2.readByte();
            switch(_loc10_)
            {
               case ELEMENT_SPRITE:
                  (_loc11_ = new GlaElementSprite()).spriteType = ELEMENT_SPRITE;
                  param4.addVisibleElement(_loc11_);
                  _loc11_.setName(ByteArrayExt.readString8_Old(param2));
                  if(loadVersion >= 5)
                  {
                     _loc11_.blendMode = param2.readInt();
                     _loc11_.layer = param2.readInt();
                  }
                  loadBoolTrack(param2,_loc11_.trkActive);
                  if(loadVersion >= 5)
                  {
                     loadFloatTrack(param2,_loc11_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc11_.trkPosition);
                  if(loadVersion == 1)
                  {
                     skipFloatTrack(param2);
                  }
                  loadRotationTrack(param2,_loc11_.trkRotation);
                  loadVec2fTrack(param2,_loc11_.trkScale);
                  loadVec2fTrack(param2,_loc11_.trkPivot);
                  loadColorTrack(param2,_loc11_.trkColor);
                  loadSpriteTrack(param1,param2,_loc11_.trkSprite,param5);
                  if(loadVersion >= 14)
                  {
                     _loc11_.depthE = param2.readInt();
                  }
                  break;
               case ELEMENT_SPRITE_POS:
                  throw new Error("SCG ELEMENT_SPRITE_POS ");
               case ELEMENT_SPRITE_STATIC:
                  throw new Error("SCG ELEMENT_SPRITE_STATIC ");
               case ELEMENT_PATH:
                  _loc12_ = new GlaElementPath();
                  param4.addControlElement(_loc12_);
                  _loc12_.setName(ByteArrayExt.readString8_Old(param2));
                  _loc12_.bLooping = param2.readBoolean();
                  _loc12_.bSmooth = param2.readBoolean();
                  loadBoolTrack(param2,_loc12_.trkActive);
                  if(loadVersion >= 5)
                  {
                     loadFloatTrack(param2,_loc12_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc12_.trkPosition);
                  if(loadVersion == 1)
                  {
                     skipFloatTrack(param2);
                  }
                  _loc13_ = param2.readUnsignedShort();
                  _loc14_ = 0;
                  while(_loc14_ < _loc13_)
                  {
                     (_loc15_ = new Vec2F()).x = param2.readFloat();
                     _loc15_.y = param2.readFloat();
                     _loc12_.vPoints.push(_loc15_);
                     _loc14_++;
                  }
                  if(loadVersion >= 11)
                  {
                     _loc12_.pTemplate = param3.findTemplate(ByteArrayExt.readString8_Old(param2));
                     _loc16_ = param2.readUnsignedShort();
                     _loc17_ = 0;
                     while(_loc17_ < _loc16_)
                     {
                        _loc12_.addProp(loadProp(param1,param4,param2));
                        _loc17_++;
                     }
                  }
                  if(loadVersion >= 14)
                  {
                     _loc12_.depthE = param2.readInt();
                  }
                  break;
               case ELEMENT_RECTANGLE:
                  _loc18_ = new GlaElementRectangle();
                  param4.addControlElement(_loc18_);
                  _loc18_.setName(ByteArrayExt.readString8_Old(param2));
                  loadBoolTrack(param2,_loc18_.trkActive);
                  if(loadVersion >= 5)
                  {
                     loadFloatTrack(param2,_loc18_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc18_.trkPosition);
                  if(loadVersion == 1)
                  {
                     skipFloatTrack(param2);
                  }
                  loadFloatTrack(param2,_loc18_.trkRotation);
                  loadVec2fTrack(param2,_loc18_.trkScale);
                  if(loadVersion >= 14)
                  {
                     _loc18_.depthE = param2.readInt();
                  }
                  break;
               case ELEMENT_GAME_OBJ:
                  _loc19_ = new GlaElementGameObj();
                  param4.addControlElement(_loc19_);
                  loadBoolTrack(param2,_loc19_.trkActive);
                  if(loadVersion >= 5)
                  {
                     loadFloatTrack(param2,_loc19_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc19_.trkPosition);
                  if(loadVersion == 1)
                  {
                     skipFloatTrack(param2);
                  }
                  loadFloatTrack(param2,_loc19_.trkRotation);
                  if(loadVersion >= 3)
                  {
                     loadVec2fTrack(param2,_loc19_.trkScale);
                  }
                  else
                  {
                     (_loc21_ = new GlaKey()).frame = 0;
                     _loc21_.value = new Vec2F(1,1);
                     _loc19_.trkScale.vKeys.push(_loc21_);
                  }
                  _loc19_.setName(ByteArrayExt.readString8_Old(param2));
                  _loc19_.pTemplate = param3.findTemplate(ByteArrayExt.readString8_Old(param2));
                  _loc20_ = param2.readUnsignedShort();
                  _loc17_ = 0;
                  while(_loc17_ < _loc20_)
                  {
                     if((_loc22_ = loadProp(param1,param4,param2,param6)) != null)
                     {
                        _loc19_.addProp(_loc22_);
                     }
                     _loc17_++;
                  }
                  if(loadVersion >= 14)
                  {
                     _loc19_.depthE = param2.readInt();
                  }
                  break;
               case ELEMENT_POLY:
                  throw new Error("SCG ELEMENT_POLY ");
               case ELEMENT_MARKER:
                  _loc23_ = new GlaElementMarker();
                  param4.addControlElement(_loc23_);
                  loadBoolTrack(param2,_loc23_.trkActive);
                  if(loadVersion >= 5)
                  {
                     loadFloatTrack(param2,_loc23_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc23_.trkPosition);
                  if(loadVersion == 1)
                  {
                     skipFloatTrack(param2);
                  }
                  loadFloatTrack(param2,_loc23_.trkRotation);
                  if(loadVersion == 1)
                  {
                     throw new Error("SCG : Should not get in here");
                  }
                  loadVec2fTrack(param2,_loc23_.trkScale);
                  _loc23_.setName(ByteArrayExt.readString8_Old(param2));
                  if(loadVersion >= 5)
                  {
                     _loc23_.pTemplate = param3.findTemplate(ByteArrayExt.readString8_Old(param2));
                     _loc24_ = param2.readUnsignedShort();
                     _loc25_ = 0;
                     while(_loc25_ < _loc24_)
                     {
                        _loc23_.addProp(loadProp(param1,param4,param2));
                        _loc25_++;
                     }
                  }
                  if(loadVersion >= 14)
                  {
                     _loc23_.depthE = param2.readInt();
                  }
                  break;
               case ELEMENT_SPRITE_CLIP:
                  _loc26_ = new GlaElementSprite();
                  param4.addVisibleElement(_loc26_);
                  _loc26_.setName(ByteArrayExt.readString8_Old(param2));
                  if(loadVersion >= 5)
                  {
                     _loc26_.blendMode = param2.readInt();
                     _loc26_.layer = param2.readInt();
                  }
                  else
                  {
                     _loc26_.blendMode = 0;
                  }
                  loadBoolTrack(param2,_loc26_.trkActive);
                  if(loadVersion >= 5)
                  {
                     loadFloatTrack(param2,_loc26_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc26_.trkPosition);
                  if(loadVersion == 1)
                  {
                     skipFloatTrack(param2);
                  }
                  loadFloatTrack(param2,_loc26_.trkRotation);
                  loadVec2fTrack(param2,_loc26_.trkScale);
                  loadVec2fTrack(param2,_loc26_.trkPivot);
                  loadColorTrack(param2,_loc26_.trkColor);
                  loadSpriteTrack(param1,param2,_loc26_.trkSprite,param5);
                  loadVec2fTrack(param2,_loc26_.trkClipX);
                  loadVec2fTrack(param2,_loc26_.trkClipY);
                  _loc26_.bClipping = true;
                  if(loadVersion >= 14)
                  {
                     _loc26_.depthE = param2.readInt();
                  }
                  break;
               case ELEMENT_TEXT_BOX:
                  _loc27_ = new GlaElementTextBox();
                  param4.addControlElement(_loc27_);
                  _loc27_.setName(ByteArrayExt.readString8_Old(param2));
                  _loc27_.text = ByteArrayExt.readString8_Old(param2);
                  if(loadVersion >= 6)
                  {
                     _loc27_.bOutline = param2.readBoolean();
                     _loc27_.anchor = param2.readInt();
                     loadColorTrack(param2,_loc27_.trkColor);
                  }
                  loadBoolTrack(param2,_loc27_.trkActive);
                  if(loadVersion >= 5)
                  {
                     loadFloatTrack(param2,_loc27_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc27_.trkPosition);
                  if(loadVersion == 1)
                  {
                     skipFloatTrack(param2);
                  }
                  loadFloatTrack(param2,_loc27_.trkRotation);
                  loadVec2fTrack(param2,_loc27_.trkScale);
                  if(loadVersion >= 14)
                  {
                     _loc27_.depthE = param2.readInt();
                  }
                  _loc27_.bWordWrap = false;
                  _loc27_.wrapAnchor = 0;
                  if(loadVersion >= 17)
                  {
                     _loc27_.bWordWrap = param2.readBoolean();
                     _loc27_.wrapAnchor = param2.readUnsignedInt();
                  }
                  break;
               case ELEMENT_SCENE:
                  _loc28_ = new GlaElementScene();
                  param4.addVisibleElement(_loc28_);
                  _loc28_.setName(ByteArrayExt.readString8_Old(param2));
                  if(loadVersion >= 6)
                  {
                     _loc28_.startFrame = param2.readInt();
                  }
                  loadBoolTrack(param2,_loc28_.trkActive);
                  if(loadVersion >= 5)
                  {
                     loadFloatTrack(param2,_loc28_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc28_.trkPosition);
                  if(loadVersion == 1)
                  {
                     skipFloatTrack(param2);
                  }
                  loadFloatTrack(param2,_loc28_.trkRotation);
                  loadVec2fTrack(param2,_loc28_.trkScale);
                  loadVec2fTrack(param2,_loc28_.trkPivot);
                  loadSceneRefTrack(param2,_loc28_.trkSceneRef,param5);
                  if(loadVersion >= 18)
                  {
                     loadIntTrack(param2,_loc28_.trkSceneStateIndex);
                  }
                  else
                  {
                     (_loc29_ = new GlaKey()).frame = 0;
                     _loc29_.value = 0;
                     _loc28_.trkSceneStateIndex.vKeys.push(_loc29_);
                  }
                  if(!(loadVersion >= 9 || param7))
                  {
                     throw new Error("SCG: SHould not get in here");
                  }
                  loadColorTrack(param2,_loc28_.trkColor);
                  if(loadVersion >= 14)
                  {
                     _loc28_.depthE = param2.readInt();
                  }
                  break;
               case ELEMENT_EVENT:
                  throw new Error("SCG ELEMENT_EVENT ");
               case ELEMENT_MULTI_SPRITE:
                  throw new Error("SCG ELEMENT_MULTI_SPRITE ");
               case ELEMENT_SURFACE:
                  throw new Error("SCG ELEMENT_SURFACE ");
               case ELEMENT_ZONE:
                  _loc30_ = new GlaElementZone();
                  param4.addControlElement(_loc30_);
                  _loc30_.setName(ByteArrayExt.readString8_Old(param2));
                  if(loadVersion >= 5)
                  {
                     loadBoolTrack(param2,_loc30_.trkActive);
                     loadFloatTrack(param2,_loc30_.trkDepth);
                  }
                  loadVec2fTrack(param2,_loc30_.trkPosition);
                  _loc13_ = param2.readUnsignedShort();
                  _loc17_ = 0;
                  while(_loc17_ < _loc13_)
                  {
                     _loc32_ = new Vec2F(param2.readFloat(),param2.readFloat());
                     _loc30_.vPoints._points.push(_loc32_);
                     _loc17_++;
                  }
                  if(_loc30_.vPoints.isConvex())
                  {
                     _loc30_.bConvex = true;
                  }
                  zTriangulate.Triangulate(_loc30_.vPoints._points,_loc30_.vIndicies);
                  _loc30_.triggerEvent = param2.readInt();
                  _loc31_ = param2.readInt();
                  _loc17_ = 0;
                  while(_loc17_ < _loc31_)
                  {
                     _loc33_ = ByteArrayExt.readString8_Old(param2);
                     (_loc34_ = new ElementAndMsg()).message = param2.readInt();
                     _loc34_.pElement = null;
                     _loc30_.outEvents.push(_loc34_);
                     element_ref_patches.push(new ElementRefPatch(_loc33_,_loc34_,param4));
                     _loc17_++;
                  }
                  if(loadVersion >= 5)
                  {
                     _loc30_.pTemplate = param3.findTemplate(ByteArrayExt.readString8_Old(param2));
                     _loc24_ = param2.readUnsignedShort();
                     _loc17_ = 0;
                     while(_loc17_ < _loc24_)
                     {
                        _loc30_.addProp(loadProp(param1,param4,param2));
                        _loc17_++;
                     }
                  }
                  if(loadVersion >= 14)
                  {
                     _loc30_.depthE = param2.readInt();
                  }
                  break;
               case ELEMENT_GROUP:
                  throw new Error("SCG ELEMENT_GROUP ");
               case ELEMENT_POLY_TEXTURED:
                  throw new Error("SCG ELEMENT_POLY_TEXTURED INSPECT ME! ");
               case ELEMENT_MODEL:
                  throw new Error("SCG ELEMENT_MODEL ");
               case ELEMENT_AI_PATH:
                  throw new Error("SCG ELEMENT_AI_PATH ");
               case ELEMENT_MODEL_V2:
                  throw new Error("SCG ELEMENT_MODEL_V2 ");
               case ELEMENT_PARTICLE_EMITER:
                  throw new Error("SCG ELEMENT_PARTICLE_EMITER ");
               case ELEMENT_TILEMAP:
                  throw new Error("SCG ELEMENT_TILEMAP ");
               case ELEMENT_CUSTOM:
                  throw new Error("SCG ELEMENT_CUSTOM ");
               case ELEMENT_SHIP_PATH:
                  _loc39_ = new GlaElementShipPath();
                  param4.addControlElement(_loc39_);
                  _loc39_.setName(ByteArrayExt.readString8_Old(param2));
                  _loc39_.bSmooth = param2.readBoolean();
                  loadVec2fTrack(param2,_loc39_.trkPosition);
                  _loc40_ = param2.readUnsignedShort();
                  _loc17_ = 0;
                  while(_loc17_ < _loc40_)
                  {
                     _loc39_.vPoints.push(new Vec2F(param2.readFloat(),param2.readFloat()));
                     _loc17_++;
                  }
                  _loc39_.pTemplate = param3.findTemplate(ByteArrayExt.readString8_Old(param2));
                  _loc41_ = param2.readUnsignedShort();
                  _loc17_ = 0;
                  while(_loc17_ < _loc41_)
                  {
                     _loc39_.addProp(loadProp(param1,param4,param2,param6));
                     _loc17_++;
                  }
                  _loc39_.depthE = param2.readInt();
                  if(loadVersion >= 20)
                  {
                     _loc39_._time = param2.readFloat();
                     _loc39_._speed = param2.readFloat();
                     _loc39_._endspeed = param2.readFloat();
                     if(loadVersion >= 21)
                     {
                        _loc39_._scrollPath = param2.readBoolean();
                     }
                     else
                     {
                        _loc39_._scrollPath = false;
                     }
                     _loc39_._timebewtween = param2.readFloat();
                     _loc39_._delay = param2.readFloat();
                     _loc39_._healtmod = param2.readFloat();
                     _loc39_._numCycles = param2.readShort();
                     _loc39_._cycleType = param2.readInt();
                     _loc39_._numships = param2.readShort();
                     _loc42_ = 0;
                     while(_loc42_ < _loc39_._numships)
                     {
                        _loc44_ = new ShipDetails();
                        _loc45_ = ByteArrayExt.readString8_Old(param2);
                        _loc44_._name = _loc45_;
                        _loc44_._difficulty = param2.readInt();
                        _loc44_._weapon = param2.readInt();
                        _loc44_._reward = param2.readInt();
                        _loc39_._shipDetails.push(_loc44_);
                        _loc42_++;
                     }
                     _loc39_._numrewards = param2.readShort();
                     _loc43_ = 0;
                     while(_loc43_ < _loc39_._numrewards)
                     {
                        _loc39_._rewardIDs.push(param2.readInt());
                        _loc43_++;
                     }
                  }
                  break;
            }
            _loc9_++;
         }
         throw new Error("SCG ASSERT");
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.vScenes.length)
         {
            this.vScenes[_loc1_].dispose();
            this.vScenes[_loc1_] = null;
            _loc1_++;
         }
         this.vScenes = null;
         _loc1_ = 0;
         while(_loc1_ < this.vTemplates.length)
         {
            this.vTemplates[_loc1_].dispose();
            this.vTemplates[_loc1_] = null;
            _loc1_++;
         }
         this.vTemplates = null;
         _loc1_ = 0;
         while(_loc1_ < this.vEnumSets.length)
         {
            this.vEnumSets[_loc1_].dispose();
            this.vEnumSets[_loc1_] = null;
            _loc1_++;
         }
         this.vEnumSets = null;
      }
      
      public function getSceneState(param1:uint) : GlaSceneState
      {
         return !!this.vScenes[param1] ? this.vScenes[param1].getState(0) : null;
      }
      
      public function findSceneState(param1:String) : GlaSceneState
      {
         var _loc2_:GlaScene = this.findScene(param1);
         return !!_loc2_ ? _loc2_.getState(0) : null;
      }
      
      public function loadSpecificScene(param1:String, param2:String, param3:int = 0, param4:Boolean = false) : GlaSet
      {
         trace("SGC GlaSet::loadSpecificScene : TO BE IMPLEMENTED");
         return null;
      }
      
      public function scaleData(param1:ScaleInfo) : void
      {
         var _loc2_:int = 0;
         if(this.currentScale != param1.scale)
         {
            this.currentScale = param1.scale / this.currentScale;
            _loc2_ = 0;
            while(_loc2_ < this.vScenes.length)
            {
               this.vScenes[_loc2_].scaleData(param1);
               _loc2_++;
            }
         }
      }
      
      public function findScene(param1:String) : GlaScene
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.vScenes.length)
         {
            if(this.vScenes[_loc2_].getName().toLowerCase() == param1.toLowerCase())
            {
               return this.vScenes[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function findTemplate(param1:String) : GlaTemplate
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:String = param1.toLowerCase();
         _loc2_ = 0;
         while(_loc2_ < this.vTemplates.length)
         {
            _loc3_ = this.vTemplates[_loc2_].getName();
            if(_loc3_ != null)
            {
               _loc3_ = _loc3_.toLowerCase();
               if(_loc3_ == _loc4_)
               {
                  return this.vTemplates[_loc2_];
               }
            }
            _loc2_++;
         }
         return null;
      }
      
      public function addScene(param1:GlaScene) : void
      {
         param1.pDatabase = this;
         this.vScenes.push(param1);
      }
      
      public function getNumScenes() : uint
      {
         return this.vScenes.length;
      }
      
      public function getScene(param1:uint) : GlaScene
      {
         return this.vScenes[param1];
      }
   }
}
