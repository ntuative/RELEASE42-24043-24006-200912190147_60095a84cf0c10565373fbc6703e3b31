package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   
   public class PetVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private var var_511:String;
      
      private var var_586:int = 0;
      
      private const const_1580:int = 1;
      
      private const const_1379:int = 0;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var _isAnimating:Boolean;
      
      private const const_1034:int = 3;
      
      private var var_897:int = 0;
      
      private var var_434:int = 0;
      
      private const const_1033:int = 3;
      
      private const const_1581:int = 2;
      
      private var var_735:PetVisualizationData = null;
      
      private var var_393:Map;
      
      private var var_736:Array;
      
      public function PetVisualization()
      {
         var_736 = new Array();
         super();
         var_393 = new Map();
         _assetLibrary = new AssetLibrary("pet visualization");
         _isAnimating = false;
      }
      
      override public function update(param1:IRoomGeometry = null) : void
      {
         var _loc10_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:Boolean = false;
         var _loc23_:* = null;
         var _loc24_:* = false;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:* = null;
         var _loc35_:* = null;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:* = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:* = null;
         var _loc41_:* = null;
         var _loc42_:int = 0;
         var _loc43_:int = 0;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:int = 0;
         var _loc47_:* = null;
         var _loc48_:* = null;
         var _loc49_:int = 0;
         var _loc50_:int = 0;
         var _loc51_:* = null;
         var _loc52_:* = null;
         var _loc53_:* = null;
         var _loc54_:* = null;
         var _loc55_:int = 0;
         var _loc56_:* = null;
         var _loc57_:int = 0;
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_735 == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         var _loc4_:String = "avatar" + param1.scale.toString();
         var _loc5_:* = var_393.getValue(_loc4_) as IAvatarImage;
         var _loc6_:String = _loc3_.getString(RoomObjectVariableEnum.const_154);
         var _loc7_:Number = new Date().valueOf();
         var _loc9_:* = 0;
         var _loc11_:Number = _loc3_.getNumber(RoomObjectVariableEnum.const_972);
         if(_loc11_ > 0)
         {
            _loc16_ = getTimer() - _loc11_;
            if(_loc16_ < AvatarAction.const_813)
            {
               _loc9_ = uint(int(Math.sin(Number(_loc16_) / 0 * 0) * 255));
               _loc10_ = _loc3_.getNumber(RoomObjectVariableEnum.const_992);
               var_434 = const_1033;
            }
         }
         var _loc12_:Boolean = false;
         var _loc13_:String = _loc3_.getString(RoomObjectVariableEnum.const_231);
         switch(_loc13_)
         {
            case AvatarAction.const_814:
            case AvatarAction.const_875:
            case AvatarAction.const_858:
            case AvatarAction.const_979:
            case AvatarAction.const_942:
            case AvatarAction.const_870:
            case AvatarAction.const_971:
            case AvatarAction.const_403:
            case AvatarAction.const_410:
               _loc12_ = true;
         }
         var _loc14_:Boolean = var_276 != _loc2_.getUpdateID() || var_207 != param1.scale || var_184 != _loc3_.getUpdateID();
         var _loc15_:Boolean = _isAnimating || var_434 > 0 || _loc12_;
         if(_loc14_ || _loc15_)
         {
            _loc17_ = getTimer();
            --var_434;
            if(var_511 != _loc6_)
            {
               for each(_loc35_ in var_393.getKeys())
               {
                  var_393.remove(_loc35_);
               }
               _loc5_ = null;
            }
            if(_loc5_ == null)
            {
               _loc5_ = var_735.getAvatar(_loc6_,param1.scale);
               if(_loc5_ == null)
               {
                  return;
               }
               var_393.remove(_loc4_);
               var_393.add(_loc4_,_loc5_);
               var_511 = _loc6_;
            }
            _loc18_ = _loc2_.getDirection().x - (param1.direction.x + 135 - 22.5);
            _loc18_ = (_loc18_ % 360 + 360) % 360;
            _loc5_.setDirectionAngle(AvatarSetType.const_38,_loc18_);
            _loc19_ = _loc3_.getNumber(RoomObjectVariableEnum.const_315);
            if(isNaN(_loc19_))
            {
               _loc19_ = _loc18_;
            }
            else
            {
               _loc19_ -= param1.direction.x + 135 - 22.5;
            }
            _loc19_ = (_loc19_ % 360 + 360) % 360;
            _loc5_.setDirectionAngle(AvatarSetType.const_45,_loc19_);
            _loc5_.initActionAppends();
            _loc20_ = _loc3_.getString(RoomObjectVariableEnum.const_231);
            _loc21_ = _loc3_.getString(RoomObjectVariableEnum.const_648);
            _loc5_.appendAction(AvatarAction.const_546,_loc20_,_loc21_);
            _loc22_ = false;
            if(_loc20_ == "lay")
            {
               _loc36_ = Number(_loc21_);
               if(_loc36_ < 0)
               {
                  _loc22_ = true;
               }
            }
            _loc23_ = _loc3_.getString(RoomObjectVariableEnum.const_390);
            if(_loc23_ != null && _loc23_ != "")
            {
               _loc37_ = _loc3_.getNumber(RoomObjectVariableEnum.const_477);
               _loc38_ = 3;
               _loc39_ = _loc7_ - _loc37_;
               if(_loc39_ < _loc38_ * 1000)
               {
                  _loc5_.appendAction(AvatarAction.const_325,_loc23_);
               }
            }
            _loc24_ = _loc3_.getNumber(RoomObjectVariableEnum.const_347) > 0;
            if(_loc24_)
            {
               _loc5_.appendAction(AvatarAction.const_608);
            }
            _loc5_.endActionAppends();
            ++var_586;
            ++var_897;
            if(var_897 > 1)
            {
               _loc5_.updateAnimationByFrames(1);
               var_897 = 0;
            }
            _loc25_ = _loc5_.getImage(AvatarSetType.const_38);
            if(_loc25_ == null)
            {
               return;
            }
            _isAnimating = _loc5_.isAnimating();
            _loc26_ = _loc5_.avatarSpriteData;
            if(_loc26_ != null)
            {
            }
            _loc27_ = "avatar " + param1.scale;
            _loc28_ = _assetLibrary.getAssetByName(_loc27_) as BitmapDataAsset;
            if(_loc28_ == null)
            {
               _loc28_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
               _assetLibrary.setAsset(_loc27_,_loc28_);
            }
            if(_loc28_.content != null)
            {
               _loc40_ = _loc28_.content as BitmapData;
               if(_loc40_ != null && _loc40_ != _loc25_)
               {
                  _loc40_.dispose();
               }
            }
            _loc28_.setUnknownContent(_loc25_.clone());
            _loc29_ = _loc5_.getSprites().length + const_1034;
            if(_loc29_ != spriteCount)
            {
               createSprites(_loc29_);
            }
            _loc31_ = _loc5_.getCanvasOffsets();
            if(_loc31_ == null || _loc31_.length < 3)
            {
               _loc31_ = new Array(0,0,0);
            }
            _loc32_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc32_ = Math.min(param1.scale / 2.75,0);
            }
            _loc30_ = getSprite(const_1379);
            if(_loc30_ != null)
            {
               _loc30_.asset = _loc28_;
               _loc30_.offsetX = -1 * param1.scale / 2 + _loc31_[0];
               _loc30_.offsetY = -_loc25_.height + param1.scale / 4 + _loc31_[1] + _loc32_;
               if(!_loc22_)
               {
               }
            }
            _loc33_ = const_1034;
            for each(_loc34_ in _loc5_.getSprites())
            {
               _loc30_ = getSprite(_loc33_);
               if(_loc30_ != null)
               {
                  _loc41_ = _loc5_.getLayerData(_loc34_);
                  _loc42_ = 0;
                  _loc43_ = _loc34_.getDirectionOffsetX(_loc5_.getDirection());
                  _loc44_ = _loc34_.getDirectionOffsetY(_loc5_.getDirection());
                  _loc45_ = _loc34_.getDirectionOffsetZ(_loc5_.getDirection());
                  _loc46_ = 0;
                  if(_loc34_.hasDirections)
                  {
                     _loc46_ = _loc5_.getDirection();
                  }
                  if(_loc41_ != null)
                  {
                     _loc42_ = _loc41_.animationFrame;
                     _loc43_ += _loc41_.dx;
                     _loc44_ += _loc41_.dy;
                     _loc46_ += _loc41_.directionOffset;
                  }
                  if(param1.scale < 48)
                  {
                     _loc43_ /= 2;
                     _loc44_ /= 2;
                  }
                  if(_loc46_ < 0)
                  {
                     _loc46_ += 8;
                  }
                  if(_loc46_ > 7)
                  {
                     _loc46_ -= 8;
                  }
                  _loc47_ = _loc5_.getScale() + "_" + _loc34_.member + "_" + _loc46_ + "_" + _loc42_;
                  _loc48_ = _loc5_.getAsset(_loc47_);
                  if(_loc48_ != null)
                  {
                     _loc30_.asset = _loc48_;
                     _loc30_.offsetX = -1 * _loc48_.offset.x - param1.scale / 2 + _loc43_;
                     _loc30_.offsetY = -1 * _loc48_.offset.y + _loc44_;
                     _loc30_.relativeDepth = -0.01 - 0.1 * _loc33_ * _loc45_;
                     if(_loc34_.ink == 33)
                     {
                        _loc30_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc30_.blendMode = BlendMode.NORMAL;
                     }
                     _loc33_++;
                  }
               }
            }
            if(_loc20_ == "mv" || _loc20_ == "std")
            {
               _loc29_ = _loc5_.getSprites().length + const_1034;
               if(_loc29_ != spriteCount)
               {
                  createSprites(_loc29_);
               }
               _loc30_ = getSprite(const_1580);
               _loc28_ = null;
               _loc27_ = null;
               _loc49_ = 0;
               _loc50_ = 0;
               switch(param1.scale)
               {
                  case 32:
                     _loc27_ = "sh_std_sd_1_0_0";
                     _loc49_ = -8;
                     _loc50_ = -3;
                     break;
                  case 64:
                     _loc27_ = "h_std_sd_1_0_0";
                     _loc49_ = -17;
                     _loc50_ = -7;
               }
               if(_loc27_ != null)
               {
                  _loc28_ = _loc5_.getAsset(_loc27_);
               }
               if(_loc28_ != null)
               {
                  _loc30_.asset = _loc28_;
                  _loc30_.offsetX = _loc49_;
                  _loc30_.offsetY = _loc50_;
                  _loc30_.alpha = 50;
                  _loc30_.relativeDepth = 1;
               }
            }
            _loc30_ = getSprite(const_1581);
            if(_loc9_ > 0)
            {
               _loc28_ = null;
               _loc28_ = var_735.getAvatarRendererAsset("pet_experience_bubble_png") as BitmapDataAsset;
               if(_loc28_ != null)
               {
                  _loc51_ = _loc28_.content as BitmapData;
                  _loc52_ = new TextFormat();
                  _loc52_.font = "Volter";
                  _loc52_.color = 16777215;
                  _loc52_.size = 9;
                  _loc53_ = new TextField();
                  _loc53_.embedFonts = true;
                  _loc53_.width = 30;
                  _loc53_.height = 12;
                  _loc53_.background = true;
                  _loc53_.backgroundColor = 3871388928;
                  _loc53_.defaultTextFormat = _loc52_;
                  _loc53_.text = "+" + _loc10_;
                  _loc54_ = new Matrix();
                  _loc54_.translate(15,19);
                  _loc51_.draw(_loc53_,_loc54_);
                  _loc30_.asset = _loc28_;
                  _loc30_.offsetX = -20;
                  _loc30_.offsetY = -80;
                  _loc30_.alpha = _loc9_;
                  _loc30_.visible = true;
               }
            }
            else
            {
               _loc30_.visible = false;
            }
            var_276 = _loc2_.getUpdateID();
            var_184 = _loc3_.getUpdateID();
            var_207 = param1.scale;
            var_736.push(getTimer() - _loc17_);
            if(false)
            {
               _loc55_ = 0;
               _loc56_ = "[";
               for each(_loc57_ in var_736)
               {
                  _loc55_ += _loc57_;
                  _loc56_ += "," + _loc57_;
               }
               _loc56_ += "]";
               var_736 = new Array();
            }
         }
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_735 = param1 as PetVisualizationData;
         createSprites(4);
         return true;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(var_393 != null)
         {
            _loc1_ = var_393.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_393.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         var_393.dispose();
         if(_assetLibrary != null)
         {
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         var_735 = null;
      }
   }
}
