package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_760:Array;
      
      private var var_774:int;
      
      private var var_1171:String;
      
      private var _offerId:int;
      
      private var var_773:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1171 = param1.readString();
         var_774 = param1.readInteger();
         var_773 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_760 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_760.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_760;
      }
      
      public function get priceInCredits() : int
      {
         return var_774;
      }
      
      public function get localizationId() : String
      {
         return var_1171;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_773;
      }
   }
}
