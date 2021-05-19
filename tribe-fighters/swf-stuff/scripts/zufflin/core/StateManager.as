package zufflin.core
{
   import zufflin.world.WorldLayer;
   import zufflin.world.WorldObj;
   import zufflin.world2D.Component2;
   
   public class StateManager
   {
      
      public static const Z_ACTION_START:int = 0;
      
      public static const Z_ACTION_END:int = 1;
      
      public static const Z_ACTION_UPDATE:int = 2;
       
      
      public var pOwnerWO:WorldObj;
      
      public var pOwnerCO:Component2;
      
      public var nextState:StateInfo;
      
      public var curState:StateInfo;
      
      public function StateManager()
      {
         super();
         this.nextState = new StateInfo();
         this.curState = new StateInfo();
         this.pOwnerWO = null;
         this.pOwnerCO = null;
         this.curState.pFunc = null;
         this.curState.param = 0;
         this.nextState.pFunc = null;
         this.nextState.param = 0;
      }
      
      public function setOwner(param1:Object) : void
      {
         if(param1 is WorldObj)
         {
            this.pOwnerWO = param1 as WorldObj;
            this.pOwnerCO = null;
         }
         else if(param1 is Component2)
         {
            this.pOwnerCO = param1 as Component2;
            this.pOwnerWO = null;
         }
         else
         {
            this.pOwnerWO = null;
            this.pOwnerCO = null;
         }
      }
      
      public function update() : void
      {
         var _loc1_:WorldLayer = null;
         if(this.pOwnerWO)
         {
            _loc1_ = this.pOwnerWO.getLayer();
         }
         else if(this.pOwnerCO)
         {
            _loc1_ = this.pOwnerCO.getLayer();
         }
         if(_loc1_ && _loc1_.isUpdateEnabled() == false)
         {
            return;
         }
         do
         {
            this.update_state_system();
            if(this.curState.pFunc != null)
            {
               this.curState.pFunc(Z_ACTION_UPDATE,0);
            }
         }
         while(this.nextState.pFunc != null);
         
      }
      
      public function update_state_system() : void
      {
         if(this.nextState.pFunc != null)
         {
            if(this.curState.pFunc == null || this.curState.pFunc(Z_ACTION_END,0) == 0)
            {
               this.curState.pFunc = this.nextState.pFunc;
               this.curState.param = this.nextState.param;
               this.nextState.pFunc = null;
               if(this.curState.pFunc != null)
               {
                  this.curState.pFunc(Z_ACTION_START,this.curState.param);
               }
            }
         }
      }
      
      public function gotoState(param1:Function, param2:int = 0) : void
      {
         if(param1 != this.curState.pFunc)
         {
            this.nextState.pFunc = param1;
            this.nextState.param = param2;
         }
      }
      
      public function getCurState() : Function
      {
         return this.curState.pFunc;
      }
   }
}
