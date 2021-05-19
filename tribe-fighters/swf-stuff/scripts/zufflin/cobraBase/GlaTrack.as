package zufflin.cobraBase
{
   public class GlaTrack
   {
       
      
      public var vKeys:Vector.<GlaKey>;
      
      public function GlaTrack()
      {
         super();
         this.vKeys = new Vector.<GlaKey>();
      }
      
      public function getNumKeys() : int
      {
         return this.vKeys.length;
      }
   }
}
