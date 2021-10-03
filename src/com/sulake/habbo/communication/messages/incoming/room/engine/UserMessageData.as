package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1173:String = "F";
      
      public static const const_783:String = "M";
       
      
      private var var_89:Number = 0;
      
      private var var_511:String = "";
      
      private var var_2025:int = 0;
      
      private var var_1655:String = "";
      
      private var var_1653:int = 0;
      
      private var var_1651:int = 0;
      
      private var var_1652:String = "";
      
      private var var_1178:String = "";
      
      private var _id:int = 0;
      
      private var var_203:Boolean = false;
      
      private var var_236:int = 0;
      
      private var var_2024:String = "";
      
      private var _name:String = "";
      
      private var var_1654:int = 0;
      
      private var _y:Number = 0;
      
      private var var_90:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_90;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_236;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_203)
         {
            var_236 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_203)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2025;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_203)
         {
            var_1653 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2024;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_203)
         {
            var_1652 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_203)
         {
            var_2024 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_203)
         {
            var_1651 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_203)
         {
            var_511 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_203)
         {
            var_2025 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_203)
         {
            var_1178 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1653;
      }
      
      public function get groupID() : String
      {
         return var_1652;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_203)
         {
            var_1654 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_203)
         {
            var_1655 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_203 = true;
      }
      
      public function get sex() : String
      {
         return var_1178;
      }
      
      public function get figure() : String
      {
         return var_511;
      }
      
      public function get webID() : int
      {
         return var_1654;
      }
      
      public function get custom() : String
      {
         return var_1655;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_203)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_203)
         {
            var_90 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_203)
         {
            var_89 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_89;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1651;
      }
   }
}
