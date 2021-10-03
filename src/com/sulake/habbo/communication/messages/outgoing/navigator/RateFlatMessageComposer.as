package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class RateFlatMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_40:Array;
      
      public function RateFlatMessageComposer(param1:int)
      {
         var_40 = new Array();
         super();
         this.var_40.push(param1);
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
