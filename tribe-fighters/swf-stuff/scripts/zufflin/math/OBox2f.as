package zufflin.math
{
   import util.Vec2F;
   
   public class OBox2f
   {
       
      
      public var pos:Vec2F;
      
      public var rotation:zMatrix2f;
      
      public var hsize:Vec2F;
      
      public function OBox2f()
      {
         super();
         this.pos = new Vec2F();
         this.rotation = new zMatrix2f();
         this.hsize = new Vec2F();
      }
      
      public function set(param1:AABox2f) : void
      {
         this.rotation.setIdentity();
         this.pos.setV(param1.getCentre());
         this.hsize.set(param1.getSizeX(),param1.getSizeY());
         this.hsize.scaleBy(0.5);
      }
      
      public function rotate(param1:Number) : void
      {
         this.rotation.rotate(param1);
         if(this.pos.length != 0)
         {
            this.pos.rotate(param1);
         }
      }
      
      public function getCornerRel(param1:int) : Vec2F
      {
         switch(param1)
         {
            case 0:
               return this.rotation.getTransform(new Vec2F(-this.hsize.x,-this.hsize.y));
            case 1:
               return this.rotation.getTransform(new Vec2F(this.hsize.x,-this.hsize.y));
            case 2:
               return this.rotation.getTransform(new Vec2F(this.hsize.x,this.hsize.y));
            case 3:
               return this.rotation.getTransform(new Vec2F(-this.hsize.x,this.hsize.y));
            default:
               return new Vec2F(0,0);
         }
      }
      
      public function getCorner(param1:int) : Vec2F
      {
         var _loc2_:Vec2F = this.getCornerRel(param1);
         return new Vec2F(this.pos.x + _loc2_.x,this.pos.y + _loc2_.y);
      }
      
      public function translateWorld(param1:Vec2F) : void
      {
         this.pos.x += param1.x;
         this.pos.y += param1.y;
      }
   }
}
