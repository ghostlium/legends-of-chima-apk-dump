package zufflin.cobraBase
{
   public class GlaElementMarker extends GlaElementPos
   {
       
      
      public var trkScale:GlaTrackVec2f;
      
      public var trkRotation:GlaTrackFloat;
      
      public function GlaElementMarker()
      {
         super();
         this.trkScale = new GlaTrackVec2f();
         this.trkRotation = new GlaTrackFloat();
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         this.trkScale.scaleData(param1);
      }
   }
}
