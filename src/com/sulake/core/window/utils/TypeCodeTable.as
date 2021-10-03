package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_502;
         param1["bitmap"] = const_693;
         param1["border"] = const_724;
         param1["border_notify"] = const_1163;
         param1["button"] = const_357;
         param1["button_thick"] = const_636;
         param1["button_icon"] = const_1248;
         param1["button_group_left"] = const_666;
         param1["button_group_center"] = const_535;
         param1["button_group_right"] = const_627;
         param1["canvas"] = const_631;
         param1["checkbox"] = const_510;
         param1["closebutton"] = const_823;
         param1["container"] = const_286;
         param1["container_button"] = const_525;
         param1["display_object_wrapper"] = const_516;
         param1["dropmenu"] = const_397;
         param1["dropmenu_item"] = const_456;
         param1["frame"] = const_297;
         param1["frame_notify"] = const_1311;
         param1["header"] = const_596;
         param1["icon"] = const_998;
         param1["itemgrid"] = const_779;
         param1["itemgrid_horizontal"] = const_449;
         param1["itemgrid_vertical"] = const_706;
         param1["itemlist"] = const_830;
         param1["itemlist_horizontal"] = const_279;
         param1["itemlist_vertical"] = const_289;
         param1["maximizebox"] = const_1342;
         param1["menu"] = const_1241;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_913;
         param1["minimizebox"] = const_1127;
         param1["notify"] = const_1343;
         param1["IssueCloseNotificationMessageEvent"] = const_469;
         param1["password"] = const_497;
         param1["radiobutton"] = const_668;
         param1["region"] = const_388;
         param1["restorebox"] = const_1270;
         param1["scaler"] = const_835;
         param1["scaler_horizontal"] = const_1165;
         param1["scaler_vertical"] = const_1259;
         param1["scrollbar_horizontal"] = const_387;
         param1["scrollbar_vertical"] = const_606;
         param1["scrollbar_slider_button_up"] = const_938;
         param1["scrollbar_slider_button_down"] = const_855;
         param1["scrollbar_slider_button_left"] = const_856;
         param1["scrollbar_slider_button_right"] = const_808;
         param1["scrollbar_slider_bar_horizontal"] = const_807;
         param1["scrollbar_slider_bar_vertical"] = const_934;
         param1["scrollbar_slider_track_horizontal"] = const_800;
         param1["scrollbar_slider_track_vertical"] = const_839;
         param1["scrollable_itemlist"] = const_1147;
         param1["scrollable_itemlist_vertical"] = const_402;
         param1["scrollable_itemlist_horizontal"] = const_860;
         param1["selector"] = const_506;
         param1["selector_list"] = const_555;
         param1["submenu"] = const_913;
         param1["tab_button"] = const_641;
         param1["tab_container_button"] = const_820;
         param1["tab_context"] = const_467;
         param1["tab_content"] = const_843;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_676;
         param1["input"] = const_556;
         param1["toolbar"] = const_1219;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
