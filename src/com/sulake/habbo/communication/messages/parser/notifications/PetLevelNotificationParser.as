package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_511:String;
      
      private var var_1695:int;
      
      private var var_1986:String;
      
      private var var_883:int;
      
      private var var_1230:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1230;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1230 = param1.readInteger();
         var_1986 = param1.readString();
         var_1695 = param1.readInteger();
         var_511 = param1.readString();
         var_883 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1986;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_511;
      }
      
      public function get petType() : int
      {
         return var_883;
      }
      
      public function get level() : int
      {
         return var_1695;
      }
   }
}
