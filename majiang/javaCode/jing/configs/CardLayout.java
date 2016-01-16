
package jing.configs;

import java.util.Hashtable;

import jing.consts.GameDir;
import jing.consts.CardPlace;
import jing.vo.CardLayoutVO;

import org.json.me.JSONException;
import org.json.me.JSONObject;

import framework.geom.Point;
import framework.resources.Res;

/**
 * 牌布局
 * 
 * @author Jing
 */
public class CardLayout
{

	private Hashtable _t;

	public CardLayout()
	{
		init("card_layout_json");
	}

	/**
	 * 获取布局信息
	 * 
	 * @param dir
	 * @param place
	 * @return
	 */
	public CardLayoutVO getLayout(String dir, String place)
	{
		Hashtable dirTbl = (Hashtable)_t.get(dir);
		return (CardLayoutVO)dirTbl.get(place);
	}

	public void init(String file)
	{
		JSONObject obj = null;
		obj = Res.actively.getJson(file);

		_t = new Hashtable(4);

		try
		{
			_t.put(GameDir.UP, createDirLayout(obj.getJSONObject(GameDir.UP)));
			_t.put(GameDir.LEFT, createDirLayout(obj.getJSONObject(GameDir.LEFT)));
			_t.put(GameDir.RIGHT, createDirLayout(obj.getJSONObject(GameDir.RIGHT)));
			_t.put(GameDir.DOWN, createDirLayout(obj.getJSONObject(GameDir.DOWN)));
		}
		catch(JSONException e)
		{
			System.out.println("config <card_layout.json> load error XXXXXXXXXXXXXXXXXXX");
		}

		Res.actively.release(file);
	}

	private Hashtable createDirLayout(JSONObject jsonObj) throws JSONException
	{
		Hashtable t = new Hashtable(4);
		t.put(CardPlace.NEW_IN_HAND, getCardLayoutVO(jsonObj.getJSONObject(CardPlace.NEW_IN_HAND)));
		t.put(CardPlace.IN_HAND, getCardLayoutVO(jsonObj.getJSONObject(CardPlace.IN_HAND)));
		t.put(CardPlace.IN_HAND_TABLE, getCardLayoutVO(jsonObj.getJSONObject(CardPlace.IN_HAND_TABLE)));
		t.put(CardPlace.ON_TABLE, getCardLayoutVO(jsonObj.getJSONObject(CardPlace.ON_TABLE)));
		t.put(CardPlace.SHOW_HAND, getCardLayoutVO(jsonObj.getJSONObject(CardPlace.SHOW_HAND)));
		return t;
	}

	private CardLayoutVO getCardLayoutVO(JSONObject jsonObj) throws JSONException
	{
		CardLayoutVO vo = new CardLayoutVO();
		vo.cardPrefix = jsonObj.getString("card_prefix");
		vo.startX = jsonObj.getInt("startX");
		vo.startY = jsonObj.getInt("startY");
		if(jsonObj.has("dir"))
		{
			vo.dir = jsonObj.getString("dir");
		}
		if(jsonObj.has("gap"))
		{
			vo.gap = jsonObj.getInt("gap");
		}
		if(jsonObj.has("combin_gap"))
		{
			vo.combinGap = jsonObj.getInt("combin_gap");
		}
		if(jsonObj.has("combin_gang_offY"))
		{
			vo.combinGangOffY = jsonObj.getInt("combin_gang_offY");
		}
		if(jsonObj.has("warp_count"))
		{
			vo.warpCount = jsonObj.getInt("warp_count");
		}
		if(jsonObj.has("warp"))
		{
			JSONObject warpObj = jsonObj.getJSONObject("warp");
			vo.warp = new Point(warpObj.getInt("x"), warpObj.getInt("y"));
		}
		return vo;
	}
}
