package zufflin.core
{
   public class DeltaTime
   {
       
      
      public var dt:Number;
      
      public var inv_dt:Number;
      
      public var multiplier:Number;
      
      public function DeltaTime(param1:Number = 0)
      {
         super();
         this.dt = param1;
         this.inv_dt = 0;
         this.multiplier = 0;
         this.set(param1);
      }
      
      public function set(param1:Number, param2:Number = 1.0) : void
      {
         this.dt = param1;
         this.inv_dt = 1 / this.dt;
         this.multiplier = param2;
      }
      
      public function getSecs() : Number
      {
         return this.dt;
      }
      
      public function getMultiplier() : Number
      {
         return this.multiplier;
      }
   }
}
