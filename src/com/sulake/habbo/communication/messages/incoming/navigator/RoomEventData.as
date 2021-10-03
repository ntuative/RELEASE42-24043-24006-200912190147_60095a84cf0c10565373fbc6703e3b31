package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2017:String;
      
      private var var_401:int;
      
      private var var_2018:String;
      
      private var var_2020:String;
      
      private var var_2019:int;
      
      private var var_2021:String;
      
      private var var_2022:int;
      
      private var var_578:Array;
      
      private var var_1018:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_578 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1018 = false;
            return;
         }
         this.var_1018 = true;
         var_2019 = int(_loc2_);
         var_2018 = param1.readString();
         var_401 = int(param1.readString());
         var_2022 = param1.readInteger();
         var_2017 = param1.readString();
         var_2020 = param1.readString();
         var_2021 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_578.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2022;
      }
      
      public function get eventName() : String
      {
         return var_2017;
      }
      
      public function get eventDescription() : String
      {
         return var_2020;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2018;
      }
      
      public function get tags() : Array
      {
         return var_578;
      }
      
      public function get creationTime() : String
      {
         return var_2021;
      }
      
      public function get exists() : Boolean
      {
         return var_1018;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2019;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_578 = null;
      }
      
      public function get flatId() : int
      {
         return var_401;
      }
   }
}
