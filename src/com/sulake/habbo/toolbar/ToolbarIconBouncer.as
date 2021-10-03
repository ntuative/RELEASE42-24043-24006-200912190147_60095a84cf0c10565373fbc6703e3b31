package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1970:Number;
      
      private var var_550:Number = 0;
      
      private var var_1969:Number;
      
      private var var_549:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1970 = param1;
         var_1969 = param2;
      }
      
      public function update() : void
      {
         var_549 += var_1969;
         var_550 += var_549;
         if(var_550 > 0)
         {
            var_550 = 0;
            var_549 = var_1970 * -1 * var_549;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_549 = param1;
         var_550 = 0;
      }
      
      public function get location() : Number
      {
         return var_550;
      }
   }
}
