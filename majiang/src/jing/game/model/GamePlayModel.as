package jing.game.model
{
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
	 * µ±ǰ»îԾµÄModel
	 */
	static public var current:GamePlayModel= null;

	private var _sl:GamePlaySL;

	private var _enterGameVO:EnterGameVO;

	private var _roomId:int;

	public function roomId():int{
		return _roomId;
	}

	private var _roomBase:int= 1000;

	public function roomBase():int{
		return _roomBase;
	}

	private var _roomLevel:String;

	public function roomLevel():String{
		return _roomLevel;
	}

	private var _leaveRoomTimerId:int= -1;

	private var _isKicked:Boolean= false;

	public function isKicked():Boolean{
		return _isKicked;
	}

	public function GamePlayModel(vo:EnterGameVO)
	{
		_enterGameVO = vo;
		GamePlayModel.current = this;
	}

	public function init():void{
		// Á¬½ӷþÎñÆ÷
		Global.socketGame.connect(_enterGameVO.ipAddressVO);
		_sl = new GamePlaySL();
		_sl.init();
		GameRequest.ins().enterGame();
	}

	public function dispose():void{
		reset();
		_sl.dispose();
		if(Global.socketGame != null && Global.socketGame.isConnected())
		{
			trace("Ö󶯶ϿªºÍÓÎϷ·þµÄÁ¬½Ó");
			Global.socketGame.close();
		}
	}

	public function reset():void{
		_isKicked = false;
		releaseOutRoomTimer();
	}

	public function updateRoomInfo(roomId:int, roomBase:int, roomLevel:String):void{
		_roomId = roomId;
		_roomBase = roomBase;
		_roomLevel = roomLevel;
	}

	public function startLeaveRoomTimer():void{
		_leaveRoomTimerId = Stage.current.ticker.setTimeout(20000, new ITickListener()
		{

			public function onTick(tickItem:TickItem):void{
				// Ö÷¶¯Í˳򷿼ä
				kickedFromRoom();
			}
		}, null);
	}

	public function releaseOutRoomTimer():void{
		if(-1!= _leaveRoomTimerId)
		{
			Stage.current.ticker.release(_leaveRoomTimerId);
			_leaveRoomTimerId = -1;
		}
	}

	public function kickedFromRoom():void{
		Global.socketGame.close();
		_isKicked = true;
		CommonUtil.showPopupWindow(false, "ÄúÒÑÀ뿪·¿¼䣡", null);
	}
}
}