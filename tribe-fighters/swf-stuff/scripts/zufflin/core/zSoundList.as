package zufflin.core
{
   import flash.media.Sound;
   import util.Random;
   
   public class zSoundList
   {
       
      
      public var sounds:Vector.<Sound>;
      
      public function zSoundList()
      {
         super();
         this.sounds = new Vector.<Sound>();
      }
      
      public function rand_element() : Sound
      {
         if(this.sounds.length > 0)
         {
            return this.sounds[Random.RandomNumberRange(0,this.sounds.length - 1)];
         }
         return null;
      }
      
      public function clear() : void
      {
         this.sounds.length = 0;
      }
      
      public function push(param1:Sound) : void
      {
         this.sounds.push(param1);
      }
      
      public function push_back(param1:Sound) : void
      {
         this.sounds.push(param1);
      }
   }
}
