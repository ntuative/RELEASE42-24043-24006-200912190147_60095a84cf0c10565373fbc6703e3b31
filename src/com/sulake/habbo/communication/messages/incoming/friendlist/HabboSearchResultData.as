package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2200:Boolean;
      
      private var var_2202:int;
      
      private var var_2199:Boolean;
      
      private var var_1436:String;
      
      private var var_1246:String;
      
      private var var_1588:int;
      
      private var var_1879:String;
      
      private var var_2201:String;
      
      private var var_1878:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1588 = param1.readInteger();
         this.var_1436 = param1.readString();
         this.var_1879 = param1.readString();
         this.var_2200 = param1.readBoolean();
         this.var_2199 = param1.readBoolean();
         param1.readString();
         this.var_2202 = param1.readInteger();
         this.var_1878 = param1.readString();
         this.var_2201 = param1.readString();
         this.var_1246 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1246;
      }
      
      public function get avatarName() : String
      {
         return this.var_1436;
      }
      
      public function get avatarId() : int
      {
         return this.var_1588;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2200;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2201;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1878;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2199;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1879;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2202;
      }
   }
}
