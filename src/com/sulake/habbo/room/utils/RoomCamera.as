package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_336:Number = 0.5;
      
      private static const const_746:int = 3;
      
      private static const const_1046:Number = 1;
       
      
      private var var_1784:Boolean = false;
      
      private var var_1785:Boolean = false;
      
      private var var_917:int = 0;
      
      private var var_252:Vector3d = null;
      
      private var var_1782:int = 0;
      
      private var var_1789:int = 0;
      
      private var var_1786:Boolean = false;
      
      private var var_1781:int = -2;
      
      private var var_1788:Boolean = false;
      
      private var var_1787:int = 0;
      
      private var var_1783:int = -1;
      
      private var var_375:Vector3d = null;
      
      private var var_1780:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1782;
      }
      
      public function get targetId() : int
      {
         return var_1783;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1787 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1782 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1784 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1783 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1785 = param1;
      }
      
      public function dispose() : void
      {
         var_375 = null;
         var_252 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_375 == null)
         {
            var_375 = new Vector3d();
         }
         var_375.assign(param1);
         var_917 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1781;
      }
      
      public function get screenHt() : int
      {
         return var_1780;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1789 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_252;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1780 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1787;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1784;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1785;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_375 != null && var_252 != null)
         {
            ++var_917;
            _loc2_ = Vector3d.dif(var_375,var_252);
            if(_loc2_.length <= const_336)
            {
               var_252 = var_375;
               var_375 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_336 * (const_746 + 1))
               {
                  _loc2_.mul(const_336);
               }
               else if(var_917 <= const_746)
               {
                  _loc2_.mul(const_336);
               }
               else
               {
                  _loc2_.mul(const_1046);
               }
               var_252 = Vector3d.sum(var_252,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1786 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1789;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1788 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1781 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_252 != null)
         {
            return;
         }
         var_252 = new Vector3d();
         var_252.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1786;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1788;
      }
   }
}
