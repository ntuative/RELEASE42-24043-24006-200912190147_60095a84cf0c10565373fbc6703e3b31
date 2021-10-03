package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_650:int = 8;
      
      public static const const_1485:int = 10;
      
      public static const const_1310:int = 6;
      
      private static var var_929:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1326:int = 0;
      
      public static const const_1510:int = 1;
      
      public static const const_1554:int = 2;
      
      public static const const_1466:int = 3;
      
      public static const const_1476:int = 4;
      
      public static const const_1529:int = 5;
      
      public static const const_1535:int = 9;
      
      public static const const_1562:int = 7;
       
      
      private var var_173:uint = 0;
      
      private var var_930:uint = 0;
      
      private var var_635:Date;
      
      private var var_1838:int = -1;
      
      private var parseFunc:Function;
      
      private var var_445:Boolean = false;
      
      private var var_2205:int = -1;
      
      private var var_1156:uint = 0;
      
      private var var_1840:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_770:uint;
      
      private var var_33:ByteArray;
      
      private var var_634:uint;
      
      private var var_1422:Boolean = false;
      
      private var var_2206:int = -1;
      
      private var var_1424:String = "2.0";
      
      private var var_172:Boolean = false;
      
      private var var_1839:Boolean = false;
      
      private var var_329:String;
      
      private var var_533:uint = 0;
      
      private var var_1155:int = 0;
      
      private var var_378:String = "";
      
      private var var_636:int = 8;
      
      private var var_1423:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_329 = param1;
         _extraFields = new Dictionary();
         var_33 = new ByteArray();
         var_33.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_533;
      }
      
      public function set filename(param1:String) : void
      {
         var_378 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_172 && false)
         {
            var_33.position = 0;
            if(var_929)
            {
               var_33.uncompress.apply(var_33,["deflate"]);
            }
            else
            {
               var_33.uncompress();
            }
            var_33.position = 0;
            var_172 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_378;
      }
      
      public function get date() : Date
      {
         return var_635;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1423)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_173 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_173)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1424;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_172)
         {
            uncompress();
         }
         var_33.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_33.readUTFBytes(var_33.bytesAvailable);
         }
         else
         {
            _loc3_ = var_33.readMultiByte(var_33.bytesAvailable,param2);
         }
         var_33.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_636 === const_650 && !var_1422)
         {
            if(var_929)
            {
               param1.readBytes(var_33,0,var_173);
            }
            else
            {
               if(!var_445)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_33.writeByte(120);
               _loc2_ = uint(~var_1838 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_33.writeByte(_loc2_);
               param1.readBytes(var_33,2,var_173);
               var_33.position = var_33.length;
               var_33.writeUnsignedInt(var_770);
            }
            var_172 = true;
         }
         else
         {
            if(var_636 != const_1326)
            {
               throw new Error("Compression method " + var_636 + " is not supported.");
            }
            param1.readBytes(var_33,0,var_173);
            var_172 = false;
         }
         var_33.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_930 + var_1156 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_33.length = 0;
         var_33.position = 0;
         var_172 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_33.writeUTFBytes(param1);
            }
            else
            {
               var_33.writeMultiByte(param1,param2);
            }
            var_634 = ChecksumUtil.CRC32(var_33);
            var_445 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_635 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1155 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1155 << 8 | 20);
         param1.writeShort(var_329 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_650);
         var _loc5_:Date = var_635 != null ? var_635 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_634);
         param1.writeUnsignedInt(var_173);
         param1.writeUnsignedInt(var_533);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_329 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_378);
         }
         else
         {
            _loc8_.writeMultiByte(var_378,var_329);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_445)
            {
               _loc16_ = var_172;
               if(_loc16_)
               {
                  uncompress();
               }
               var_770 = ChecksumUtil.Adler32(var_33,0,var_33.length);
               var_445 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_770);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_329 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1840);
            }
            else
            {
               _loc8_.writeMultiByte(var_1840,var_329);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_173 > 0)
         {
            if(var_929)
            {
               _loc13_ = 0;
               param1.writeBytes(var_33,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_33,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_173;
      }
      
      protected function compress() : void
      {
         if(!var_172)
         {
            if(false)
            {
               var_33.position = 0;
               var_533 = var_33.length;
               if(var_929)
               {
                  var_33.compress.apply(var_33,["deflate"]);
                  var_173 = var_33.length;
               }
               else
               {
                  var_33.compress();
                  var_173 = -6;
               }
               var_33.position = 0;
               var_172 = true;
            }
            else
            {
               var_173 = 0;
               var_533 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_930 + var_1156)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_329 == "utf-8")
         {
            var_378 = param1.readUTFBytes(var_930);
         }
         else
         {
            var_378 = param1.readMultiByte(var_930,var_329);
         }
         var _loc2_:uint = var_1156;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_378 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_770 = param1.readUnsignedInt();
               var_445 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1155 = _loc2_ >> 8;
         var_1424 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_636 = param1.readUnsignedShort();
         var_1422 = (_loc3_ & 1) !== 0;
         var_1423 = (_loc3_ & 8) !== 0;
         var_1839 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_329 = "utf-8";
         }
         if(var_636 === const_1310)
         {
            var_2206 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2205 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_636 === const_650)
         {
            var_1838 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_635 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_634 = param1.readUnsignedInt();
         var_173 = param1.readUnsignedInt();
         var_533 = param1.readUnsignedInt();
         var_930 = param1.readUnsignedShort();
         var_1156 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_33,0,param1.length);
            var_634 = ChecksumUtil.CRC32(var_33);
            var_445 = false;
         }
         else
         {
            var_33.length = 0;
            var_33.position = 0;
            var_172 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_378 + "\n  date:" + var_635 + "\n  sizeCompressed:" + var_173 + "\n  sizeUncompressed:" + var_533 + "\n  versionHost:" + var_1155 + "\n  versionNumber:" + var_1424 + "\n  compressionMethod:" + var_636 + "\n  encrypted:" + var_1422 + "\n  hasDataDescriptor:" + var_1423 + "\n  hasCompressedPatchedData:" + var_1839 + "\n  filenameEncoding:" + var_329 + "\n  crc32:" + var_634.toString(16) + "\n  adler32:" + var_770.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_172)
         {
            uncompress();
         }
         return var_33;
      }
   }
}
