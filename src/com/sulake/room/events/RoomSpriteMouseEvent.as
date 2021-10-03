package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2043:Boolean = false;
      
      private var var_2045:Boolean = false;
      
      private var var_1592:String = "";
      
      private var _type:String = "";
      
      private var var_2047:Boolean = false;
      
      private var var_1884:Number = 0;
      
      private var var_2044:Number = 0;
      
      private var var_2046:Number = 0;
      
      private var var_2042:String = "";
      
      private var var_1881:Number = 0;
      
      private var var_2048:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2042 = param2;
         var_1592 = param3;
         var_2044 = param4;
         var_2046 = param5;
         var_1884 = param6;
         var_1881 = param7;
         var_2048 = param8;
         var_2045 = param9;
         var_2047 = param10;
         var_2043 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2048;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2043;
      }
      
      public function get localX() : Number
      {
         return var_1884;
      }
      
      public function get localY() : Number
      {
         return var_1881;
      }
      
      public function get canvasId() : String
      {
         return var_2042;
      }
      
      public function get altKey() : Boolean
      {
         return var_2045;
      }
      
      public function get spriteTag() : String
      {
         return var_1592;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2044;
      }
      
      public function get screenY() : Number
      {
         return var_2046;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2047;
      }
   }
}
