package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1287:int;
      
      private var var_1340:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1287 = param1;
         var_1340 = param2;
         Logger.log("READ NODE: " + var_1287 + ", " + var_1340);
      }
      
      public function get nodeName() : String
      {
         return var_1340;
      }
      
      public function get nodeId() : int
      {
         return var_1287;
      }
   }
}
