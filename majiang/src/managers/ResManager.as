package managers
{
	
	import br.com.stimuli.loading.BulkLoader;
	
	import com.as3game.spritesheet.SpriteSheet;
	import com.as3game.spritesheet.vos.DataFormat;
	import com.thinkido.framework.air.FileUtils;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import framework.io.FileIO;
	import framework.resources.Res;
	import framework.resources.ResItem;
	
	import game.model.Global;
	
	import starling.display.Image;
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;

	public class ResManager
	{
		public function ResManager()
		{
		}
		
		/*** 窗口灰色半透明遮盖		 */
		public static var imgDarkBg:Texture;		
		/*** 头像纹理集		 */
		public static var ssHead:TextureAtlas;
		/*** 称号纹理集		 */
		public static var ssTitle:TextureAtlas;
		
		public static const BASE:String = "assets/";
		
		public static const YLXD:String = BASE + "collectcandy.png";
		
		public static const YLXDXML:String = BASE + "collectcandy.xml";
		
		public static const YLXD2:String = BASE + "collectcandy2.png";
		public static const YLXDXML2:String = BASE + "collectcandy2.xml";
		
		public static const CANDYCONFIG:String = BASE + "candyconfig.xml";
		
		public static const YLXD3:String = BASE + "collectcandy3.png";
		public static const YLXDXML3:String = BASE + "collectcandy3.xml";
		
		public static var assetsManager:AssetManager;
		
		public static var resLoader:BulkLoader;
		
		public static var YLXD_NAME:String = "collectcandy";
		public static var YLXD_NAME2:String = "collectcandy2";
		public static var YLXD_NAME3:String = "collectcandy3";
		
		public static const PASS_SOUND:String = BASE + "pass.mp3";
		
		public static const BEYOND_MAX:String = BASE + "win.mp3";
		public static const GAME_OVER:String = BASE + "gameover.mp3";
		public static var backGroundBmd:BitmapData;
		
		public static const BUFF_BASE:String = "buff_";
		
		public static function getResKey(key:String):String
		{
			return key;
//			return LanUtil.isChinese ? key : key+"_en";
		}
		
		public static function getMyHeadTexture():Texture
		{
			return getHeadTexture( Global.userDataVO.sex, Global.userDataVO.portrait);
		}
		
		public static function getHeadTexture(sex:int, portrait:int):Texture
		{
			if(sex == 0)
				portrait += 9;
			return ssHead.getTexture("head_" + portrait);
		}
		
		public static function getMyTitleTexture():Texture
		{
			return getTitleTexture(Global.userDataVO.level);
		}
		
		public static function getTitleTexture(level:int):Texture
		{
			return ssTitle.getTexture("title_" + level);
		}
		/*** 资源表*/
		private static var _resTable:Object= new Object();
		/*** 资源对应的数据表*/
		private static var _dataTable:Object= new Object();
		
		public static function loadInitConfig(path:String):void{
			var jsonObj:Object= FileIO.getJson(path);
			var resList:Array= jsonObj["resources"];
			for(var i:int= 0; i < resList.length; i++)
			{
				var resItem:Object= resList[i];
				var itemName:String= resItem["name"];
				var itemType:String= resItem["type"];
				var itemUrl:String= "/" + resItem["url"];
				var item:ResItem= new ResItem(itemName, itemType, itemUrl);
				
				if(itemType == "sheet")
				{
					var subkeys:String= resItem["subkeys"];
					item.subkeys = subkeys;
				}
				
				_resTable[item.name()] = item;
			}
			trace("Total local resource:" + _resTable.size());
		}
		
//		返回json 对应的png 地址
		public static function getSheetUrl( url:String ):String{
			return url.substring(0, url.length - 5) + ".png" ;
		}
//		返回json 对应的 png 地址
		public static function getFontUrl( url:String ):String{
			return url.substring(0, url.length - 4) + ".png" ;
		}
		
		public static function getFile(name:String , type:String , delDic:Boolean = false ):*{
			var obj:* = null;
			var item:ResItem = getResItem(name, Res.TYPE_JSON ,  delDic );
			var imagePath:String ;
			var bmd:BitmapData , texture:Texture ;
			var atlas:XML ;
			if(_dataTable[name] == undefined)
			{
				var url:String= item.url();
				switch( type){
					case Res.TYPE_JSON:
						obj = FileIO.getJson(url);
						break ;
					case Res.TYPE_IMAGE :
						obj = resLoader.getBitmap(url) ;
						break ;
					case Res.TYPE_TEXTURE :
						bmd = resLoader.getBitmapData( url ) ;
						obj = Texture.fromBitmapData( bmd ) ;
						break ;
					case Res.TYPE_SHEET :	
					case Res.TYPE_TEXTUREATLAS:
						atlas = new XML( FileUtils.getStringByFileName( url ) );
						imagePath = url.substring(0, url.length - 5) + ".png" ;
						bmd = resLoader.getBitmapData( imagePath ) ;
						if( bmd == null ){
							throw new Error("需要先用resLoader加载完图片后再调用");
						}
						texture = Texture.fromBitmapData( bmd ) ;
						obj = new TextureAtlas( texture , atlas );
						break ;
					case Res.TYPE_FONT:		//不能本地获取;
						var xml:XML = new XML( FileUtils.getStringByFileName( url ) );						
						var imagePath1:String= url.substring(0, url.length - 4) + ".png";
						bmd = resLoader.getBitmapData( imagePath1 ) ;
						if( bmd == null ){
							throw new Error("需要先用resLoader加载完图片后再调用");		// bitmapdata 必须先加载才能获取,
						}
						var ft:Texture = Texture.fromBitmapData( bmd ) ;
						obj = new BitmapFont( ft , xml ) ;
						break ;
					case Res.TYPE_SOUND:
						throw new Error("Res.TYPE_SOUND can't found");
						break ;
					case Res.TYPE_BINARY:
						obj = FileUtils.getContentByFileName( name );
						break ;
				}
				_dataTable[name] = obj ;
			}
			else
			{
				obj = _dataTable[name];
			}
			return obj;			
		}
		private static function getResItem( name:String, type:String, delDic:Boolean = false):ResItem{
			var item:ResItem= null ;
			if(_resTable[name] != undefined )
			{
				item = ResItem(_resTable[name]);
			}
			else
			{
				var url:String= name;
				if(url.charAt(0) != '/')
				{
					url = '/' + url;
				}
				item = new ResItem(name, type, url);
				_resTable[name] = item ;
			}
			if( delDic ){	//不需要存储在数据库
				_resTable[name] = undefined ;
			}			
			return item;
		}
		/** 获取资源的URL地址* 
		 * @param name
		* @return
		*/
		public static function getUrl(name:String):String{
			var url:String;
			if(_resTable[name] != undefined)
			{
				var item:ResItem= ResItem(_resTable[name]);
				url = item.url();
			}
			else
			{
				url = name;
				if(url.charAt(0) != '/')
				{
					url = '/' + url;
				}
			}
			return url;
		}
		
	}
}