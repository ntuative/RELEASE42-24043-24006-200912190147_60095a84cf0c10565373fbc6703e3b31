package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_541:String = "me_menu_settings_view";
      
      private static const const_770:int = 10;
      
      public static const const_690:String = "me_menu_effects_view";
      
      public static const const_109:String = "me_menu_top_view";
      
      public static const const_1222:String = "me_menu_rooms_view";
      
      public static const const_834:String = "me_menu_dance_moves_view";
      
      public static const const_265:String = "me_menu_my_clothes_view";
       
      
      private var var_2038:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1482:int = 0;
      
      private var var_2041:int = 0;
      
      private var var_2040:Boolean = false;
      
      private var var_266:Boolean = false;
      
      private var var_2039:int = 0;
      
      private var var_1601:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_570:Boolean = false;
      
      private var var_99:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1237:int = 0;
      
      private var var_2037:Boolean = false;
      
      private var var_989:Point;
      
      private var var_41:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_989 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_2037 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_109);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_571,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_494,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_642,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_727,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_282,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_717,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_400,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_842,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_207,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_218,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_710,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_210,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_298,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_101,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_391,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_167,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_570;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_266)
         {
            return;
         }
         if(var_41.window.name == const_541)
         {
            (var_41 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1237 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1482 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1482.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_266 && var_41.window.name == const_265))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_552);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_571,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_494,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_642,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_727,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_282,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_207,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_218,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_710,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_717,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_400,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_842,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_210,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_298,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_391,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_101,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_167,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_41 != null)
         {
            var_41.dispose();
            var_41 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_2038;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1601 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_99 != null)
         {
            var_99.dispose();
            var_99 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_2040;
      }
      
      public function get creditBalance() : int
      {
         return var_1482;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_391:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_266 + " view: " + var_41.window.name);
               if(var_266 != true || var_41.window.name != const_109)
               {
                  return;
               }
               (var_41 as MeMenuMainView).setIconAssets("clothes_icon",const_109,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_101:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1601 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_2041;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_570 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_570 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1237 > 0;
         var_1237 = param1.daysLeft;
         var_2041 = param1.periodsLeft;
         var_2039 = param1.pastPeriods;
         var_2038 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_41 != null)
            {
               changeView(var_41.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_2040 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_41 != null && var_41.window.name != const_265)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_41 != null && var_41.window.name == const_265)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_969)
            {
               var_99 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1117);
            }
            else
            {
               var_99 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_369);
            }
            _loc2_ = _mainContainer.getChildByName(var_41.window.name);
            if(_loc2_ != null)
            {
               var_99.window.x = _loc2_.width + const_770;
               _mainContainer.addChild(var_99.window);
               _mainContainer.width = var_99.window.x + var_99.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_570 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_570 = true;
            }
         }
         if(var_41 != null && var_41.window.name == const_690)
         {
            (var_41 as MeMenuEffectsView).method_12(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_2039;
      }
      
      public function get habboClubDays() : int
      {
         return var_1237;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1296,HabboWindowStyle.const_892,HabboWindowParam.const_40,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_266 = !var_266;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_266 = false;
               break;
            default:
               return;
         }
         if(var_266)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_505);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_41 != null)
         {
            _mainContainer.removeChild(var_41.window);
            var_41.dispose();
            var_41 = null;
         }
         var_266 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_41 != null && var_41.window.name == const_265)
         {
            if(var_99 != null)
            {
               var_99.dispose();
               var_99 = null;
            }
            changeView(const_109);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_2037;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_99 != null)
         {
            var_99.dispose();
            var_99 = null;
         }
         switch(param1)
         {
            case const_109:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_690:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_834:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_265:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1222:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_541:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_41 != null)
            {
               _mainContainer.removeChild(var_41.window);
               var_41.dispose();
               var_41 = null;
            }
            var_41 = _loc2_;
            var_41.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_41 != null)
         {
            var_989.x = var_41.window.width + 10;
            var_989.y = var_41.window.height;
            var_41.window.x = 5;
            var_41.window.y = 0;
            _mainContainer.width = var_989.x;
            _mainContainer.height = var_989.y;
            if(var_99 != null)
            {
               _mainContainer.width = var_99.window.x + var_99.window.width + const_770;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         changeView(const_109);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_513);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_266 = true;
      }
   }
}
