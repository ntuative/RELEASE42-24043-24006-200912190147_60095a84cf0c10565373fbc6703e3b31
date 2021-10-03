package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_511:String;
      
      private var var_2236:String;
      
      private var var_2234:int;
      
      private var var_2233:int;
      
      private var var_1178:String;
      
      private var var_1246:String;
      
      private var _name:String;
      
      private var var_818:int;
      
      private var var_817:int;
      
      private var var_2232:int;
      
      private var var_2067:int;
      
      private var var_2235:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2233;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1246;
      }
      
      public function get customData() : String
      {
         return this.var_2236;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_818;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2234;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2235;
      }
      
      public function get figure() : String
      {
         return this.var_511;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2067;
      }
      
      public function get sex() : String
      {
         return this.var_1178;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_511 = param1.readString();
         this.var_1178 = param1.readString();
         this.var_2236 = param1.readString();
         this.var_1246 = param1.readString();
         this.var_2232 = param1.readInteger();
         this.var_2235 = param1.readString();
         this.var_2234 = param1.readInteger();
         this.var_2233 = param1.readInteger();
         this.var_2067 = param1.readInteger();
         this.var_817 = param1.readInteger();
         this.var_818 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2232;
      }
      
      public function get respectLeft() : int
      {
         return this.var_817;
      }
   }
}
