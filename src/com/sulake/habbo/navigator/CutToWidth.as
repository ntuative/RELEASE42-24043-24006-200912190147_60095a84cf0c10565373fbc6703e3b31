package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_412:int;
      
      private var var_182:String;
      
      private var var_195:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_182 = param1;
         var_195 = param2;
         var_412 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_195.text = var_182.substring(0,param1) + "...";
         return var_195.textWidth > var_412;
      }
   }
}
