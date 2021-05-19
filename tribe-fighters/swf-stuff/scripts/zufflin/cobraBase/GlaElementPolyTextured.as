package zufflin.cobraBase
{
   import util.Vec2F;
   
   public class GlaElementPolyTextured extends GlaElementPos
   {
       
      
      public var vPoints:Vector.<Vec2F>;
      
      public var trkTexture:GlaTrackTexture;
      
      public var trkTextureNrml:GlaTrackTexture;
      
      public var trkTextureScale:GlaTrackVec2f;
      
      public var trkTextureOffset:GlaTrackVec2f;
      
      public var trkTextureRotation:GlaTrackFloat;
      
      public var trkColor:GlaTrackRGBA;
      
      public var blendMode:int;
      
      public function GlaElementPolyTextured()
      {
         super();
         this.blendMode = 0;
         this.vPoints = new Vector.<Vec2F>();
         this.trkTexture = new GlaTrackTexture();
         this.trkTextureNrml = new GlaTrackTexture();
         this.trkTextureScale = new GlaTrackVec2f();
         this.trkTextureOffset = new GlaTrackVec2f();
         this.trkTextureRotation = new GlaTrackFloat();
         this.trkColor = new GlaTrackRGBA();
      }
      
      public function getPoints() : Vector.<Vec2F>
      {
         return this.vPoints;
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this.vPoints.length)
         {
            this.vPoints[_loc2_].scaleBy(param1.scale);
            _loc2_++;
         }
         this.trkTextureScale.scaleData(param1);
      }
   }
}
