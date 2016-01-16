
package jing.game.model;

import framework.time.ITickListener;
import framework.time.TickItem;
import framework.views.Stage;
import game.model.Global;
import game.model.vo.EnterGameVO;
import game.util.CommonUtil;
import jing.game.net.GamePlaySL;
import jing.game.net.GameRequest;

public class GamePlayModel
{

	/**
	 * 当前活跃的Model
	 */
	static public GamePlayModel current = null;

	private GamePlaySL _sl;

	private EnterGameVO _enterGameVO;

	private int _roomId;

	public int roomId()
	{
		return _roomId;
	}

	private int _roomBase = 1000;

	public int roomBase()
	{
		return _roomBase;
	}

	private String _roomLevel;

	public String roomLevel()
	{
		return _roomLevel;
	}

	private int _leaveRoomTimerId = -1;

	private boolean _isKicked = false;

	public boolean isKicked()
	{
		return _isKicked;
	}

	public GamePlayModel(EnterGameVO vo)
	{
		_enterGameVO = vo;
		GamePlayModel.current = this;
	}

	public void init()
	{
		// 连接服务器
		Global.socketGame.connect(_enterGameVO.ipAddressVO);
		_sl = new GamePlaySL();
		_sl.init();
		GameRequest.ins().enterGame();
	}

	public void dispose()
	{
		reset();
		_sl.dispose();
		if(Global.socketGame != null && Global.socketGame.isConnected())
		{
			System.out.println("主动断开和游戏服的连接");
			Global.socketGame.close();
		}
	}

	public void reset()
	{
		_isKicked = false;
		releaseOutRoomTimer();
	}

	public void updateRoomInfo(int roomId, int roomBase, String roomLevel)
	{
		_roomId = roomId;
		_roomBase = roomBase;
		_roomLevel = roomLevel;
	}

	public void startLeaveRoomTimer()
	{
		_leaveRoomTimerId = Stage.current.ticker.setTimeout(20000, new ITickListener()
		{

			public void onTick(TickItem tickItem)
			{
				// 主动退出房间
				kickedFromRoom();
			}
		}, null);
	}

	public void releaseOutRoomTimer()
	{
		if(-1 != _leaveRoomTimerId)
		{
			Stage.current.ticker.release(_leaveRoomTimerId);
			_leaveRoomTimerId = -1;
		}
	}

	public void kickedFromRoom()
	{
		Global.socketGame.close();
		_isKicked = true;
		CommonUtil.showPopupWindow(false, "您已离开房间！", null);
	}
}
