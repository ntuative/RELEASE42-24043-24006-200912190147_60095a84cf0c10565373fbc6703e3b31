package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_723:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_723 = new Array();
         var_723.push(param1.length);
         var_723 = var_723.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_723;
      }
   }
}
