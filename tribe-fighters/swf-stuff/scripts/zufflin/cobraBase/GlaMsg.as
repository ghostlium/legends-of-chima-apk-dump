package zufflin.cobraBase
{
   public class GlaMsg
   {
       
      
      public var id:int;
      
      public var text:String;
      
      public var pSrcObject:Object;
      
      public var parami:int;
      
      public var paramf:Number;
      
      public function GlaMsg(param1:GlaMsg = null, param2:int = 0, param3:String = "", param4:Object = null, param5:int = 0, param6:Number = 0.0)
      {
         super();
         if(param1 != null)
         {
            this.copyFrom(param1);
         }
         else
         {
            this.pSrcObject = param4;
            this.parami = param5;
            this.paramf = param6;
            this.id = param2;
            this.text = param3;
         }
      }
      
      public function copyFrom(param1:GlaMsg) : void
      {
         this.id = param1.id;
         this.parami = param1.parami;
         this.text = param1.text;
         this.pSrcObject = param1.pSrcObject;
      }
      
      public function getText() : String
      {
         return this.text;
      }
      
      public function getParami() : int
      {
         return this.parami;
      }
      
      public function getParamHi() : int
      {
         return this.parami >> 16 & 65535;
      }
      
      public function getParamLo() : int
      {
         return this.parami & 65535;
      }
      
      public function getID() : int
      {
         return this.id;
      }
      
      public function getParamf() : Number
      {
         return this.paramf;
      }
      
      public function getSrcObject() : Object
      {
         return this.pSrcObject;
      }
   }
}
