package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   
   public class DisplayObjectWrapperController extends WindowController implements IDisplayObjectWrapper
   {
       
      
      public function DisplayObjectWrapperController(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:IWindow, param9:Function, param10:Array = null, param11:Array = null, param12:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
         var_308 = false;
      }
      
      public function getDisplayObject() : DisplayObject
      {
         return IGraphicContextHost(this).getGraphicContext(true).getDisplayObject();
      }
      
      override public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_30)
         {
            var_30 = new GraphicContext("GC {" + _name + "}",GraphicContext.const_688,var_22);
         }
         return var_30;
      }
      
      public function setDisplayObject(param1:DisplayObject) : void
      {
         IGraphicContextHost(this).getGraphicContext(true).setDisplayObject(param1);
      }
   }
}
