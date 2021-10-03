package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1211:Array;
      
      private var var_1752:String;
      
      private var var_1750:String;
      
      private var var_1751:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1211 = param1;
         var_1752 = param2;
         var_1750 = param3;
         var_1751 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1211;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_1752;
      }
      
      public function get colourAssetName() : String
      {
         return var_1750;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_1751;
      }
   }
}
