package com.sulake.habbo.inventory.trading
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAlreadyOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCompletedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingConfirmationEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingYouAreNotAllowedEvent;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.AcceptTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.AddItemToTradeComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.CloseTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmAcceptTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmDeclineTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.OpenTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.RemoveItemFromTradeComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.UnacceptTradingComposer;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class TradingModel implements IInventoryModel, IGetImageListener
   {
      
      public static const const_320:uint = 2;
      
      public static const const_470:uint = 4;
      
      public static const TRADING_STATE_CANCELLED:uint = 6;
      
      public static const const_238:uint = 3;
      
      public static const const_156:uint = 1;
      
      public static const const_172:uint = 0;
      
      public static const const_1254:uint = 9;
      
      public static const const_188:uint = 5;
       
      
      private var var_515:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _otherUserCanTrade:Boolean = false;
      
      private var _state:uint = 0;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_1584:String = "";
      
      private var var_507:Map;
      
      private var var_53:TradingView;
      
      private var var_1067:int = -1;
      
      private var var_211:Map;
      
      private var var_603:int = -1;
      
      private var var_1585:Boolean = false;
      
      private var var_602:Boolean = false;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_423:Boolean = false;
      
      private var var_25:HabboInventory;
      
      private var var_1529:String = "";
      
      private var _localization:IHabboLocalizationManager;
      
      public function TradingModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboLocalizationManager)
      {
         super();
         var_25 = param1;
         _communication = param3;
         _assetLibrary = param4;
         _roomEngine = param5;
         _localization = param6;
         var_53 = new TradingView(this,param2,param4,param5,param6);
      }
      
      public function get otherUserItems() : Map
      {
         return var_507;
      }
      
      public function get ownUserCanTrade() : Boolean
      {
         return var_1585;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return _otherUserCanTrade;
      }
      
      public function get state() : uint
      {
         return _state;
      }
      
      public function getFurniInventoryModel() : FurniModel
      {
         return var_25.furniModel;
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var_53.updateItemImage(param1,param2);
      }
      
      public function updateItemGroupMaps(param1:int, param2:Map, param3:int, param4:Map) : void
      {
         if(var_211 != null)
         {
            var_211.dispose();
         }
         if(var_507 != null)
         {
            var_507.dispose();
         }
         if(param1 == var_603)
         {
            var_211 = param2;
            var_507 = param4;
         }
         else
         {
            var_211 = param4;
            var_507 = param2;
         }
         var_423 = false;
         var_602 = false;
         var_53.updateItemList(var_603);
         var_53.updateItemList(var_1067);
         var_53.updateUserInterface();
         var _loc5_:FurniModel = var_25.furniModel;
         if(_loc5_ != null)
         {
            _loc5_.updateLocks();
         }
      }
      
      public function handleMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:* = null;
         if(param1 is TradingAlreadyOpenEvent)
         {
            Logger.log("TRADING::TradingAlreadyOpenEvent");
            var_53.alertPopup(TradingView.const_776);
         }
         else if(param1 is TradingAcceptEvent)
         {
            Logger.log("TRADING::TradingAcceptEvent");
            if(TradingAcceptEvent(param1).userID == var_603)
            {
               var_423 = TradingAcceptEvent(param1).userAccepts != 0;
            }
            else
            {
               var_602 = TradingAcceptEvent(param1).userAccepts != 0;
            }
            var_53.updateUserInterface();
         }
         else if(param1 is TradingConfirmationEvent)
         {
            Logger.log("TRADING::TradingConfirmationEvent");
            state = const_320;
         }
         else if(param1 is TradingCompletedEvent)
         {
            Logger.log("TRADING::TradingCompletedEvent");
            state = const_188;
         }
         else if(param1 is TradingCloseEvent)
         {
            Logger.log("TRADING::TradingCloseEvent");
            if(!var_515)
            {
               Logger.log("Received TradingCloseEvent, but trading already stopped!!!");
               return;
            }
            _loc2_ = param1 as TradingCloseEvent;
            if(_loc2_.userID != var_603)
            {
               var_53.alertPopup(TradingView.const_885);
            }
            close();
         }
         else if(param1 is TradingNotOpenEvent)
         {
            Logger.log("TRADING::TradingNotOpenEvent");
         }
         else if(param1 is TradingOtherNotAllowedEvent)
         {
            var_53.showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
         }
         else if(param1 is TradingYouAreNotAllowedEvent)
         {
            var_53.showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
         }
         else
         {
            Logger.log("TRADING/Unknown message event: " + param1);
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_53 && true)
            {
               var_53.dispose();
               var_53 = null;
            }
            var_25 = null;
            _communication = null;
            _assetLibrary = null;
            _roomEngine = null;
            _localization = null;
            _disposed = true;
         }
      }
      
      public function set state(param1:uint) : void
      {
         Logger.log("OLD STATE: " + _state + " NEW STATE: " + param1 + " OWN: " + var_423 + " OTHER: " + var_602);
         var _loc2_:Boolean = false;
         if(_state == param1)
         {
            return;
         }
         switch(_state)
         {
            case const_172:
               if(param1 == const_156 || param1 == const_188)
               {
                  _state = param1;
                  _loc2_ = true;
               }
               break;
            case const_156:
               if(param1 == const_320)
               {
                  _state = param1;
                  _loc2_ = true;
                  startConfirmCountdown();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  _state = param1;
                  var_53.setMinimized(false);
                  _loc2_ = true;
               }
               break;
            case const_320:
               if(param1 == const_238)
               {
                  _state = param1;
                  _loc2_ = true;
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  _state = param1;
                  var_53.setMinimized(false);
                  _loc2_ = true;
               }
               else if(param1 == const_156)
               {
                  _state = param1;
                  _loc2_ = true;
                  cancelConfirmCountdown();
               }
               break;
            case const_238:
               if(param1 == const_470)
               {
                  _state = param1;
                  _loc2_ = true;
               }
               else if(param1 == const_188)
               {
                  _state = param1;
                  _loc2_ = true;
                  close();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  _state = param1;
                  var_53.setMinimized(false);
                  _loc2_ = true;
                  close();
               }
               break;
            case const_470:
               if(param1 == const_188)
               {
                  _state = param1;
                  var_53.setMinimized(false);
                  _loc2_ = true;
                  close();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  _state = param1;
                  var_53.setMinimized(false);
                  _loc2_ = true;
                  close();
               }
               break;
            case const_188:
               if(param1 == const_172)
               {
                  _state = param1;
                  _loc2_ = true;
               }
               break;
            case TRADING_STATE_CANCELLED:
               if(param1 == const_172)
               {
                  _state = param1;
                  _loc2_ = true;
               }
               else if(param1 == const_156)
               {
                  _state = param1;
                  _loc2_ = true;
               }
               break;
            default:
               throw new Error("Unknown trading progress state: \"" + _state + "\"");
         }
         if(_loc2_)
         {
            var_53.updateUserInterface();
            return;
         }
         throw new Error("Error assigning trading process status!");
      }
      
      public function get ownUserName() : String
      {
         return var_1529;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get otherUserName() : String
      {
         return var_1584;
      }
      
      public function requestRemoveItemFromTrading(param1:int) : void
      {
         var _loc3_:* = null;
         if(var_423)
         {
            return;
         }
         var _loc2_:GroupItem = ownUserItems.getWithIndex(param1);
         if(_loc2_)
         {
            _loc3_ = _loc2_.peek();
            if(_loc3_)
            {
               _communication.getHabboMainConnection(null).send(new RemoveItemFromTradeComposer(_loc3_.id));
            }
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         if(var_515)
         {
            if(_state != const_172)
            {
               requestCancelTrading();
            }
         }
      }
      
      public function get ownUserAccepts() : Boolean
      {
         return var_423;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return var_53.getWindowContainer();
      }
      
      public function requestCancelTrading() : void
      {
         _communication.getHabboMainConnection(null).send(new CloseTradingComposer());
      }
      
      public function get running() : Boolean
      {
         return _state != const_172;
      }
      
      public function getOwnItemIdsInTrade() : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc1_:Array = new Array();
         if(var_211 == null || false)
         {
            return _loc1_;
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_211.length)
         {
            _loc2_ = var_211.getWithIndex(_loc4_) as GroupItem;
            if(_loc2_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc2_.getTotalCount())
               {
                  _loc3_ = _loc2_.getAt(_loc5_);
                  if(_loc3_ != null)
                  {
                     _loc1_.push(_loc3_.ref);
                  }
                  _loc5_++;
               }
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function requestAcceptTrading() : void
      {
         _communication.getHabboMainConnection(null).send(new AcceptTradingComposer());
      }
      
      public function get ownUserItems() : Map
      {
         return var_211;
      }
      
      public function categorySwitch(param1:String) : void
      {
         var_53.setMinimized(param1 != InventoryCategory.const_69);
         var_25.updateSubView();
      }
      
      public function startConfirmCountdown() : void
      {
         var_53.startConfirmCountdown();
      }
      
      public function requestFurniViewOpen() : void
      {
         var_25.toggleInventoryPage(InventoryCategory.const_69);
      }
      
      public function startTrading(param1:int, param2:String, param3:Boolean, param4:int, param5:String, param6:Boolean) : void
      {
         var_603 = param1;
         var_1529 = param2;
         var_211 = new Map();
         var_423 = false;
         var_1585 = param3;
         var_1067 = param4;
         var_1584 = param5;
         var_507 = new Map();
         var_602 = false;
         _otherUserCanTrade = param6;
         var_515 = true;
         state = const_156;
         var_53.setup(param1,param3,param4,param6);
         var_53.updateItemList(var_603);
         var_53.updateItemList(var_1067);
         var_53.updateUserInterface();
         var_53.clearItemLists();
         var_25.toggleInventoryPage(InventoryCategory.const_69);
         var_25.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING));
      }
      
      public function requestConfirmAcceptTrading() : void
      {
         state = const_470;
         _communication.getHabboMainConnection(null).send(new ConfirmAcceptTradingComposer());
      }
      
      public function requestConfirmDeclineTrading() : void
      {
         _communication.getHabboMainConnection(null).send(new ConfirmDeclineTradingComposer());
      }
      
      public function requestOpenTrading(param1:int) : void
      {
         _communication.getHabboMainConnection(null).send(new OpenTradingComposer(param1));
      }
      
      public function confirmCountdownReady() : void
      {
         if(_state == const_320)
         {
            state = const_238;
         }
      }
      
      public function cancelConfirmCountdown() : void
      {
         var_53.cancelConfirmCountdown();
      }
      
      public function get ownUserId() : int
      {
         return var_603;
      }
      
      public function requestUnacceptTrading() : void
      {
         _communication.getHabboMainConnection(null).send(new UnacceptTradingComposer());
      }
      
      public function getItemImage(param1:IItem) : BitmapData
      {
         var _loc2_:* = null;
         if(param1 is FloorItem)
         {
            _loc2_ = _roomEngine.getFurnitureImage(param1.type,new Vector3d(180,0,0),64,this);
         }
         else
         {
            _loc2_ = _roomEngine.getWallItemImage(param1.type,new Vector3d(180,0,0),64,this,param1.extras);
         }
         return _loc2_.data as BitmapData;
      }
      
      public function get otherUserId() : int
      {
         return var_1067;
      }
      
      public function get otherUserAccepts() : Boolean
      {
         return var_602;
      }
      
      public function requestAddItemToTrading(param1:int, param2:int, param3:int, param4:Boolean, param5:String = "") : Boolean
      {
         var _loc6_:* = null;
         if(var_423)
         {
            return false;
         }
         if(var_211.length < const_1254)
         {
            _communication.getHabboMainConnection(null).send(new AddItemToTradeComposer(param1));
         }
         else
         {
            if(!param4)
            {
               return false;
            }
            _loc6_ = String(param2);
            if(param3 == FurniCategory.const_160)
            {
               _loc6_ = String(param2) + "poster" + param5;
            }
            if(var_211.getValue(_loc6_) == null)
            {
               return false;
            }
            _communication.getHabboMainConnection(null).send(new AddItemToTradeComposer(param1));
         }
         return true;
      }
      
      public function closingInventoryView() : void
      {
         if(var_515)
         {
            close();
         }
      }
      
      public function close() : void
      {
         if(var_515)
         {
            if(_state != const_172 && _state != const_188)
            {
               requestCancelTrading();
               state = TradingModel.TRADING_STATE_CANCELLED;
            }
            state = const_172;
            var_25.toggleInventorySubPage(InventorySubCategory.const_943);
            var_515 = false;
         }
         var_53.setMinimized(false);
      }
   }
}
