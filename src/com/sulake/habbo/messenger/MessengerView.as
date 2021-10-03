package com.sulake.habbo.messenger
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView
   {
       
      
      private var var_1249:ConversationView;
      
      private var var_28:IFrameWindow;
      
      private var var_834:ConversationsTabView;
      
      private var var_490:Timer;
      
      private var var_137:HabboMessenger;
      
      private var var_614:ITextFieldWindow;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         var_137 = param1;
         var_490 = new Timer(300,1);
         var_490.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(var_28 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         var_1249.addMessage(param2);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1249.afterResize();
         this.var_834.refresh();
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = "null";
            if(_loc5_.length > _loc4_)
            {
               var_614.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      public function getTabCount() : int
      {
         return this.var_834 == null ? 7 : int(this.var_834.getTabCount());
      }
      
      public function openMessenger() : void
      {
         if(var_137.conversations.openConversations.length < 1)
         {
            return;
         }
         if(var_28 == null)
         {
            prepareContent();
            refresh(true);
            var_137.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.MESSENGER,var_28));
         }
         else
         {
            refresh(true);
            var_28.visible = true;
            var_28.activate();
         }
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = "null";
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = var_137.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         var_137.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         var_614.text = "";
         var_137.conversations.addMessageAndUpdateView(new Message(Message.const_509,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_43 || param2 != var_28)
         {
            return;
         }
         if(!this.var_490.running)
         {
            this.var_490.reset();
            this.var_490.start();
         }
      }
      
      private function prepareContent() : void
      {
         var_28 = IFrameWindow(var_137.getXmlWindow("main_window"));
         var _loc1_:IWindow = var_28.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_28.procedure = onWindow;
         var_28.title.color = 4294623744;
         var_28.title.textColor = 4287851525;
         var_834 = new ConversationsTabView(var_137,var_28);
         var_834.refresh();
         var_614 = ITextFieldWindow(var_28.findChildByName("message_input"));
         var_614.addEventListener(WindowKeyboardEvent.const_127,onMessageInput);
         var_1249 = new ConversationView(var_137,var_28);
         var_28.scaler.setParamFlag(HabboWindowParam.const_507,false);
         var_28.scaler.setParamFlag(HabboWindowParam.const_881,true);
      }
      
      public function isMessengerOpen() : Boolean
      {
         return var_28 != null && false;
      }
      
      public function refresh(param1:Boolean) : void
      {
         if(var_28 == null)
         {
            return;
         }
         var _loc2_:Conversation = var_137.conversations.findSelectedConversation();
         var_28.caption = _loc2_ == null ? "" : _loc2_.name;
         var_834.refresh();
         var_1249.refresh();
         if(var_137.conversations.openConversations.length < 1)
         {
            var_28.visible = false;
            var_137.setHabboToolbarIcon(false,false);
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         var_28.visible = false;
      }
      
      public function close() : void
      {
         if(var_28 != null)
         {
            var_28.visible = false;
         }
      }
   }
}
