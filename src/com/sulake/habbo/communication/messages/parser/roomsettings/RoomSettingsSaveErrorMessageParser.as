package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1493:int = 9;
      
      public static const const_1419:int = 4;
      
      public static const const_1514:int = 1;
      
      public static const const_1134:int = 10;
      
      public static const const_1560:int = 2;
      
      public static const const_1340:int = 7;
      
      public static const const_1140:int = 11;
      
      public static const const_1548:int = 3;
      
      public static const const_1181:int = 8;
      
      public static const const_1344:int = 5;
      
      public static const const_1511:int = 6;
      
      public static const const_1186:int = 12;
       
      
      private var var_1869:String;
      
      private var _roomId:int;
      
      private var var_1108:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1869;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1108 = param1.readInteger();
         var_1869 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1108;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
