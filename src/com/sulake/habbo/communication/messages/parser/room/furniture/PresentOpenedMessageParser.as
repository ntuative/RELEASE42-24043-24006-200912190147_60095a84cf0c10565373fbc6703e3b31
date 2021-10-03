package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PresentOpenedMessageParser implements IMessageParser
   {
       
      
      private var var_994:String;
      
      private var var_1204:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function PresentOpenedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_994 = param1.readString();
         var_1204 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_994 = "";
         var_1204 = 0;
         return true;
      }
      
      public function get itemType() : String
      {
         return var_994;
      }
      
      public function get classId() : int
      {
         return var_1204;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
   }
}
