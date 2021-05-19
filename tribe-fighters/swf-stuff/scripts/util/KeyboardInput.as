package util
{
   public class KeyboardInput
   {
       
      
      public var _aKeyCodes:Vector.<uint>;
      
      public var _bJustPressed:Boolean;
      
      public var _bJustReleased:Boolean;
      
      public var _bIsPressed:Boolean;
      
      public function KeyboardInput(param1:Vector.<uint>)
      {
         super();
         this._aKeyCodes = param1;
         this._bJustPressed = false;
         this._bJustReleased = false;
         this._bIsPressed = false;
      }
      
      public function Tick() : void
      {
         this._bJustPressed = false;
         this._bJustReleased = false;
      }
      
      public function HandleDownEvent(param1:uint) : void
      {
         var _loc2_:int = this._aKeyCodes.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._bJustPressed = true;
            this._bIsPressed = true;
         }
      }
      
      public function HandleUpEvent(param1:uint) : void
      {
         var _loc2_:int = this._aKeyCodes.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._bJustReleased = true;
            this._bIsPressed = false;
         }
      }
   }
}
