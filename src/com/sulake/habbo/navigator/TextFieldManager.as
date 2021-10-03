package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var var_2228:Boolean;
      
      private var var_1499:int;
      
      private var var_2229:String = "";
      
      private var var_80:ITextFieldWindow;
      
      private var var_2230:uint;
      
      private var _orgTextBackgroundColor:uint;
      
      private var _navigator:HabboNavigator;
      
      private var var_1096:String = "";
      
      private var var_161:IWindowContainer;
      
      private var var_304:Boolean;
      
      private var var_1263:Function;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         _navigator = param1;
         var_80 = param2;
         var_1499 = param3;
         var_1263 = param4;
         if(param5 != null)
         {
            var_304 = true;
            var_1096 = param5;
            var_80.text = param5;
         }
         Util.setProcDirectly(var_80,onInputClick);
         var_80.addEventListener(WindowKeyboardEvent.const_127,checkEnterPress);
         var_80.addEventListener(WindowEvent.const_193,checkMaxLen);
         this.var_2228 = var_80.textBackground;
         this._orgTextBackgroundColor = var_80.textBackgroundColor;
         this.var_2230 = var_80.textColor;
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(var_1263 != null)
            {
               var_1263();
            }
         }
      }
      
      public function goBackToInitialState() : void
      {
         clearErrors();
         if(var_1096 != null)
         {
            var_80.text = var_1096;
            var_304 = true;
         }
         else
         {
            var_80.text = "";
            var_304 = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return var_80;
      }
      
      public function restoreBackground() : void
      {
         var_80.textBackground = this.var_2228;
         var_80.textBackgroundColor = this._orgTextBackgroundColor;
         var_80.textColor = this.var_2230;
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
         var_80.text = var_2229;
         var_304 = false;
         this.restoreBackground();
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_161 != null)
         {
            var_161.visible = false;
         }
      }
      
      public function displayError(param1:String) : void
      {
         var_80.textBackground = true;
         var_80.textBackgroundColor = 4294021019;
         var_80.textColor = 4278190080;
         if(this.var_161 == null)
         {
            this.var_161 = IWindowContainer(_navigator.getXmlWindow("nav_error_popup"));
            _navigator.refreshButton(this.var_161,"popup_arrow_down",true,null,0);
            IWindowContainer(var_80.parent).addChild(this.var_161);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_161.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         var_161.findChildByName("border").width = _loc2_.width + 15;
         var_161.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         var_80.getLocalPosition(_loc3_);
         this.var_161.x = _loc3_.x;
         this.var_161.y = _loc3_.y - this.var_161.height + 3;
         var _loc4_:IWindow = var_161.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_161.width / 2 - _loc4_.width / 2;
         var_161.x += (0 - 0) / 2;
         this.var_161.visible = true;
      }
      
      public function getText() : String
      {
         if(var_304)
         {
            return var_2229;
         }
         return var_80.text;
      }
      
      private function isInputValid() : Boolean
      {
         return !var_304 && Util.trim(getText()).length > 2;
      }
      
      public function setText(param1:String) : void
      {
         var_304 = false;
         var_80.text = param1;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!isInputValid())
         {
            displayError(param1);
            return false;
         }
         restoreBackground();
         return true;
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = "null";
         if(_loc2_.length > var_1499)
         {
            var_80.text = _loc2_.substring(0,var_1499);
         }
      }
   }
}
