package zufflin.cobraBase
{
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.core.zSprite;
   
   public class GlaElementSprite extends GlaElementPos
   {
       
      
      public var trkRotation:GlaTrackFloat;
      
      public var trkScale:GlaTrackVec2f;
      
      public var trkPivot:GlaTrackVec2f;
      
      public var trkColor:GlaTrackRGBA;
      
      public var trkSprite:GlaTrackSprite;
      
      public var trkClipX:GlaTrackVec2f;
      
      public var trkClipY:GlaTrackVec2f;
      
      public var bClipping:Boolean;
      
      public var blendMode:int;
      
      public var layer:int;
      
      public var spriteType:int;
      
      public function GlaElementSprite()
      {
         super();
         this.blendMode = 0;
         this.spriteType = GlaSet.ELEMENT_SPRITE;
         this.layer = 0;
         this.bClipping = false;
         this.trkRotation = new GlaTrackFloat();
         this.trkScale = new GlaTrackVec2f();
         this.trkPivot = new GlaTrackVec2f();
         this.trkColor = new GlaTrackRGBA();
         this.trkSprite = new GlaTrackSprite();
         this.trkClipX = new GlaTrackVec2f();
         this.trkClipY = new GlaTrackVec2f();
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         if(param1.bSprites)
         {
            this.trkScale.scaleData(param1);
         }
         this.trkPivot.scaleData(param1);
      }
      
      public function getSprite() : zSprite
      {
         return this.trkSprite.getValue(0);
      }
      
      public function getLayer() : int
      {
         return this.layer;
      }
      
      public function getRotation(param1:int) : Number
      {
         return this.trkRotation.getValue(param1);
      }
      
      public function getColor(param1:int) : RGBA
      {
         return this.trkColor.getValue(param1);
      }
      
      public function getScale(param1:int) : Vec2F
      {
         return this.trkScale.getValue(param1);
      }
   }
}
