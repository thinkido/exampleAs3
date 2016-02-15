package jing.configs
{

	import flash.geom.Point;
	
	import framework.resources.Res;
	
	import jing.consts.CardPlace;
	import jing.consts.GameDir;
	import jing.vo.CardLayoutVO;
	
	import managers.ResManager;
	
	/**
	 * 牌布局
	 * 
	 * @author Jing
	 */
	public class CardLayout
	{
	
		private var _t:Object;
	
		public function CardLayout()
		{
			init("config/card_layout.json");
		}
	
		/**
		 * 获取布局信息
		 * 
		 * @param dir
		 * @param place
		 * @return
		 */
		public function getLayout(dir:String, place:String):CardLayoutVO{
			var dirTbl:Object = _t[dir] ;
			return dirTbl[place] as CardLayoutVO;
		}
	
		public function init(file:String):void{
			var obj:Object= null;
			obj = ResManager.getFile(file ,Res.TYPE_JSON , true );
	
			_t = {} ;
	
			try
			{
				_t[GameDir.UP] = createDirLayout(obj[GameDir.UP]);
				_t[GameDir.LEFT] = createDirLayout(obj[GameDir.LEFT]);
				_t[GameDir.RIGHT] = createDirLayout(obj[GameDir.RIGHT]);
				_t[GameDir.DOWN] = createDirLayout(obj[GameDir.DOWN]);
			}
			catch(e:*)
			{
				trace("config <card_layout.json> load error XXXXXXXXXXXXXXXXXXX");
			}
		}
	
		private function createDirLayout(jsonObj:Object):Object
		{
			var t:Object= new Object();
			t[CardPlace.NEW_IN_HAND] = getCardLayoutVO(jsonObj[CardPlace.NEW_IN_HAND]);
			t[CardPlace.IN_HAND] = getCardLayoutVO(jsonObj[CardPlace.IN_HAND]);
			t[CardPlace.IN_HAND_TABLE] = getCardLayoutVO(jsonObj[CardPlace.IN_HAND_TABLE]);
			t[CardPlace.ON_TABLE] = getCardLayoutVO(jsonObj[CardPlace.ON_TABLE]);
			t[CardPlace.SHOW_HAND] = getCardLayoutVO(jsonObj[CardPlace.SHOW_HAND]);
			return t;
		}
	
		private function getCardLayoutVO(jsonObj:Object):CardLayoutVO
		{
			var vo:CardLayoutVO= new CardLayoutVO();
			vo.cardPrefix = jsonObj["card_prefix"];
			vo.startX = parseInt(jsonObj["startX"]);
			vo.startY = parseInt(jsonObj["startY"]);
			if(jsonObj.hasOwnProperty("dir"))
			{
				vo.dir = jsonObj["dir"];
			}
			if(jsonObj.hasOwnProperty("gap"))
			{
				vo.gap = parseInt(jsonObj["gap"]);
			}
			if(jsonObj.hasOwnProperty("combin_gap"))
			{
				vo.combinGap = parseInt(jsonObj["combin_gap"]);
			}
			if(jsonObj.hasOwnProperty("combin_gang_offY"))
			{
				vo.combinGangOffY = parseInt(jsonObj["combin_gang_offY"]);
			}
			if(jsonObj.hasOwnProperty("warp_count"))
			{
				vo.warpCount = parseInt(jsonObj["warp_count"]);
			}
			if(jsonObj.hasOwnProperty("warp"))
			{
				var warpObj:Object= jsonObj["warp"];
				vo.warp = new Point( parseInt(warpObj["x"]), parseInt(warpObj["y"]) );
			}
			return vo;
		}
	}
}