package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1029:int;
      
      private var var_1935:int;
      
      private var var_1447:int;
      
      private var var_121:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1447 = param1.readInteger();
         var_1935 = param1.readInteger();
         var_1029 = param1.readInteger();
         var_121 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1447);
      }
      
      public function get reportedUserId() : int
      {
         return var_1029;
      }
      
      public function get callerUserId() : int
      {
         return var_1935;
      }
      
      public function get callId() : int
      {
         return var_1447;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_121;
      }
   }
}
