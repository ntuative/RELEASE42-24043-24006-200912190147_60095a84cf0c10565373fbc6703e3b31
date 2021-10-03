package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1719:int;
      
      private var var_1718:String;
      
      private var var_1410:IActionDefinition;
      
      private var var_1717:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1714:String;
      
      private var var_1716:String;
      
      private var var_1715:Boolean;
      
      private var var_1713:ColorTransform;
      
      private var var_1712:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1718 = param1;
         var_1714 = param2;
         var_1719 = param3;
         _color = param4;
         _frames = param5;
         var_1410 = param6;
         var_1715 = param7;
         var_1712 = param8;
         var_1716 = param9;
         var_1717 = param10;
         var_1713 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1715;
      }
      
      public function get partType() : String
      {
         return var_1714;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1712;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1717;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1719;
      }
      
      public function get flippedPartType() : String
      {
         return var_1716;
      }
      
      public function get bodyPartId() : String
      {
         return var_1718;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1410;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1713;
      }
   }
}
