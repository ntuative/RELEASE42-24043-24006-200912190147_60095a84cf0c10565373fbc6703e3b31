package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1554:int;
      
      private var var_2034:String;
      
      private var var_2035:int;
      
      private var var_2032:int;
      
      private var var_674:Boolean;
      
      private var var_1822:Boolean;
      
      private var var_401:int;
      
      private var var_1131:String;
      
      private var var_1824:int;
      
      private var var_1130:int;
      
      private var _ownerName:String;
      
      private var var_628:String;
      
      private var var_2033:int;
      
      private var var_2036:RoomThumbnailData;
      
      private var var_1823:Boolean;
      
      private var var_578:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_578 = new Array();
         super();
         var_401 = param1.readInteger();
         var_674 = param1.readBoolean();
         var_628 = param1.readString();
         _ownerName = param1.readString();
         var_1824 = param1.readInteger();
         var_1554 = param1.readInteger();
         var_2033 = param1.readInteger();
         var_1131 = param1.readString();
         var_2035 = param1.readInteger();
         var_1823 = param1.readBoolean();
         var_2032 = param1.readInteger();
         var_1130 = param1.readInteger();
         var_2034 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_578.push(_loc4_);
            _loc3_++;
         }
         var_2036 = new RoomThumbnailData(param1);
         var_1822 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2033;
      }
      
      public function get roomName() : String
      {
         return var_628;
      }
      
      public function get userCount() : int
      {
         return var_1554;
      }
      
      public function get score() : int
      {
         return var_2032;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2034;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1823;
      }
      
      public function get tags() : Array
      {
         return var_578;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1822;
      }
      
      public function get event() : Boolean
      {
         return var_674;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1130;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2035;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2036;
      }
      
      public function get doorMode() : int
      {
         return var_1824;
      }
      
      public function get flatId() : int
      {
         return var_401;
      }
      
      public function get description() : String
      {
         return var_1131;
      }
   }
}
