package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1112:String;
      
      private var _disposed:Boolean;
      
      private var var_1382:String;
      
      private var var_1113:int;
      
      private var var_57:ModerationManager;
      
      private var var_764:IDropMenuWindow;
      
      private var var_372:ITextFieldWindow;
      
      private var var_59:IFrameWindow;
      
      private var var_304:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         var_57 = param1;
         var_1113 = param2;
         var_1382 = param3;
         var_1112 = param4;
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
      
      public function getFrame() : IFrameWindow
      {
         return var_59;
      }
      
      public function getId() : String
      {
         return var_1382;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_304 || false)
         {
            var_57.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var_57.connection.send(new ModMessageMessageComposer(var_1113,var_372.text,var_1112));
         this.dispose();
      }
      
      public function show() : void
      {
         var_59 = IFrameWindow(var_57.getXmlWindow("send_msgs"));
         var_59.caption = "Msg To: " + var_1382;
         var_59.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_372 = ITextFieldWindow(var_59.findChildByName("message_input"));
         var_372.procedure = onInputClick;
         var_764 = IDropMenuWindow(var_59.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_764);
         var_764.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_59.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_59.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + var_57.initMsg.messageTemplates.length);
         param1.populate(var_57.initMsg.messageTemplates);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_59 != null)
         {
            var_59.destroy();
            var_59 = null;
         }
         var_764 = null;
         var_372 = null;
         var_57 = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_51)
         {
            return;
         }
         var _loc3_:String = var_57.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_304 = false;
            var_372.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1156;
      }
   }
}
