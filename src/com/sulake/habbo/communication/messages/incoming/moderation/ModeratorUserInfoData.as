package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1669:int;
      
      private var var_1665:int;
      
      private var var_1668:int;
      
      private var _userName:String;
      
      private var var_1666:int;
      
      private var var_1667:int;
      
      private var var_1664:int;
      
      private var _userId:int;
      
      private var var_643:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1667 = param1.readInteger();
         var_1666 = param1.readInteger();
         var_643 = param1.readBoolean();
         var_1668 = param1.readInteger();
         var_1665 = param1.readInteger();
         var_1669 = param1.readInteger();
         var_1664 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1664;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_643;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1666;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1665;
      }
      
      public function get cautionCount() : int
      {
         return var_1669;
      }
      
      public function get cfhCount() : int
      {
         return var_1668;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1667;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
