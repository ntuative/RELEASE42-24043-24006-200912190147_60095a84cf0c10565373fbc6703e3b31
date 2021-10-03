package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_729:int = -1;
      
      public static const const_817:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1907:int = -1;
      
      private var var_89:int = 0;
      
      private var var_1180:int = 1;
      
      private var var_794:int = 1;
      
      private var var_1908:Boolean = false;
      
      private var var_1906:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_89 = param2;
         _y = param3;
         var_1908 = param5;
         if(param4 < 0)
         {
            param4 = const_729;
         }
         var_794 = param4;
         var_1180 = param4;
         if(param6 >= 0)
         {
            var_1907 = param6;
            var_1906 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_794 > 0 && param1 > var_794)
         {
            param1 = var_794;
         }
         var_1180 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_794;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1906;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_794 < 0)
         {
            return const_729;
         }
         return var_1180;
      }
      
      public function get activeSequence() : int
      {
         return var_1907;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1908;
      }
      
      public function get x() : int
      {
         return var_89;
      }
   }
}
