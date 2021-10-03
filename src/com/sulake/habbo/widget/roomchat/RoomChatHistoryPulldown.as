package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryPulldown
   {
      
      public static const const_405:int = 2;
      
      public static const const_316:int = 1;
      
      public static const const_189:int = 0;
      
      public static const const_744:int = 3;
      
      private static const const_735:int = 150;
      
      private static const const_734:int = 250;
      
      public static const const_71:int = 39;
       
      
      private var var_1338:BitmapData;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1339:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var var_1594:int = 0;
      
      private var var_42:IWindowContainer;
      
      private var var_102:IRegionWindow;
      
      private var var_1598:int = 30;
      
      private var _state:int = -1;
      
      private var var_1593:BitmapData;
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1595:BitmapData;
      
      private var var_75:IBitmapWrapperWindow;
      
      private var var_1596:BitmapData;
      
      private var var_1597:BitmapData;
      
      private var var_1337:BitmapData;
      
      public function RoomChatHistoryPulldown(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         _widget = param1;
         _windowManager = param2;
         _assetLibrary = param4;
         var_42 = param3;
         var_1597 = (_assetLibrary.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData;
         var_1339 = (_assetLibrary.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData;
         var_1596 = (_assetLibrary.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData;
         var_1337 = (_assetLibrary.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData;
         var_1338 = (_assetLibrary.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData;
         var_1593 = (_assetLibrary.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData;
         var_1595 = (_assetLibrary.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData;
         var_75 = _windowManager.createWindow("chat_history_bg","",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_39,HabboWindowParam.const_65,new Rectangle(0,0,param3.width,param3.height - const_71),null,0,0) as IBitmapWrapperWindow;
         var_42.addChild(var_75);
         _window = _windowManager.createWindow("chat_pulldown","",HabboWindowType.const_55,HabboWindowStyle.const_39,HabboWindowParam.const_37,new Rectangle(0,0 - const_71,param3.width,const_71),null,0) as IWindowContainer;
         var_42.addChild(_window);
         var_102 = _windowManager.createWindow("REGIONchat_pulldown","",WindowType.const_388,HabboWindowStyle.const_40,0 | 0 | 0 | 0,new Rectangle(0,0,param3.width,param3.height - const_71),null,0) as IRegionWindow;
         if(var_102 != null)
         {
            var_102.background = true;
            var_102.alphaTreshold = 0;
            var_102.addEventListener(WindowMouseEvent.const_53,onPulldownMouseDown);
            var_42.addChild(var_102);
            var_102.toolTipCaption = "${chat.history.drag.tooltip}";
            var_102.toolTipDelay = 250;
         }
         var _loc5_:XmlAsset = param4.getAssetByName("chat_history_pulldown") as XmlAsset;
         _window.buildFromXML(_loc5_.content as XML);
         _window.addEventListener(WindowMouseEvent.const_53,onPulldownMouseDown);
         var _loc6_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc6_.alphaTreshold = 0;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onCloseButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.const_97,onCloseButtonMouseUp);
            _loc6_.addEventListener(WindowMouseEvent.const_53,onCloseButtonMouseDown);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onCloseButtonMouseOver);
            _loc6_.addEventListener(WindowMouseEvent.const_28,onCloseButtonMouseOut);
         }
         _window.background = true;
         _window.color = 0;
         _window.alphaTreshold = 0;
         this.state = const_189;
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseDown(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1593.clone();
         }
      }
      
      private function onCloseButtonMouseUp(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1338.clone();
         }
      }
      
      public function update(param1:uint) : void
      {
         switch(state)
         {
            case const_405:
               var_75.blend += param1 / const_734;
               _window.blend += param1 / const_734;
               if(false)
               {
                  state = const_316;
               }
               break;
            case const_744:
               var_75.blend = 0 - param1 / const_735;
               _window.blend = 0 - param1 / const_735;
               if(true)
               {
                  state = const_189;
               }
         }
      }
      
      private function onCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownCloseButtonClicked(param1);
         }
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      private function onCloseButtonMouseOver(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1338.clone();
         }
      }
      
      public function dispose() : void
      {
         if(var_102 != null)
         {
            var_102.dispose();
            var_102 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_75 != null)
         {
            var_75.dispose();
            var_75 = null;
         }
      }
      
      private function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownMouseDown(param1);
         }
      }
      
      public function set state(param1:int) : void
      {
         if(param1 == _state)
         {
            return;
         }
         switch(param1)
         {
            case const_316:
               if(_state == const_189)
               {
                  this.state = const_405;
               }
               else
               {
                  if(_window == null || var_75 == null)
                  {
                     return;
                  }
                  _window.visible = true;
                  var_75.visible = true;
                  var_102.visible = true;
                  _state = param1;
               }
               break;
            case const_189:
               if(_window == null || var_75 == null)
               {
                  return;
               }
               _window.visible = false;
               var_75.visible = false;
               var_102.visible = false;
               _state = param1;
               break;
            case const_405:
               if(_window == null || var_75 == null)
               {
                  return;
               }
               _window.blend = 0;
               var_75.blend = 0;
               _window.visible = true;
               var_75.visible = true;
               _state = param1;
               break;
            case const_744:
               if(_window == null || var_75 == null)
               {
                  return;
               }
               _window.blend = 1;
               var_75.blend = 1;
               _state = param1;
               break;
         }
      }
      
      private function tileBitmapHorz(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:int = param2.width / param1.width;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_ + 1)
         {
            param2.copyPixels(param1,param1.rect,new Point(_loc4_ * param1.width,0));
            _loc4_++;
         }
      }
      
      public function containerResized(param1:Rectangle) : void
      {
         if(_window != null)
         {
            _window.x = 0;
            _window.y = 0 - const_71;
            _window.width = var_42.width;
         }
         if(var_102 != null)
         {
            var_102.x = 0;
            var_102.y = 0 - const_71;
            var_102.width = 0 - var_1598;
         }
         if(var_75 != null)
         {
            var_75.rectangle = var_42.rectangle;
            var_75.height = 0 - const_71;
         }
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseOut(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1337.clone();
         }
      }
      
      private function buildWindowGraphics() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(_window == null)
         {
            return;
         }
         if(var_1594 == _window.width)
         {
            return;
         }
         var_1594 = _window.width;
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("grapBarBg") as IBitmapWrapperWindow;
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripL") as IBitmapWrapperWindow;
         var _loc4_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripR") as IBitmapWrapperWindow;
         var _loc5_:IBitmapWrapperWindow = _window.findChildByName("grapBarHandle") as IBitmapWrapperWindow;
         if(_loc2_ != null && _loc5_ != null)
         {
            _loc5_.bitmap = var_1596.clone();
            _loc2_.bitmap = var_1337.clone();
            var_1598 = 0 - _loc2_.x;
         }
         _loc3_.width = _loc5_.x - 5;
         _loc3_.x = 0;
         _loc4_.x = _loc5_.x + _loc5_.width + 5;
         _loc4_.width = _loc2_.x - 5 - _loc4_.x;
         if(_loc3_.width < 0)
         {
            _loc3_.width = 0;
         }
         if(_loc4_.width < 0)
         {
            _loc4_.width = 0;
         }
         if(_loc1_ != null && _loc3_ != null && _loc4_ != null)
         {
            if(_loc1_.width > 0 && _loc1_.height > 0)
            {
               _loc7_ = new BitmapData(_loc1_.width,_loc1_.height);
               tileBitmapHorz(var_1597.clone(),_loc7_);
               _loc1_.bitmap = _loc7_;
            }
            if(_loc3_.width > 0 && _loc3_.height > 0)
            {
               _loc8_ = new BitmapData(_loc3_.width,_loc3_.height);
               tileBitmapHorz(var_1339.clone(),_loc8_);
               _loc3_.bitmap = _loc8_;
            }
            if(_loc4_.width > 0 && _loc4_.height > 0)
            {
               _loc9_ = new BitmapData(_loc4_.width,_loc4_.height);
               tileBitmapHorz(var_1339.clone(),_loc9_);
               _loc4_.bitmap = _loc9_;
            }
         }
         if(var_75 == null)
         {
            return;
         }
         var_75.bitmap = var_1595.clone();
      }
   }
}
