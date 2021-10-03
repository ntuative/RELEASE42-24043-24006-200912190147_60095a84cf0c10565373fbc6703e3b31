package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1638:Date;
      
      private var var_1080:Boolean = false;
      
      private var _type:int;
      
      private var var_356:BitmapData;
      
      private var var_266:Boolean = false;
      
      private var var_1167:int;
      
      private var var_513:int = 1;
      
      private var var_884:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_356;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_513;
         if(var_513 < 0)
         {
            var_513 = 0;
         }
         var_884 = var_1167;
         var_266 = false;
         var_1080 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_884 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_266;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_356 = param1;
      }
      
      public function get duration() : int
      {
         return var_1167;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1080;
      }
      
      public function get effectsInInventory() : int
      {
         return var_513;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_356;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_266)
         {
            var_1638 = new Date();
         }
         var_266 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_513 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_266)
         {
            _loc1_ = var_884 - (new Date().valueOf() - var_1638.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_884;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1080 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1167 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
