package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1509:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1413:String = "ROE_MOUSE_ENTER";
      
      public static const const_392:String = "ROE_MOUSE_MOVE";
      
      public static const const_1521:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_187:String = "ROE_MOUSE_CLICK";
      
      public static const const_363:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2047:Boolean;
      
      private var var_2043:Boolean;
      
      private var var_2045:Boolean;
      
      private var var_2048:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2045 = param4;
         var_2048 = param5;
         var_2047 = param6;
         var_2043 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2043;
      }
      
      public function get altKey() : Boolean
      {
         return var_2045;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2048;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2047;
      }
   }
}
