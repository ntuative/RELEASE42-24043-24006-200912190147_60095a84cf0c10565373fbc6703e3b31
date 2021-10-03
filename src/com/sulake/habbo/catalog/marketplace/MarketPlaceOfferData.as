package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.window.IWindowContainer;
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_2132:int;
      
      private var var_1277:int;
      
      private var var_1810:int = -1;
      
      private var _window:IWindowContainer;
      
      private var var_352:int;
      
      private var _furniType:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1809:int;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:int, param5:int)
      {
         super();
         _offerId = param1;
         var_1809 = param2;
         _furniType = param3;
         var_1277 = param4;
         var_352 = param5;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_2132 = param1;
      }
      
      public function get imageCallback() : int
      {
         return var_2132;
      }
      
      public function get price() : int
      {
         return var_1277;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1810;
      }
      
      public function set price(param1:int) : void
      {
         var_1277 = param1;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_1810 = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return _furniType;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
         }
         if(_window)
         {
            _window.dispose();
         }
      }
      
      public function set window(param1:IWindowContainer) : void
      {
         _window = param1;
      }
      
      public function get status() : int
      {
         return var_352;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      public function get furniId() : int
      {
         return var_1809;
      }
   }
}