package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2146:Class;
      
      private var var_2148:Class;
      
      private var var_2147:String;
      
      private var var_1285:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2147 = param1;
         var_2148 = param2;
         var_2146 = param3;
         if(rest == null)
         {
            var_1285 = new Array();
         }
         else
         {
            var_1285 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2146;
      }
      
      public function get assetClass() : Class
      {
         return var_2148;
      }
      
      public function get mimeType() : String
      {
         return var_2147;
      }
      
      public function get fileTypes() : Array
      {
         return var_1285;
      }
   }
}
