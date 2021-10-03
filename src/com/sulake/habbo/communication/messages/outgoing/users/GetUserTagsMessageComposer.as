package com.sulake.habbo.communication.messages.outgoing.users
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetUserTagsMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_40:Array;
      
      public function GetUserTagsMessageComposer(param1:int)
      {
         var_40 = [];
         super();
         this.var_40.push(int(param1));
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_40;
      }
      
      public function dispose() : void
      {
         this.var_40 = null;
      }
   }
}
