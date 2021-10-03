package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1967:Boolean;
      
      private var var_1461:Array;
      
      private var var_1965:Boolean;
      
      private var var_1962:Boolean;
      
      private var var_1963:Boolean;
      
      private var var_152:Array;
      
      private var var_1961:Boolean;
      
      private var var_1960:Boolean;
      
      private var var_1462:Array;
      
      private var var_1966:Boolean;
      
      private var var_1964:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1964;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1967;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1965;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1961;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1960;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1461;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_152 = [];
         var_1461 = [];
         _roomMessageTemplates = [];
         var_1462 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_152.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1461.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1462.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1961 = param1.readBoolean();
         var_1963 = param1.readBoolean();
         var_1965 = param1.readBoolean();
         var_1962 = param1.readBoolean();
         var_1964 = param1.readBoolean();
         var_1960 = param1.readBoolean();
         var_1967 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1966 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1962;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1462;
      }
      
      public function get issues() : Array
      {
         return var_152;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1966;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1963;
      }
   }
}
