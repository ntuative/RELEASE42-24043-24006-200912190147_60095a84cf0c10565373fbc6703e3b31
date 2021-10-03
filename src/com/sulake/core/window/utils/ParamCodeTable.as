package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["IssueCloseNotificationMessageEvent"] = const_94;
         param1["bound_to_parent_rect"] = const_75;
         param1["child_window"] = const_822;
         param1["embedded_controller"] = const_276;
         param1["resize_to_accommodate_children"] = const_61;
         param1["input_event_processor"] = const_46;
         param1["internal_event_handling"] = const_617;
         param1["mouse_dragging_target"] = const_195;
         param1["mouse_dragging_trigger"] = const_305;
         param1["mouse_scaling_target"] = const_264;
         param1["mouse_scaling_trigger"] = const_465;
         param1["horizontal_mouse_scaling_trigger"] = const_194;
         param1["vertical_mouse_scaling_trigger"] = const_183;
         param1["observe_parent_input_events"] = const_780;
         param1["optimize_region_to_layout_size"] = const_346;
         param1["parent_window"] = const_910;
         param1["relative_horizontal_scale_center"] = const_168;
         param1["relative_horizontal_scale_fixed"] = const_106;
         param1["relative_horizontal_scale_move"] = const_307;
         param1["relative_horizontal_scale_strech"] = const_246;
         param1["relative_scale_center"] = const_1003;
         param1["relative_scale_fixed"] = const_679;
         param1["relative_scale_move"] = const_974;
         param1["relative_scale_strech"] = const_901;
         param1["relative_vertical_scale_center"] = const_169;
         param1["relative_vertical_scale_fixed"] = const_118;
         param1["relative_vertical_scale_move"] = const_275;
         param1["relative_vertical_scale_strech"] = const_263;
         param1["on_resize_align_left"] = const_528;
         param1["on_resize_align_right"] = const_382;
         param1["on_resize_align_center"] = const_350;
         param1["on_resize_align_top"] = const_708;
         param1["on_resize_align_bottom"] = const_415;
         param1["on_resize_align_middle"] = const_413;
         param1["on_accommodate_align_left"] = const_965;
         param1["on_accommodate_align_right"] = const_381;
         param1["on_accommodate_align_center"] = const_610;
         param1["on_accommodate_align_top"] = const_991;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_709;
         param1["route_input_events_to_parent"] = const_366;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_833;
         param1["scalable_with_mouse"] = const_864;
         param1["reflect_horizontal_resize_to_parent"] = const_345;
         param1["reflect_vertical_resize_to_parent"] = const_461;
         param1["reflect_resize_to_parent"] = const_248;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
