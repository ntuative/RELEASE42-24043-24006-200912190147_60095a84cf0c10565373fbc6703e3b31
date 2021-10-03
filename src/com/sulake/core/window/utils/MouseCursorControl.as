package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl extends Sprite implements IMouseCursor, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _type:uint;
      
      private var var_1369:Dictionary;
      
      private var var_319:Boolean;
      
      private var var_1370:DisplayObject;
      
      private var var_201:Stage;
      
      public function MouseCursorControl(param1:Stage)
      {
         super();
         _type = MouseCursorType.const_39;
         var_201 = param1;
         var_319 = true;
         var_1369 = new Dictionary();
         param1.addChild(this);
         param1.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
         param1.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
         param1.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
         param1.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
      }
      
      override public function get visible() : Boolean
      {
         return var_319;
      }
      
      private function onStageMouseLeave(param1:Event) : void
      {
         if(_type != MouseCursorType.const_39)
         {
            Mouse.hide();
            var_319 = false;
         }
      }
      
      public function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1369[param1] = param2;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_201.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
            var_201.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
            var_201.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
            var_201.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         var_319 = param1;
         if(var_319)
         {
            Mouse.show();
         }
         else
         {
            Mouse.hide();
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         x = param1.stageX - 2;
         y = param1.stageY;
         if(_type == MouseCursorType.const_39)
         {
            var_319 = false;
            Mouse.show();
         }
         else
         {
            var_319 = true;
            Mouse.hide();
         }
      }
      
      public function get type() : uint
      {
         return _type;
      }
      
      public function set type(param1:uint) : void
      {
         _type = param1;
         var_1370 = var_1369[_type];
         if(numChildren > 0)
         {
            removeChildAt(0);
         }
         if(var_1370)
         {
            addChild(var_1370);
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
      }
   }
}
