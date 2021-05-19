package zufflin.cobraBase
{
   import util.MathsHelper;
   
   public class GlaControllerRectangle extends GlaControllerElement
   {
       
      
      public function GlaControllerRectangle(param1:GlaController, param2:GlaElementRectangle)
      {
         super(param1,param2);
         pSrcElement = param2;
         bActive = false;
         depth = calcDepthEnum(param2.getDepthEnum());
         this.internalSetFrame(new FrameInfo());
      }
      
      public function getSrcRectangle() : GlaElementRectangle
      {
         return pSrcElement as GlaElementRectangle;
      }
      
      override public function internalSetFrame(param1:FrameInfo) : void
      {
         bActive = this.getSrcRectangle().trkActive.getValue(param1.frameI);
         if(bActive)
         {
            position = this.getSrcRectangle().trkPosition.getValue(param1.frameI);
            position.x += nodePosition.x;
            position.y += nodePosition.y;
            _rotation = -MathsHelper.DegToRad(this.getSrcRectangle().trkRotation.getValue(param1.frameI)) + nodeRotation;
            scale = this.getSrcRectangle().trkScale.getValue(param1.frameI);
            scale.x *= nodeScale.x;
            scale.y *= nodeScale.y;
         }
      }
   }
}
