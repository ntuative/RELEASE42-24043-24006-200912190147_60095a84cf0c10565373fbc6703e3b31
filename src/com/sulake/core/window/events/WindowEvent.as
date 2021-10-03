package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_317:String = "WE_CHILD_RESIZED";
      
      public static const const_1177:String = "WE_CLOSE";
      
      public static const const_1266:String = "WE_DESTROY";
      
      public static const const_193:String = "WE_CHANGE";
      
      public static const const_1255:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1410:String = "WE_PARENT_RESIZE";
      
      public static const const_83:String = "WE_UPDATE";
      
      public static const const_1211:String = "WE_MAXIMIZE";
      
      public static const const_351:String = "WE_DESTROYED";
      
      public static const const_888:String = "WE_UNSELECT";
      
      public static const const_1362:String = "WE_MAXIMIZED";
      
      public static const const_1403:String = "WE_UNLOCKED";
      
      public static const const_422:String = "WE_CHILD_REMOVED";
      
      public static const const_159:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1263:String = "WE_ACTIVATE";
      
      public static const const_227:String = "WE_ENABLED";
      
      public static const const_442:String = "WE_CHILD_RELOCATED";
      
      public static const const_1246:String = "WE_CREATE";
      
      public static const const_702:String = "WE_SELECT";
      
      public static const const_170:String = "";
      
      public static const const_1412:String = "WE_LOCKED";
      
      public static const const_1480:String = "WE_PARENT_RELOCATE";
      
      public static const const_1486:String = "WE_CHILD_REMOVE";
      
      public static const const_1570:String = "WE_CHILD_RELOCATE";
      
      public static const const_1457:String = "WE_LOCK";
      
      public static const const_326:String = "WE_FOCUSED";
      
      public static const const_548:String = "WE_UNSELECTED";
      
      public static const const_894:String = "WE_DEACTIVATED";
      
      public static const const_1269:String = "WE_MINIMIZED";
      
      public static const const_1543:String = "WE_ARRANGED";
      
      public static const const_1491:String = "WE_UNLOCK";
      
      public static const const_1441:String = "WE_ATTACH";
      
      public static const const_1168:String = "WE_OPEN";
      
      public static const const_1306:String = "WE_RESTORE";
      
      public static const const_1408:String = "WE_PARENT_RELOCATED";
      
      public static const const_1121:String = "WE_RELOCATE";
      
      public static const const_1555:String = "WE_CHILD_RESIZE";
      
      public static const const_1547:String = "WE_ARRANGE";
      
      public static const const_1179:String = "WE_OPENED";
      
      public static const const_1264:String = "WE_CLOSED";
      
      public static const const_1503:String = "WE_DETACHED";
      
      public static const const_1498:String = "WE_UPDATED";
      
      public static const const_1234:String = "WE_UNFOCUSED";
      
      public static const const_453:String = "WE_RELOCATED";
      
      public static const const_1161:String = "WE_DEACTIVATE";
      
      public static const const_217:String = "WE_DISABLED";
      
      public static const const_522:String = "WE_CANCEL";
      
      public static const const_598:String = "WE_ENABLE";
      
      public static const const_1292:String = "WE_ACTIVATED";
      
      public static const const_1267:String = "WE_FOCUS";
      
      public static const const_1549:String = "WE_DETACH";
      
      public static const const_1277:String = "WE_RESTORED";
      
      public static const const_1307:String = "WE_UNFOCUS";
      
      public static const const_51:String = "WE_SELECTED";
      
      public static const const_1150:String = "WE_PARENT_RESIZED";
      
      public static const const_1245:String = "WE_CREATED";
      
      public static const const_1479:String = "WE_ATTACHED";
      
      public static const const_1128:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1522:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1305:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1522 = param3;
         var_1305 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1305;
      }
      
      public function get related() : IWindow
      {
         return var_1522;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1305 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
