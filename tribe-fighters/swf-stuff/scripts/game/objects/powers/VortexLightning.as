package game.objects.powers
{
   import game.objects.enemies.Enemy;
   import starling.display.Image;
   
   public class VortexLightning
   {
       
      
      public var pEnemy:Enemy;
      
      public var pMesh:Image;
      
      public var fCycle:Number;
      
      public var fCycleSpeed:Number;
      
      public function VortexLightning()
      {
         super();
         this.pEnemy = null;
         this.pMesh = null;
         this.fCycle = 0;
         this.fCycleSpeed = 0;
      }
      
      public function dispose() : void
      {
         this.pMesh = null;
         this.pEnemy = null;
      }
   }
}
