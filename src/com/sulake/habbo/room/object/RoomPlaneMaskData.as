package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1940:Number = 0;
      
      private var var_1720:Number = 0;
      
      private var var_1721:Number = 0;
      
      private var var_1939:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1720 = param1;
         var_1721 = param2;
         var_1940 = param3;
         var_1939 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1720;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1940;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1721;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1939;
      }
   }
}
