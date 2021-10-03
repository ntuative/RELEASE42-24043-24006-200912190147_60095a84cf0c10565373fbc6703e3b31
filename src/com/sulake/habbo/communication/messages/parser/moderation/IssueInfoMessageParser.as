package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.getTimer;
   
   public class IssueInfoMessageParser implements IMessageParser
   {
       
      
      private var var_64:IssueMessageData;
      
      public function IssueInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_64 = new IssueMessageData();
         var_64.issueId = param1.readInteger();
         var_64.state = param1.readInteger();
         var_64.categoryId = param1.readInteger();
         var_64.reportedCategoryId = param1.readInteger();
         var_64.timeStamp = getTimer() - param1.readInteger();
         var_64.priority = param1.readInteger();
         var_64.reporterUserId = param1.readInteger();
         var_64.reporterUserName = param1.readString();
         var_64.reportedUserId = param1.readInteger();
         var_64.reportedUserName = param1.readString();
         var_64.pickerUserId = param1.readInteger();
         var_64.pickerUserName = param1.readString();
         var_64.message = param1.readString();
         var_64.chatRecordId = param1.readInteger();
         var_64.roomName = param1.readString();
         var_64.roomType = param1.readInteger();
         if(false)
         {
            var_64.roomResources = param1.readString();
            var_64.unitPort = param1.readInteger();
            var_64.worldId = param1.readInteger();
         }
         if(false)
         {
            var_64.flatType = param1.readString();
            var_64.flatId = param1.readInteger();
            var_64.flatOwnerName = param1.readString();
         }
         return true;
      }
      
      public function get issueData() : IssueMessageData
      {
         return var_64;
      }
      
      public function flush() : Boolean
      {
         var_64 = null;
         return true;
      }
   }
}
