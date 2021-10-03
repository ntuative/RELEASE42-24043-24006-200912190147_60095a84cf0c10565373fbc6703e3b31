package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_635:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1611:int;
      
      private var var_1610:int;
      
      private var var_1612:Boolean;
      
      private var var_1012:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_635);
         var_1610 = param1;
         var_1611 = param2;
         _color = param3;
         var_1012 = param4;
         var_1612 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1611;
      }
      
      public function get presetNumber() : int
      {
         return var_1610;
      }
      
      public function get brightness() : int
      {
         return var_1012;
      }
      
      public function get apply() : Boolean
      {
         return var_1612;
      }
   }
}
