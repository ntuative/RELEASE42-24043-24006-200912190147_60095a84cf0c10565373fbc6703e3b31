package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2158:String;
      
      private var var_994:String;
      
      private var var_2162:Boolean;
      
      private var var_2131:int;
      
      private var var_2163:Boolean;
      
      private var var_1842:String = "";
      
      private var var_2156:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1204:int;
      
      private var var_2159:Boolean;
      
      private var var_1641:int = -1;
      
      private var var_2155:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_2131 = param1;
         var_994 = param2;
         _objId = param3;
         var_1204 = param4;
         _category = param5;
         var_2158 = param6;
         var_2162 = param7;
         var_2156 = param8;
         var_2159 = param9;
         var_2163 = param10;
         var_2155 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1842;
      }
      
      public function get classId() : int
      {
         return var_1204;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2163;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2162;
      }
      
      public function get stripId() : int
      {
         return var_2131;
      }
      
      public function get stuffData() : String
      {
         return var_2158;
      }
      
      public function get songId() : int
      {
         return var_1641;
      }
      
      public function setSongData(param1:String, param2:int) : void
      {
         var_1842 = param1;
         var_1641 = param2;
      }
      
      public function get method_4() : int
      {
         return var_2155;
      }
      
      public function get itemType() : String
      {
         return var_994;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2159;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2156;
      }
   }
}
