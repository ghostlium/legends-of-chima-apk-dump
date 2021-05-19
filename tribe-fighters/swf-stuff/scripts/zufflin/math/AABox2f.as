package zufflin.math
{
   import util.Vec2F;
   
   public class AABox2f
   {
       
      
      public var min:Vec2F;
      
      public var max:Vec2F;
      
      public function AABox2f(param1:Vec2F = null, param2:Vec2F = null)
      {
         super();
         if(param1 == null)
         {
            this.min = new Vec2F();
         }
         else
         {
            this.min = param1;
         }
         if(param2 == null)
         {
            this.max = new Vec2F();
         }
         else
         {
            this.max = param2;
         }
      }
      
      public function scale(param1:Number) : void
      {
         this.min.scaleBy(param1);
         this.max.scaleBy(param1);
      }
      
      public function getMin() : Vec2F
      {
         return this.min;
      }
      
      public function getSizeX() : Number
      {
         return this.max.x - this.min.x;
      }
      
      public function getSizeY() : Number
      {
         return this.max.y - this.min.y;
      }
      
      public function set(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.min.x = param1;
         this.min.y = param2;
         this.max.x = param3;
         this.max.y = param4;
      }
      
      public function add(param1:Vec2F) : AABox2f
      {
         this.min.x = param1.x < this.min.x ? Number(param1.x) : Number(this.min.x);
         this.min.y = param1.y < this.min.y ? Number(param1.y) : Number(this.min.y);
         this.max.x = param1.x > this.max.x ? Number(param1.x) : Number(this.max.x);
         this.max.y = param1.y > this.max.y ? Number(param1.y) : Number(this.max.y);
         return this;
      }
      
      public function invalidate() : void
      {
         this.min.x = Number.MAX_VALUE;
         this.min.y = Number.MAX_VALUE;
         this.max.x = -Number.MAX_VALUE;
         this.max.y = -Number.MAX_VALUE;
      }
      
      public function getCentre() : Vec2F
      {
         return new Vec2F((this.max.x + this.min.x) / 2,(this.max.y + this.min.y) / 2);
      }
      
      public function translate(param1:Vec2F) : void
      {
         this.min.x += param1.x;
         this.min.y += param1.y;
         this.max.x += param1.x;
         this.max.y += param1.y;
      }
      
      public function isPointIn(param1:Vec2F, param2:Number = 0.0) : Boolean
      {
         return param1.x + param2 >= this.min.x && param1.y + param2 >= this.min.y && param1.x - param2 <= this.max.x && param1.y - param2 <= this.max.y;
      }
      
      public function setOBOX(param1:OBox2f) : AABox2f
      {
         this.min.setV(param1.getCorner(0));
         this.max.setV(this.min);
         this.add(param1.getCorner(1));
         this.add(param1.getCorner(2));
         this.add(param1.getCorner(3));
         return this;
      }
      
      public function addOBOX(param1:OBox2f) : AABox2f
      {
         this.add(param1.getCorner(0));
         this.add(param1.getCorner(1));
         this.add(param1.getCorner(2));
         this.add(param1.getCorner(3));
         return this;
      }
   }
}
