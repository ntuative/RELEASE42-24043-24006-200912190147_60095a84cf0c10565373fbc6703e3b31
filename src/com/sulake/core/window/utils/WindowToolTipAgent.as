package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_310:Timer;
      
      protected var var_873:String;
      
      protected var var_874:uint;
      
      protected var var_1047:Point;
      
      protected var var_240:IToolTipWindow;
      
      protected var var_1046:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1047 = new Point();
         var_1046 = new Point(20,20);
         var_874 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_310 != null)
         {
            var_310.stop();
            var_310.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_310 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1047);
            if(var_240 != null && true)
            {
               var_240.x = param1 + var_1046.x;
               var_240.y = param2 + var_1046.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_310 != null)
         {
            var_310.reset();
         }
         if(_window && true)
         {
            if(var_240 == null || false)
            {
               var_240 = _window.context.create("undefined::ToolTip",var_873,WindowType.WINDOW_TYPE_TOOLTIP,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_240.x = _loc2_.x + var_1047.x + var_1046.x;
            var_240.y = _loc2_.y + var_1047.y + var_1046.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_873 = IInteractiveWindow(param1).toolTipCaption;
               var_874 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_873 = param1.caption;
               var_874 = 500;
            }
            _mouse.x = var_122.mouseX;
            _mouse.y = var_122.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1047);
            if(var_873 != null && var_873 != "")
            {
               if(var_310 == null)
               {
                  var_310 = new Timer(var_874,1);
                  var_310.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_310.reset();
               var_310.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_240 != null && true)
         {
            var_240.destroy();
            var_240 = null;
         }
      }
   }
}
