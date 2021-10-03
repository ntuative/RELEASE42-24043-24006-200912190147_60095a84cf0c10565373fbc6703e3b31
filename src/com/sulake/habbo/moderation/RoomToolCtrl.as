package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomData;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomModerationData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorRoomInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetRoomChatlogMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModerateRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModeratorActionMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class RoomToolCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var _disposed:Boolean;
      
      private var var_995:ICheckBoxWindow;
      
      private var _data:RoomModerationData;
      
      private var var_401:int;
      
      private var var_57:ModerationManager;
      
      private var var_372:ITextFieldWindow;
      
      private var _list:IItemListWindow;
      
      private var var_304:Boolean = true;
      
      private var var_764:IDropMenuWindow;
      
      private var var_679:ICheckBoxWindow;
      
      private var var_59:IFrameWindow;
      
      private var var_996:ICheckBoxWindow;
      
      public function RoomToolCtrl(param1:ModerationManager, param2:int)
      {
         super();
         var_57 = param1;
         var_401 = param2;
      }
      
      public static function getLowestPoint(param1:IWindowContainer) : int
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            if(_loc4_.visible)
            {
               _loc2_ = Math.max(_loc2_,_loc4_.y + _loc4_.height);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function moveChildrenToColumn(param1:IWindowContainer, param2:int, param3:int) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.numChildren)
         {
            _loc5_ = param1.getChildAt(_loc4_);
            if(_loc5_ != null && _loc5_.visible && _loc5_.height > 0)
            {
               _loc5_.y = param2;
               param2 += _loc5_.height + param3;
            }
            _loc4_++;
         }
      }
      
      private function onSendMessage(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         act(false);
      }
      
      private function onChatlog(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_57.windowTracker.show(new ChatlogCtrl(new GetRoomChatlogMessageComposer(0,_data.flatId),var_57,WindowTracker.const_629,_data.flatId),var_59,false,false,true);
      }
      
      public function getId() : String
      {
         return "" + var_401;
      }
      
      private function setSendButtonState(param1:String) : void
      {
         var _loc2_:Boolean = _data != null && true;
         var _loc3_:IButtonWindow = IButtonWindow(var_59.findChildByName(param1));
         if(_loc2_ && var_57.initMsg.roomAlertPermission)
         {
            _loc3_.enable();
         }
         else
         {
            _loc3_.disable();
         }
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + var_57.initMsg.roomMessageTemplates.length);
         param1.populate(var_57.initMsg.roomMessageTemplates);
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_326)
         {
            return;
         }
         if(!var_304)
         {
            return;
         }
         var_372.text = "";
         var_304 = false;
      }
      
      private function getTagsAsString(param1:Array) : String
      {
         var _loc3_:* = null;
         var _loc2_:String = "";
         for each(_loc3_ in param1)
         {
            if(_loc2_ == "")
            {
               _loc2_ = _loc3_;
            }
            else
            {
               _loc2_ = _loc2_ + ", " + _loc3_;
            }
         }
         return _loc2_;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_57.messageHandler.removeRoomEnterListener(this);
         if(var_59 != null)
         {
            var_59.destroy();
            var_59 = null;
         }
         if(_data != null)
         {
            _data.dispose();
            _data = null;
         }
         var_57 = null;
         _list = null;
         var_764 = null;
         var_372 = null;
         var_679 = null;
         var_995 = null;
         var_996 = null;
      }
      
      private function refreshRoomData(param1:RoomData, param2:String) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(_list.getListItemByName(param2));
         var _loc4_:IWindowContainer = IWindowContainer(_loc3_.findChildByName("room_data"));
         if(_loc4_ == null)
         {
            _loc4_ = IWindowContainer(var_57.getXmlWindow("roomtool_roomdata"));
            _loc3_.addChild(_loc4_);
         }
         if(!param1.exists)
         {
            _list.removeListItem(_loc3_);
            _list.removeListItem(_list.getListItemByName("event_spacing"));
            return;
         }
         var _loc5_:ITextWindow = ITextWindow(_loc4_.findChildByName("name"));
         _loc5_.text = param1.name;
         _loc5_.height = _loc5_.textHeight + 5;
         var _loc6_:ITextWindow = ITextWindow(_loc4_.findChildByName("desc"));
         _loc6_.text = param1.desc;
         _loc6_.height = _loc6_.textHeight + 5;
         var _loc7_:IWindowContainer = IWindowContainer(_loc4_.findChildByName("tags_cont"));
         var _loc8_:ITextWindow = ITextWindow(_loc7_.findChildByName("tags_txt"));
         _loc8_.text = getTagsAsString(param1.tags);
         _loc8_.height = _loc8_.textHeight + 5;
         _loc7_.height = _loc8_.height;
         if(param1.tags.length < 1)
         {
            _loc4_.removeChild(_loc7_);
         }
         moveChildrenToColumn(_loc4_,_loc5_.y,0);
         _loc4_.height = getLowestPoint(_loc4_);
         _loc3_.height = _loc4_.height + 2 * _loc4_.y;
         Logger.log("XXXX: " + _loc3_.height + ", " + _loc4_.height + ", " + _loc5_.height + ", " + _loc6_.height + ", " + _loc7_.height + ", " + _loc8_.height);
      }
      
      public function onRoomChange() : void
      {
         setSendButtonState("send_caution_but");
         setSendButtonState("send_message_but");
      }
      
      private function setTxt(param1:String, param2:String) : void
      {
         var _loc3_:ITextWindow = ITextWindow(var_59.findChildByName(param1));
         _loc3_.text = param2;
      }
      
      public function onRoomInfo(param1:RoomModerationData) : void
      {
         Logger.log("GOT ROOM INFO: " + param1.flatId + ", " + var_401);
         if(param1.flatId != var_401)
         {
            Logger.log("NOT THE SAME FLAT: " + param1.flatId + ", " + var_401);
            return;
         }
         _data = param1;
         populate();
         var_57.messageHandler.removeRoomInfoListener(this);
         var_59.visible = true;
         var_57.messageHandler.addRoomEnterListener(this);
         Logger.log("TURNED VISIBLE: undefined, undefined");
      }
      
      private function onEditInHk(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Edit in hk clicked");
         var_57.openHkPage("roomadmin.url","undefined");
      }
      
      private function onEnterRoom(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Enter room clicked");
         var_57.goToRoom(_data.flatId);
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      private function onOwnerName(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_57.windowTracker.show(new UserInfoFrameCtrl(var_57,_data.ownerId),var_59,false,false,true);
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_59;
      }
      
      private function act(param1:Boolean) : void
      {
         if(var_304 || false)
         {
            var_57.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var _loc2_:int = determineAction(param1,var_679.isSelected);
         var_57.connection.send(new ModeratorActionMessageComposer(ModeratorActionMessageComposer.const_1249,_loc2_,var_372.text,"",""));
         if(false)
         {
            var_57.connection.send(new ModerateRoomMessageComposer(_data.flatId,var_995.isSelected,var_996.isSelected,var_679.isSelected));
         }
         this.dispose();
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_51)
         {
            return;
         }
         var _loc3_:String = var_57.initMsg.roomMessageTemplates["null"];
         if(_loc3_ != null)
         {
            var_304 = false;
            var_372.text = _loc3_;
         }
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.TYPE_ROOMINFO;
      }
      
      private function determineAction(param1:Boolean, param2:Boolean) : int
      {
         if(param2)
         {
            return !!param1 ? 0 : int(ModeratorActionMessageComposer.const_1226);
         }
         return !!param1 ? 0 : int(ModeratorActionMessageComposer.const_1261);
      }
      
      public function populate() : void
      {
         _list = IItemListWindow(var_59.findChildByName("list_cont"));
         var _loc1_:IWindow = var_59.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_372 = ITextFieldWindow(var_59.findChildByName("message_input"));
         var_372.procedure = onInputClick;
         var_764 = IDropMenuWindow(var_59.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_764);
         var_764.procedure = onSelectTemplate;
         var_679 = ICheckBoxWindow(var_59.findChildByName("kick_check"));
         var_995 = ICheckBoxWindow(var_59.findChildByName("lock_check"));
         var_996 = ICheckBoxWindow(var_59.findChildByName("changename_check"));
         refreshRoomData(_data.room,"room_cont");
         refreshRoomData(_data.event,"event_cont");
         setTxt("owner_name_txt",_data.ownerName);
         setTxt("owner_in_room_txt",!true ? "Yes" : "No");
         setTxt("user_count_txt","undefined");
         setTxt("has_event_txt",!!_data.event.exists ? "Yes" : "No");
         var_59.findChildByName("enter_room_but").procedure = onEnterRoom;
         var_59.findChildByName("chatlog_but").procedure = onChatlog;
         var_59.findChildByName("edit_in_hk_but").procedure = onEditInHk;
         var_59.findChildByName("bobba_filter_but").procedure = onBobbaFilter;
         var_59.findChildByName("send_caution_but").procedure = onSendCaution;
         var_59.findChildByName("send_message_but").procedure = onSendMessage;
         var_57.disableButton(var_57.initMsg.bobbaFilterPermission,var_59,"bobba_filter_but");
         var_57.disableButton(var_57.initMsg.chatlogsPermission,var_59,"chatlog_but");
         if(!var_57.initMsg.roomKickPermission)
         {
            var_679.disable();
         }
         var_59.findChildByName("owner_name_txt").procedure = onOwnerName;
         this.onRoomChange();
      }
      
      private function onSendCaution(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         act(true);
      }
      
      private function onBobbaFilter(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Bobba filter clicked");
         var_57.openHkPage("wordfilter.url","");
      }
      
      public function show() : void
      {
         var_59 = IFrameWindow(var_57.getXmlWindow("roomtool_frame"));
         var_57.messageHandler.addRoomInfoListener(this);
         var_57.connection.send(new GetModeratorRoomInfoMessageComposer(var_401));
         Logger.log("BEGINNING TO SHOW: " + var_401);
      }
   }
}
