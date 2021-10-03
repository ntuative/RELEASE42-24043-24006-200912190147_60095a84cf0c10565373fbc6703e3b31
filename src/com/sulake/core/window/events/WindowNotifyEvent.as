package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1335:String = "WN_CREATED";
      
      public static const const_837:String = "WN_DISABLE";
      
      public static const const_872:String = "WN_DEACTIVATED";
      
      public static const const_803:String = "WN_OPENED";
      
      public static const const_836:String = "WN_CLOSED";
      
      public static const const_990:String = "WN_DESTROY";
      
      public static const const_1561:String = "WN_ARRANGED";
      
      public static const const_424:String = "WN_PARENT_RESIZED";
      
      public static const const_947:String = "WN_ENABLE";
      
      public static const const_988:String = "WN_RELOCATE";
      
      public static const const_878:String = "WN_FOCUS";
      
      public static const const_815:String = "WN_PARENT_RELOCATED";
      
      public static const const_396:String = "WN_PARAM_UPDATED";
      
      public static const const_678:String = "WN_PARENT_ACTIVATED";
      
      public static const const_221:String = "WN_RESIZED";
      
      public static const const_846:String = "WN_CLOSE";
      
      public static const const_787:String = "WN_PARENT_REMOVED";
      
      public static const const_234:String = "WN_CHILD_RELOCATED";
      
      public static const const_554:String = "WN_ENABLED";
      
      public static const const_259:String = "WN_CHILD_RESIZED";
      
      public static const const_973:String = "WN_MINIMIZED";
      
      public static const const_670:String = "WN_DISABLED";
      
      public static const const_204:String = "WN_CHILD_ACTIVATED";
      
      public static const const_427:String = "WN_STATE_UPDATED";
      
      public static const const_654:String = "WN_UNSELECTED";
      
      public static const const_401:String = "WN_STYLE_UPDATED";
      
      public static const const_1546:String = "WN_UPDATE";
      
      public static const const_455:String = "WN_PARENT_ADDED";
      
      public static const const_508:String = "WN_RESIZE";
      
      public static const const_686:String = "WN_CHILD_REMOVED";
      
      public static const const_1475:String = "";
      
      public static const const_871:String = "WN_RESTORED";
      
      public static const const_310:String = "WN_SELECTED";
      
      public static const const_868:String = "WN_MINIMIZE";
      
      public static const const_980:String = "WN_FOCUSED";
      
      public static const const_1183:String = "WN_LOCK";
      
      public static const const_314:String = "WN_CHILD_ADDED";
      
      public static const const_809:String = "WN_UNFOCUSED";
      
      public static const const_466:String = "WN_RELOCATED";
      
      public static const const_970:String = "WN_DEACTIVATE";
      
      public static const const_1185:String = "WN_CRETAE";
      
      public static const const_905:String = "WN_RESTORE";
      
      public static const const_311:String = "WN_ACTVATED";
      
      public static const const_1290:String = "WN_LOCKED";
      
      public static const const_408:String = "WN_SELECT";
      
      public static const const_898:String = "WN_MAXIMIZE";
      
      public static const const_911:String = "WN_OPEN";
      
      public static const const_625:String = "WN_UNSELECT";
      
      public static const const_1527:String = "WN_ARRANGE";
      
      public static const const_1252:String = "WN_UNLOCKED";
      
      public static const const_1492:String = "WN_UPDATED";
      
      public static const const_891:String = "WN_ACTIVATE";
      
      public static const const_1303:String = "WN_UNLOCK";
      
      public static const const_831:String = "WN_MAXIMIZED";
      
      public static const const_986:String = "WN_DESTROYED";
      
      public static const const_848:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1522,cancelable);
      }
   }
}
