package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1040:int = 31;
      
      private static const const_1041:int = 32;
      
      private static const const_745:int = 10;
      
      private static const const_492:int = 20;
       
      
      private var var_515:Boolean = false;
      
      private var var_234:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_234 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_515 = true;
            var_234 = new Array();
            var_234.push(const_1040);
            var_234.push(const_1041);
            return;
         }
         if(param1 > 0 && param1 <= const_745)
         {
            if(var_515)
            {
               var_515 = false;
               var_234 = new Array();
               var_234.push(const_745 + param1);
               var_234.push(const_492 + param1);
               var_234.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(false)
            {
               super.setAnimation(var_234.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
