package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class UserInfoFrameCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_724:UserInfoCtrl;
      
      private var _disposed:Boolean;
      
      private var _userId:int;
      
      private var var_59:IFrameWindow;
      
      private var var_57:ModerationManager;
      
      public function UserInfoFrameCtrl(param1:ModerationManager, param2:int)
      {
         super();
         var_57 = param1;
         _userId = param2;
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
         if(var_724 != null)
         {
            var_724.dispose();
            var_724 = null;
         }
         var_57 = null;
      }
      
      public function getId() : String
      {
         return "" + _userId;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1239;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function show() : void
      {
         var_59 = IFrameWindow(var_57.getXmlWindow("user_info_frame"));
         var_59.caption = "User Info";
         var _loc1_:IWindow = var_59.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_724 = new UserInfoCtrl(var_59,var_57,"",true);
         var_724.load(var_59.content,_userId);
         var_59.visible = true;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_59;
      }
   }
}
