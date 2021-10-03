package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1623:int;
      
      private var var_1632:String;
      
      private var var_1625:int;
      
      private var _disposed:Boolean;
      
      private var var_1633:int;
      
      private var var_1634:String;
      
      private var var_1287:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1634 = param1.readString();
         var_1623 = param1.readInteger();
         var_1625 = param1.readInteger();
         var_1632 = param1.readString();
         var_1633 = param1.readInteger();
         var_1287 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1633;
      }
      
      public function get worldId() : int
      {
         return var_1625;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_1634;
      }
      
      public function get unitPort() : int
      {
         return var_1623;
      }
      
      public function get castLibs() : String
      {
         return var_1632;
      }
      
      public function get nodeId() : int
      {
         return var_1287;
      }
   }
}
