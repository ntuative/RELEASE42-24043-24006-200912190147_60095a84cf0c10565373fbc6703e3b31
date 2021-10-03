package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_958:int = 4;
      
      public static const TYPE_PUBLIC_SPACE:int = 3;
      
      public static const const_532:int = 2;
      
      public static const const_914:int = 1;
       
      
      private var var_1864:String;
      
      private var _disposed:Boolean;
      
      private var var_1554:int;
      
      private var var_1865:Boolean;
      
      private var var_776:String;
      
      private var var_778:PublicRoomData;
      
      private var _index:int;
      
      private var var_1867:String;
      
      private var _type:int;
      
      private var var_1608:String;
      
      private var var_777:GuestRoomData;
      
      private var var_1863:String;
      
      private var var_1866:int;
      
      public function OfficialRoomEntryData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         _index = param1;
         var_1864 = param2.readString();
         var_1863 = param2.readString();
         var_1865 = param2.readInteger() == 1;
         var_1867 = param2.readString();
         var_776 = param2.readString();
         var_1554 = param2.readInteger();
         _type = param2.readInteger();
         if(_type == const_914)
         {
            var_1608 = param2.readString();
         }
         else if(_type == TYPE_PUBLIC_SPACE)
         {
            var_778 = new PublicRoomData(param2);
         }
         else if(_type == const_532)
         {
            var_777 = new GuestRoomData(param2);
         }
         else if(_type == const_958)
         {
            var_1866 = param2.readInteger();
         }
      }
      
      public function get tag() : String
      {
         return var_1608;
      }
      
      public function get userCount() : int
      {
         return var_1554;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1865;
      }
      
      public function get picText() : String
      {
         return var_1867;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_914)
         {
            return 0;
         }
         if(this.type == const_532)
         {
            return this.var_777.maxUserCount;
         }
         if(this.type == TYPE_PUBLIC_SPACE)
         {
            return this.var_778.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1863;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_777 != null)
         {
            this.var_777.dispose();
            this.var_777 = null;
         }
         if(this.var_778 != null)
         {
            this.var_778.dispose();
            this.var_778 = null;
         }
      }
      
      public function get popupCaption() : String
      {
         return var_1864;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_777;
      }
      
      public function get picRef() : String
      {
         return var_776;
      }
      
      public function get flatCategoryId() : int
      {
         return var_1866;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_778;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
