package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2204:uint;
      
      private var var_768:IWindowToolTipAgentService;
      
      private var var_766:IWindowMouseScalingService;
      
      private var var_407:IWindowContext;
      
      private var var_765:IWindowFocusManagerService;
      
      private var var_769:IWindowMouseListenerService;
      
      private var var_767:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2204 = 0;
         var_122 = param2;
         var_407 = param1;
         var_767 = new WindowMouseDragger(param2);
         var_766 = new WindowMouseScaler(param2);
         var_769 = new WindowMouseListener(param2);
         var_765 = new FocusManager(param2);
         var_768 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_766;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_765;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_768;
      }
      
      public function dispose() : void
      {
         if(var_767 != null)
         {
            var_767.dispose();
            var_767 = null;
         }
         if(var_766 != null)
         {
            var_766.dispose();
            var_766 = null;
         }
         if(var_769 != null)
         {
            var_769.dispose();
            var_769 = null;
         }
         if(var_765 != null)
         {
            var_765.dispose();
            var_765 = null;
         }
         if(var_768 != null)
         {
            var_768.dispose();
            var_768 = null;
         }
         var_407 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_769;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_767;
      }
   }
}
