package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1791:String;
      
      private var var_1231:String;
      
      private var var_1790:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1790 = param1;
         var_1231 = param2;
         var_1791 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1790,var_1231,var_1791];
      }
      
      public function dispose() : void
      {
      }
   }
}
