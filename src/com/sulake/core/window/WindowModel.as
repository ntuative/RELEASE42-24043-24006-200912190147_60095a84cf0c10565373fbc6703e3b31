package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_354:Rectangle;
      
      protected var var_29:uint;
      
      protected var var_148:Rectangle;
      
      protected var _type:uint;
      
      protected var var_702:Boolean;
      
      protected var var_149:Rectangle;
      
      protected var var_417:uint;
      
      protected var _state:uint;
      
      protected var var_86:uint;
      
      protected var var_319:Boolean;
      
      protected var var_239:String;
      
      protected var var_81:WindowRectLimits;
      
      protected var _alphaColor:uint;
      
      protected var var_5:Boolean;
      
      protected var var_374:Number;
      
      protected var var_60:Rectangle;
      
      protected var _id:uint;
      
      protected var _name:String;
      
      protected var var_22:Rectangle;
      
      protected var _context:WindowContext;
      
      protected var var_578:Array;
      
      public function WindowModel(param1:uint, param2:String, param3:String, param4:uint, param5:uint, param6:uint, param7:WindowContext, param8:Rectangle, param9:Array = null)
      {
         super();
         _id = param1;
         _name = param2;
         _type = param4;
         var_29 = param6;
         _state = WindowState.const_79;
         var_86 = param5;
         var_578 = param9 == null ? new Array() : param9;
         var_239 = param3;
         _context = param7;
         var_22 = param8.clone();
         var_354 = param8.clone();
         var_60 = param8.clone();
         var_149 = new Rectangle();
         var_148 = null;
         var_374 = 1;
         var_81 = new WindowRectLimits(this as IWindow);
         var_319 = true;
         var_702 = true;
         var_5 = false;
         var_417 = 16777215;
      }
      
      public function getMinHeight() : int
      {
         return var_81.minHeight;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_type & param2 ^ param1) == 0;
         }
         return (_type & param1) == param1;
      }
      
      public function getMinWidth() : int
      {
         return var_81.minWidth;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get param() : uint
      {
         return var_29;
      }
      
      public function get state() : uint
      {
         return _state;
      }
      
      public function getMaximizedWidth() : int
      {
         return var_148.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return var_149.height;
      }
      
      public function get limits() : IRectLimiter
      {
         return var_81;
      }
      
      public function get tags() : Array
      {
         return var_578;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_state & param2 ^ param1) == 0;
         }
         return (_state & param1) == param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_22 = null;
            _state = WindowState.const_448;
            _disposed = true;
            var_578 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get height() : int
      {
         return var_22.height;
      }
      
      public function get position() : Point
      {
         return var_22.topLeft;
      }
      
      public function get background() : Boolean
      {
         return var_5;
      }
      
      public function get context() : IWindowContext
      {
         return _context;
      }
      
      public function getMaximizedHeight() : int
      {
         return var_148.height;
      }
      
      public function get style() : uint
      {
         return var_86;
      }
      
      public function getMaxWidth() : int
      {
         return var_81.maxWidth;
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_86 & param2 ^ param1) == 0;
         }
         return (var_86 & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_29 & param2 ^ param1) == 0;
         }
         return (var_29 & param1) == param1;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return false;
      }
      
      public function get type() : uint
      {
         return _type;
      }
      
      public function get clipping() : Boolean
      {
         return var_702;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_81.minWidth = param1;
         return _loc2_;
      }
      
      public function get width() : int
      {
         return var_22.width;
      }
      
      public function hasMinHeight() : Boolean
      {
         return false;
      }
      
      public function get blend() : Number
      {
         return var_374;
      }
      
      public function getInitialHeight() : int
      {
         return var_354.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return var_149.width;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_81.minHeight = param1;
         return _loc2_;
      }
      
      public function getInitialWidth() : int
      {
         return var_354.width;
      }
      
      public function getPreviousWidth() : int
      {
         return var_60.width;
      }
      
      public function hasMinWidth() : Boolean
      {
         return false;
      }
      
      public function get color() : uint
      {
         return var_417;
      }
      
      public function get caption() : String
      {
         return var_239;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_81.maxHeight = param1;
         return _loc2_;
      }
      
      public function get rectangle() : Rectangle
      {
         return var_22;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_81.maxWidth = param1;
         return _loc2_;
      }
      
      public function get visible() : Boolean
      {
         return var_319;
      }
      
      public function getMaxHeight() : int
      {
         return var_81.maxHeight;
      }
      
      public function get x() : int
      {
         return var_22.x;
      }
      
      public function get y() : int
      {
         return var_22.y;
      }
      
      public function getPreviousHeight() : int
      {
         return var_60.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return false;
      }
   }
}
