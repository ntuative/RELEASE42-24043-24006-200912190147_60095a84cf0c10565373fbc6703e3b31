package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_796:String = "price_type_none";
      
      public static const const_440:String = "pricing_model_multi";
      
      public static const const_328:String = "price_type_credits";
      
      public static const const_412:String = "price_type_credits_and_pixels";
      
      public static const const_393:String = "pricing_model_bundle";
      
      public static const const_435:String = "pricing_model_single";
      
      public static const const_661:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1124:String = "pricing_model_unknown";
      
      public static const const_377:String = "price_type_pixels";
       
      
      private var var_774:int;
      
      private var _offerId:int;
      
      private var var_773:int;
      
      private var var_380:String;
      
      private var var_536:String;
      
      private var var_1859:int;
      
      private var var_632:ICatalogPage;
      
      private var var_1171:String;
      
      private var var_379:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1171 = param1.localizationId;
         var_774 = param1.priceInCredits;
         var_773 = param1.priceInPixels;
         var_632 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_380;
      }
      
      public function get page() : ICatalogPage
      {
         return var_632;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1859 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_379;
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
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1171 = "";
         var_774 = 0;
         var_773 = 0;
         var_632 = null;
         if(var_379 != null)
         {
            var_379.dispose();
            var_379 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_536;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1859;
      }
      
      public function get priceInCredits() : int
      {
         return var_774;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_380 = const_435;
            }
            else
            {
               var_380 = const_440;
            }
         }
         else if(param1.length > 1)
         {
            var_380 = const_393;
         }
         else
         {
            var_380 = const_1124;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_380)
         {
            case const_435:
               var_379 = new SingleProductContainer(this,param1);
               break;
            case const_440:
               var_379 = new MultiProductContainer(this,param1);
               break;
            case const_393:
               var_379 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_380);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_774 > 0 && var_773 > 0)
         {
            var_536 = const_412;
         }
         else if(var_774 > 0)
         {
            var_536 = const_328;
         }
         else if(var_773 > 0)
         {
            var_536 = const_377;
         }
         else
         {
            var_536 = const_796;
         }
      }
   }
}
