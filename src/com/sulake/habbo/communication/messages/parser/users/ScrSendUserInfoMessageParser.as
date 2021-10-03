package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1891:int;
      
      private var var_1196:String;
      
      private var var_1887:int;
      
      private var var_1890:int;
      
      private var var_1889:int;
      
      private var var_1888:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1196;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1888;
      }
      
      public function get responseType() : int
      {
         return var_1890;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1887;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1196 = param1.readString();
         var_1887 = param1.readInteger();
         var_1891 = param1.readInteger();
         var_1889 = param1.readInteger();
         var_1890 = param1.readInteger();
         var_1888 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1891;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1889;
      }
   }
}
