package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2122:int;
      
      private var var_2128:int;
      
      private var var_994:String;
      
      private var var_1916:int;
      
      private var var_2127:String;
      
      private var var_2125:int;
      
      private var var_2126:int;
      
      private var _category:int;
      
      private var var_2124:int;
      
      private var var_2129:int;
      
      private var var_2130:int;
      
      private var var_2123:Boolean;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int)
      {
         super();
         var_1916 = param1;
         var_994 = param2;
         var_2128 = param3;
         var_2130 = param4;
         _category = param5;
         var_2127 = param6;
         var_2125 = param7;
         var_2122 = param8;
         var_2129 = param9;
         var_2126 = param10;
         var_2123 = param11;
         var_2124 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2130;
      }
      
      public function get groupable() : Boolean
      {
         return var_2123;
      }
      
      public function get creationMonth() : int
      {
         return var_2129;
      }
      
      public function get roomItemID() : int
      {
         return var_2128;
      }
      
      public function get itemType() : String
      {
         return var_994;
      }
      
      public function get itemID() : int
      {
         return var_1916;
      }
      
      public function get itemSpecificData() : String
      {
         return var_2127;
      }
      
      public function get songID() : int
      {
         return var_2124;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2125;
      }
      
      public function get creationYear() : int
      {
         return var_2126;
      }
      
      public function get creationDay() : int
      {
         return var_2122;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
