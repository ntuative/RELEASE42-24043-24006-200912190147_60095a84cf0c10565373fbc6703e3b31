package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1695:int;
      
      private var var_1688:int;
      
      private var var_1696:int;
      
      private var _type:int;
      
      private var var_1230:int = -1;
      
      private var var_1692:int;
      
      private var _nutrition:int;
      
      private var var_1690:int;
      
      private var _energy:int;
      
      private var var_1689:int;
      
      private var var_1687:int;
      
      private var var_1691:int;
      
      private var var_1693:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1694:Boolean;
      
      private var _name:String = "";
      
      private var var_1553:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_1694;
      }
      
      public function get level() : int
      {
         return var_1695;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_1690;
      }
      
      public function get id() : int
      {
         return var_1230;
      }
      
      public function get nutritionMax() : int
      {
         return var_1696;
      }
      
      public function get ownerId() : int
      {
         return var_1553;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1230 = param1.id;
         _type = param1.petType;
         var_1689 = param1.petRace;
         _image = param1.image;
         var_1694 = param1.isOwnPet;
         var_1553 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1695 = param1.level;
         var_1692 = param1.levelMax;
         var_1688 = param1.experience;
         var_1690 = param1.experienceMax;
         _energy = param1.energy;
         var_1687 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_1696 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_1691 = param1.roomIndex;
         var_1693 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_1691;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_1687;
      }
      
      public function get levelMax() : int
      {
         return var_1692;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_1689;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1688;
      }
      
      public function get age() : int
      {
         return var_1693;
      }
   }
}
