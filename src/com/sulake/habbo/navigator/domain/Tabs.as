package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_517:int = 6;
      
      public static const const_186:int = 5;
      
      public static const const_647:int = 2;
      
      public static const const_322:int = 9;
      
      public static const const_243:int = 4;
      
      public static const const_242:int = 2;
      
      public static const const_583:int = 4;
      
      public static const const_211:int = 8;
      
      public static const const_523:int = 7;
      
      public static const const_251:int = 3;
      
      public static const const_281:int = 1;
      
      public static const const_213:int = 5;
      
      public static const const_414:int = 12;
      
      public static const const_313:int = 1;
      
      public static const const_452:int = 11;
      
      public static const const_626:int = 3;
      
      public static const const_1450:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_386:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_386 = new Array();
         var_386.push(new Tab(_navigator,const_281,const_414,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_398));
         var_386.push(new Tab(_navigator,const_242,const_313,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_398));
         var_386.push(new Tab(_navigator,const_243,const_452,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_579));
         var_386.push(new Tab(_navigator,const_251,const_186,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_398));
         var_386.push(new Tab(_navigator,const_213,const_211,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_570));
         setSelectedTab(const_281);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_386)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_386)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_386)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_243;
      }
      
      public function get tabs() : Array
      {
         return var_386;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
