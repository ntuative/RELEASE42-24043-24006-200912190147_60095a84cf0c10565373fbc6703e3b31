package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_1820:Boolean;
      
      private var var_1825:Array;
      
      private var var_1822:Boolean;
      
      private var var_1131:String;
      
      private var var_1827:Boolean;
      
      private var var_1826:int;
      
      private var var_1824:int;
      
      private var var_1130:int;
      
      private var var_1819:Boolean;
      
      private var _roomId:int;
      
      private var var_1823:Boolean;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_578:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1820 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1826;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1826 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_578;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1822;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1823;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1825 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_578 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1820;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1130;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1822 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1823 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1819 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1827 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1825;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1819;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1827;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1824 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1824;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1130 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1131 = param1;
      }
      
      public function get description() : String
      {
         return var_1131;
      }
   }
}
