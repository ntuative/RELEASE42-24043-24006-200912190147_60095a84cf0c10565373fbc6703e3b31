package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_373:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_639:int = 0;
      
      public static const const_931:int = 2;
      
      public static const const_867:int = 1;
      
      public static const const_649:Boolean = false;
      
      public static const const_634:String = "";
      
      public static const const_375:int = 0;
      
      public static const const_420:int = 0;
      
      public static const const_389:int = 0;
       
      
      private var var_1983:int = 0;
      
      private var var_1608:String = "";
      
      private var var_1483:int = 0;
      
      private var var_1980:int = 0;
      
      private var var_1982:Number = 0;
      
      private var var_1609:int = 255;
      
      private var var_1981:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1983;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1483 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1982;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1980 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1983 = param1;
      }
      
      public function get tag() : String
      {
         return var_1608;
      }
      
      public function get alpha() : int
      {
         return var_1609;
      }
      
      public function get ink() : int
      {
         return var_1483;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1982 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1980;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1981 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1981;
      }
      
      public function set tag(param1:String) : void
      {
         var_1608 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1609 = param1;
      }
   }
}
