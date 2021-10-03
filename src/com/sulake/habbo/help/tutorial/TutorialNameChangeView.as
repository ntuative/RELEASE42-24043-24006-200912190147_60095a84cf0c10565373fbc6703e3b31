package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import flash.display.BitmapData;
   
   public class TutorialNameChangeView implements ITutorialUIView
   {
      
      private static var var_1438:uint = 13232628;
      
      private static var var_1892:uint = 11129827;
       
      
      private var _window:IWindowContainer;
      
      private var var_381:String;
      
      private var var_57:TutorialUI;
      
      private var var_255:IBorderWindow;
      
      private var var_786:NameSuggestionListRenderer;
      
      private var var_785:Boolean;
      
      private var var_1174:Boolean;
      
      public function TutorialNameChangeView(param1:IItemListWindow, param2:TutorialUI)
      {
         super();
         var_57 = param2;
         var_57.localization.registerParameter("help.tutorial.button.nameok","name",var_57.help.ownUserName);
         var _loc3_:IWindowContainer = param2.buildXmlWindow("tutorial_change_name") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.procedure = windowProcedure;
         _window = _loc3_;
         var_785 = true;
         param1.addListItem(_loc3_ as IWindow);
         setButtonStateNormal(_loc3_.findChildByName("button_name_check"));
         setNormalView();
         var_57.prepareForTutorial();
      }
      
      public function setNameAvailableView() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var_57.localization.registerParameter("help.tutorial.name.available","name",var_381);
         _loc1_.text = var_57.localization.getKey("help.tutorial.name.available");
         var _loc2_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = var_381;
         var _loc3_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = false;
         var_785 = false;
      }
      
      private function nameOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1438;
         }
      }
      
      private function setButtonStateNormal(param1:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:IBitmapWrapperWindow = param1 as IBitmapWrapperWindow;
         switch(param1.name)
         {
            case "button_name_check":
               _loc3_ = BitmapDataAsset(var_57.assets.getAssetByName("tutorial_button_name_check"));
         }
         if(_loc2_ != null && _loc3_ != null && _loc3_.content != null)
         {
            _loc2_.bitmap = (_loc3_.content as BitmapData).clone();
         }
      }
      
      private function nameSelected(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         setNormalView();
         var _loc4_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.text = _loc3_;
      }
      
      private function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(_window == null)
         {
            return;
         }
         _loc3_ = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "input":
                  if(!var_785)
                  {
                     return;
                  }
                  _loc3_.text = "";
                  var_785 = false;
                  break;
               case "button_ok":
                  _loc4_ = _loc3_.text;
                  if(_loc3_.text.length < 1)
                  {
                     return;
                  }
                  if(var_381 != _loc4_)
                  {
                     var_1174 = true;
                     var_57.checkName(_loc4_);
                  }
                  else
                  {
                     showConfirmationView(true);
                  }
                  break;
               case "button_cancel":
                  var_57.showView(TutorialUI.const_80);
                  break;
               case "button_usecurrent":
                  var_381 = var_57.help.ownUserName;
                  showConfirmationView(true);
                  break;
               case "button_name_check":
                  if(_loc3_.text.length < 1)
                  {
                     return;
                  }
                  var_57.checkName(_loc3_.text);
                  break;
            }
         }
         if(param2.name == "button_name_check")
         {
            if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
            {
               setButtonStateOver(param2);
            }
            else if(param1.type == WindowMouseEvent.const_28)
            {
               setButtonStateNormal(param2);
            }
         }
      }
      
      private function showConfirmationView(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(_window == null)
         {
            return;
         }
         if(param1)
         {
            var_57.localization.registerParameter("help.tutorial.name.confirmation","name",var_381);
         }
         if(var_255 == null)
         {
            var_255 = var_57.buildXmlWindow("tutorial_change_name_confirmation") as IBorderWindow;
            if(var_255 == null)
            {
               return;
            }
            _loc2_ = _window.parent as IWindowContainer;
            if(_loc2_ == null)
            {
               var_255.dispose();
               var_255 = null;
               return;
            }
            _loc2_.addChild(var_255);
            var_255.procedure = confirmationViewEventHandler;
         }
         _window.visible = !param1;
         var_255.visible = param1;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_786 != null)
         {
            var_786.dispose();
            var_786 = null;
         }
         if(var_255 != null)
         {
            var_255.dispose();
            var_255 = null;
         }
      }
      
      public function get id() : String
      {
         return TutorialUI.const_240;
      }
      
      public function set checkedName(param1:String) : void
      {
         var_381 = param1;
         if(var_1174)
         {
            showConfirmationView(true);
            return;
         }
         setNameAvailableView();
      }
      
      public function setNameNotAvailableView(param1:int, param2:String, param3:Array) : void
      {
         var _loc8_:* = null;
         var_1174 = false;
         var_381 = null;
         if(_window == null)
         {
            return;
         }
         var _loc4_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc4_ == null)
         {
            return;
         }
         switch(param1)
         {
            case ChangeUserNameResultMessageEvent.var_1035:
               var_57.localization.registerParameter("help.tutorial.name.taken","name",param2);
               _loc4_.text = var_57.localization.getKey("help.tutorial.name.taken");
               break;
            case ChangeUserNameResultMessageEvent.var_1036:
               var_57.localization.registerParameter("help.tutorial.name.invalid","name",param2);
               _loc4_.text = var_57.localization.getKey("help.tutorial.name.invalid");
               break;
            case ChangeUserNameResultMessageEvent.var_1034:
               break;
            case ChangeUserNameResultMessageEvent.var_1038:
               _loc4_.text = var_57.localization.getKey("help.tutorial.name.long");
               break;
            case ChangeUserNameResultMessageEvent.var_1033:
               _loc4_.text = var_57.localization.getKey("help.tutorial.name.short");
         }
         var _loc5_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.visible = true;
         var_786 = new NameSuggestionListRenderer(var_57);
         var _loc6_:int = var_786.render(param3,_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.numChildren)
         {
            _loc8_ = _loc5_.getChildAt(_loc7_);
            _loc8_.color = var_1438;
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,nameSelected);
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,nameOver);
            _loc8_.addEventListener(WindowMouseEvent.const_28,nameOut);
            _loc7_++;
         }
      }
      
      private function confirmationViewEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "button_ok":
               var_57.changeName(var_381);
               break;
            case "button_cancel":
               showConfirmationView(false);
         }
      }
      
      private function setButtonStateOver(param1:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:IBitmapWrapperWindow = param1 as IBitmapWrapperWindow;
         switch(param1.name)
         {
            case "button_name_check":
               _loc3_ = BitmapDataAsset(var_57.assets.getAssetByName("tutorial_button_name_check_over"));
         }
         if(_loc2_ != null && _loc3_ != null && _loc3_.content != null)
         {
            _loc2_.bitmap = (_loc3_.content as BitmapData).clone();
         }
      }
      
      public function setNormalView() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.text = var_57.localization.getKey("help.tutorial.name.info");
         var _loc2_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = false;
      }
      
      private function nameOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1892;
         }
      }
   }
}
