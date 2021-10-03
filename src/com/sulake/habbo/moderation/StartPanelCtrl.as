package com.sulake.habbo.moderation
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetRoomChatlogMessageComposer;
   import com.sulake.habbo.communication.messages.parser.navigator.PublicSpaceCastLibsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   
   public class StartPanelCtrl
   {
       
      
      private var _userId:int;
      
      private var var_1182:Boolean;
      
      private var var_59:IFrameWindow;
      
      private var _roomId:int;
      
      private var var_57:ModerationManager;
      
      public function StartPanelCtrl(param1:ModerationManager)
      {
         super();
         var_57 = param1;
      }
      
      private function onUserinfoButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_57.windowTracker.show(new UserInfoFrameCtrl(var_57,_userId),var_59,false,false,true);
      }
      
      public function guestRoomEntered(param1:RoomEntryInfoMessageParser) : void
      {
         if(var_59 == null || param1 == null)
         {
            return;
         }
         var_59.findChildByName("room_tool_but").enable();
         enableChatlogButton();
         var_1182 = true;
         _roomId = param1.guestRoomId;
      }
      
      public function userSelected(param1:int, param2:String) : void
      {
         if(var_59 == null)
         {
            return;
         }
         _userId = param1;
         var _loc3_:IButtonWindow = IButtonWindow(var_59.findChildByName("userinfo_but"));
         _loc3_.enable();
         _loc3_.caption = "User info: " + param2;
      }
      
      private function onTicketQueueButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_57.issueManager.init();
      }
      
      private function onRoomToolButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_57.windowTracker.show(new RoomToolCtrl(var_57,_roomId),var_59,false,false,true);
      }
      
      private function onChatlogButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_57.windowTracker.show(new ChatlogCtrl(new GetRoomChatlogMessageComposer(!!var_1182 ? 0 : 1,_roomId),var_57,WindowTracker.const_629,_roomId),var_59,false,false,true);
      }
      
      public function publicSpaceEntered(param1:PublicSpaceCastLibsMessageParser) : void
      {
         if(var_59 == null || param1 == null)
         {
            return;
         }
         var_59.findChildByName("room_tool_but").disable();
         enableChatlogButton();
         var_1182 = false;
         _roomId = param1.nodeId;
      }
      
      private function enableChatlogButton() : void
      {
         if(var_57.initMsg.chatlogsPermission)
         {
            var_59.findChildByName("chatlog_but").enable();
         }
      }
      
      public function show() : void
      {
         if(var_59 == null)
         {
            var_59 = IFrameWindow(var_57.getXmlWindow("start_panel"));
            var_59.findChildByName("room_tool_but").procedure = onRoomToolButton;
            var_59.findChildByName("chatlog_but").procedure = onChatlogButton;
            var_59.findChildByName("ticket_queue_but").procedure = onTicketQueueButton;
            var_59.findChildByName("userinfo_but").procedure = onUserinfoButton;
            var_59.findChildByName("userinfo_but").disable();
            var_59.findChildByName("room_tool_but").disable();
            var_59.findChildByName("chatlog_but").disable();
            var_57.disableButton(var_57.initMsg.cfhPermission,var_59,"ticket_queue_but");
            var_57.disableButton(var_57.initMsg.chatlogsPermission,var_59,"chatlog_but");
         }
         var_59.visible = true;
      }
      
      public function roomExited() : void
      {
         if(var_59 == null)
         {
            return;
         }
         var_59.findChildByName("room_tool_but").disable();
         var_59.findChildByName("chatlog_but").disable();
      }
   }
}
