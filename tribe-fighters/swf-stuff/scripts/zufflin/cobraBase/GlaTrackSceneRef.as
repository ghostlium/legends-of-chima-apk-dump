package zufflin.cobraBase
{
   public class GlaTrackSceneRef extends GlaTrack
   {
       
      
      public function GlaTrackSceneRef()
      {
         super();
      }
      
      public function getValue(param1:int) : GlaScene
      {
         var _loc2_:int = 0;
         while(_loc2_ < vKeys.length)
         {
            if(param1 == vKeys[_loc2_].getFrame())
            {
               return vKeys[_loc2_].getValue() as GlaScene;
            }
            if(_loc2_ < vKeys.length - 1 && param1 < vKeys[_loc2_ + 1].getFrame())
            {
               return vKeys[_loc2_].getValue() as GlaScene;
            }
            _loc2_++;
         }
         return vKeys[vKeys.length - 1].getValue() as GlaScene;
      }
   }
}
