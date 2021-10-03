package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_90:Number = 0;
      
      private var var_236:int = 0;
      
      private var var_1745:int = 0;
      
      private var var_1744:Number = 0;
      
      private var var_1743:Number = 0;
      
      private var var_1747:Number = 0;
      
      private var var_1748:Number = 0;
      
      private var var_1746:Boolean = false;
      
      private var var_89:Number = 0;
      
      private var _id:int = 0;
      
      private var var_190:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_190 = [];
         super();
         _id = param1;
         var_89 = param2;
         _y = param3;
         var_90 = param4;
         var_1748 = param5;
         var_236 = param6;
         var_1745 = param7;
         var_1744 = param8;
         var_1743 = param9;
         var_1747 = param10;
         var_1746 = param11;
         var_190 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_90;
      }
      
      public function get dir() : int
      {
         return var_236;
      }
      
      public function get localZ() : Number
      {
         return var_1748;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1746;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1745;
      }
      
      public function get targetX() : Number
      {
         return var_1744;
      }
      
      public function get targetY() : Number
      {
         return var_1743;
      }
      
      public function get targetZ() : Number
      {
         return var_1747;
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      public function get actions() : Array
      {
         return var_190.slice();
      }
   }
}
