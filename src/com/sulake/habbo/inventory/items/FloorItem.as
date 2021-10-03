package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_1302:String;
      
      protected var var_2176:Boolean;
      
      protected var var_2122:int;
      
      protected var var_2177:Boolean;
      
      protected var _type:int;
      
      protected var var_2126:int;
      
      protected var var_2174:Boolean;
      
      protected var var_1641:int;
      
      protected var var_2178:Boolean;
      
      protected var _id:int;
      
      protected var var_2179:int;
      
      protected var var_1842:String;
      
      protected var var_2123:Boolean;
      
      protected var _category:int;
      
      protected var var_2129:int;
      
      protected var var_2175:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:int, param11:int, param12:int, param13:int, param14:String, param15:int)
      {
         super();
         _id = param1;
         _type = param2;
         var_2179 = param3;
         _category = param4;
         var_2123 = param5;
         var_2178 = param6;
         var_2176 = param7;
         var_2177 = param8;
         var_1302 = param9;
         var_2175 = param10;
         var_2122 = param11;
         var_2129 = param12;
         var_2126 = param13;
         var_1842 = param14;
         var_1641 = param15;
      }
      
      public function get locked() : Boolean
      {
         return var_2174;
      }
      
      public function get songId() : int
      {
         return var_1641;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2174 = param1;
      }
      
      public function get ref() : int
      {
         return var_2179;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2177;
      }
      
      public function get slotId() : String
      {
         return var_1842;
      }
      
      public function get expires() : int
      {
         return var_2175;
      }
      
      public function get creationYear() : int
      {
         return var_2126;
      }
      
      public function get creationDay() : int
      {
         return var_2122;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2178;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get groupable() : Boolean
      {
         return var_2123;
      }
      
      public function get creationMonth() : int
      {
         return var_2129;
      }
      
      public function get extras() : String
      {
         return var_1302;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2176;
      }
   }
}
