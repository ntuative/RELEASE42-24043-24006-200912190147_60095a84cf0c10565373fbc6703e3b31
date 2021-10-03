package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1249:int = 1;
      
      public static const const_1226:int = 4;
      
      public static const const_1571:int = 2;
      
      public static const const_1123:int = 1;
      
      public static const const_1176:int = 0;
      
      public static const const_1477:int = 0;
      
      public static const const_1261:int = 3;
       
      
      private var var_40:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         var_40 = new Array();
         super();
         this.var_40.push(param1);
         this.var_40.push(param2);
         this.var_40.push(param3);
         this.var_40.push(param4);
         this.var_40.push(param5);
         this.var_40.push(param6);
         this.var_40.push(false);
         this.var_40.push(false);
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
