package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_922:int = 0;
      
      private var var_1061:int = 0;
      
      private var var_1546:String = "";
      
      private var var_923:int = 0;
      
      private var var_1544:String = "";
      
      private var var_1547:int = 0;
      
      private var var_1418:String = "";
      
      private var var_1543:int = 0;
      
      private var var_1549:int = 0;
      
      private var var_1545:String = "";
      
      private var var_1548:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1543 = param1;
         var_1545 = param2;
         var_1418 = param3;
         var_1546 = param4;
         var_1544 = param5;
         if(param6)
         {
            var_1061 = 1;
         }
         else
         {
            var_1061 = 0;
         }
         var_1547 = param7;
         var_1549 = param8;
         var_923 = param9;
         var_1548 = param10;
         var_922 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1543,var_1545,var_1418,var_1546,var_1544,var_1061,var_1547,var_1549,var_923,var_1548,var_922];
      }
      
      public function dispose() : void
      {
      }
   }
}
