package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_577:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_592:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_250:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1372:Point;
      
      private var var_1373:Rectangle;
      
      private var var_191:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1373 = param2;
         var_1372 = param3;
         var_191 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1373 != null)
         {
            return var_1373.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_191;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1372 != null)
         {
            return var_1372.clone();
         }
         return null;
      }
   }
}
