package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_258:String = "e";
      
      public static const const_78:String = "i";
      
      public static const const_85:String = "s";
       
      
      private var var_887:String;
      
      private var var_1084:String;
      
      private var var_1087:int;
      
      private var var_2029:int;
      
      private var var_886:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1084 = param1.readString();
         var_2029 = param1.readInteger();
         var_887 = param1.readString();
         var_886 = param1.readInteger();
         var_1087 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_886;
      }
      
      public function get productType() : String
      {
         return var_1084;
      }
      
      public function get expiration() : int
      {
         return var_1087;
      }
      
      public function get furniClassId() : int
      {
         return var_2029;
      }
      
      public function get extraParam() : String
      {
         return var_887;
      }
   }
}
