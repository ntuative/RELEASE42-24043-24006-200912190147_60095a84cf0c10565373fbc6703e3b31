package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const DIMMER_STATE:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1011:int;
      
      private var _color:uint;
      
      private var var_1012:int;
      
      private var var_1639:int;
      
      private var _state:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(DIMMER_STATE,param6,param7);
         _state = param1;
         var_1639 = param2;
         var_1011 = param3;
         _color = param4;
         var_1012 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1012;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1011;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get presetId() : int
      {
         return var_1639;
      }
   }
}
