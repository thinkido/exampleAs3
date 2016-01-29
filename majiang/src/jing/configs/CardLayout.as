package jing.configs
{

import framework.geom.Point;
import framework.resources.Res;

import jing.consts.CardPlace;
import jing.consts.GameDir;
import jing.vo.CardLayoutVO;

/**
 * ÅƲ¼¾Ö
 * 
 * @author Jing
 */
public class CardLayout
{

	private var _t:Object;

	public function CardLayout()
	{
		init("card_layout_json");
	}

	/**
	 * »ñȡ²¼¾ÖÐÅϢ
	 * 
	 * @param dir
	 * @param place
	 * @return
	 */
	public function getLayout(dir:String, place:String):CardLayoutVO{
		var dirTbl:Object= Object(_t[dir]);
		return dirTbl[place] as CardLayoutVO;
	}

	public function init(file:String):void{
		var obj:Object= null;
		obj = Res.actively.getJson(file);

		_t = new Object(4);

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

		Res.actively.release(file);
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
		if(jsonObj.has("dir"))
		{
			vo.dir = jsonObj["dir"];
		}
		if(jsonObj.has("gap"))
		{
			vo.gap = parseInt(jsonObj["gap"]);
		}
		if(jsonObj.has("combin_gap"))
		{
			vo.combinGap = parseInt(jsonObj["combin_gap"]);
		}
		if(jsonObj.has("combin_gang_offY"))
		{
			vo.combinGangOffY = parseInt(jsonObj["combin_gang_offY"]);
		}
		if(jsonObj.has("warp_count"))
		{
			vo.warpCount = parseInt(jsonObj["warp_count"]);
		}
		if(jsonObj.has("warp"))
		{
			var warpObj:Object= jsonObj["warp"];
			vo.warp = new Point(parseInt(warpObj["x"), warpObj.getInt("y"]));
		}
		return vo;
	}
}
}