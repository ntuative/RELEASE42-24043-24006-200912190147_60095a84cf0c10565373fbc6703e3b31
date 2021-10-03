package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1066:int = 1;
      
      private static const const_1041:int = 3;
      
      private static const const_1065:int = 2;
      
      private static const const_1067:int = 15;
       
      
      private var var_803:int;
      
      private var var_234:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_234 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1065)
         {
            var_234 = new Array();
            var_234.push(const_1066);
            var_803 = const_1067;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_803 > 0)
         {
            --var_803;
         }
         if(var_803 == 0)
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
