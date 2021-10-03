package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1931:XML;
      
      private var var_1445:ITextWindow;
      
      private var var_1444:ITextWindow;
      
      private var var_1934:XML;
      
      private var var_798:IWindowContainer;
      
      private var var_2214:ITextWindow;
      
      private var var_1932:String = "";
      
      private var var_2277:IButtonWindow;
      
      private var var_1933:XML;
      
      private var var_1446:ITextWindow;
      
      private var var_1930:XML;
      
      private var var_799:IButtonWindow;
      
      private var var_169:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_328:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1934) as IWindowContainer;
               break;
            case Offer.const_377:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1930) as IWindowContainer;
               break;
            case Offer.const_412:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1931) as IWindowContainer;
               break;
            case Offer.const_661:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1933) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_798 != null)
            {
               _window.removeChild(var_798);
               var_798.dispose();
            }
            var_798 = _loc2_;
            _window.addChild(_loc2_);
            var_798.x = 0;
            var_798.y = 0;
         }
         var_1446 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1444 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1445 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2214 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_799 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_799 != null)
         {
            var_799.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_799.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_169 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_169,page,var_1932);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_1934 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_1930 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_1931 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_1933 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_949,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_1932 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_169 = param1.offer;
         attachStub(var_169.priceType);
         if(var_1446 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_169.priceInCredits));
            var_1446.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1444 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_169.priceInPixels));
            var_1444.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1445 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_169.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_169.priceInPixels));
            var_1445.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_799 != null)
         {
            var_799.enable();
         }
      }
   }
}
