package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_511:String;
      
      private var var_1245:String;
      
      private var var_1244:String;
      
      private var var_1130:int;
      
      private var _gender:int;
      
      private var var_1246:String;
      
      private var _name:String;
      
      private var var_1200:Boolean;
      
      private var var_643:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._gender = param1.readInteger();
         this.var_643 = param1.readBoolean();
         this.var_1200 = param1.readBoolean();
         this.var_511 = param1.readString();
         this.var_1130 = param1.readInteger();
         this.var_1244 = param1.readString();
         this.var_1245 = param1.readString();
         this.var_1246 = param1.readString();
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function get realName() : String
      {
         return var_1246;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1244;
      }
      
      public function get categoryId() : int
      {
         return var_1130;
      }
      
      public function get online() : Boolean
      {
         return var_643;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1200;
      }
      
      public function get lastAccess() : String
      {
         return var_1245;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_511;
      }
   }
}
