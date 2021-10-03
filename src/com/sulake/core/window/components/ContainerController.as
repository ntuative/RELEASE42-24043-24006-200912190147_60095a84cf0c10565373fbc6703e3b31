package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.Iterator;
   import flash.geom.Rectangle;
   
   public class ContainerController extends WindowController implements IWindowContainer
   {
       
      
      public function ContainerController(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:IWindow, param9:Function = null, param10:Array = null, param11:Array = null, param12:uint = 0)
      {
         var_308 = false;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
      }
      
      override public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_30)
         {
            var_30 = new GraphicContext("GC {" + _name + "}",!!testParamFlag(WindowParam.const_32) ? 0 : uint(GraphicContext.const_726),var_22);
            var_30.visible = var_319;
         }
         return var_30;
      }
      
      public function get iterator() : IIterator
      {
         return new Iterator(this);
      }
   }
}
