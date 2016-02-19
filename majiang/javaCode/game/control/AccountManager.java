
package game.control;

import java.io.IOException;

import net.jarlehansen.protobuf.javame.ByteString;
import network.ProtocolList;
import network.YiuNetworkHandlerMgr;
import network.YiuNetworkListener;
import network.YiuNetworkSocket;
import network.YiuNetworkStatusListener;

import org.json.me.JSONArray;
import org.json.me.JSONException;
import org.json.me.JSONObject;

import protocol.heartbeat;
import protocol.sc_enter_hall;
import protocol.sc_force_continue_game;
import framework.time.ITickListener;
import framework.time.TickItem;
import framework.views.Stage;
import game.model.Global;
import game.model.vo.EnterGameVO;
import game.model.vo.GiftVO;
import game.model.vo.IpAddressVO;
import game.model.vo.UserDataVO;

public class AccountManager implements YiuNetworkListener
{

	private static final int SOCKET_INTERVAL = 200;

	private static final int HEARTBEAT_INTERVAL = 10000;

	private static AccountManager _instance = null;

	private String _id;

	public String id()
	{
		return _id;
	}

	private String _type = "tv";

	public String type()
	{
		return _type;
	}

	private String _name;

	private YiuNetworkStatusListener _statusListener;

	private byte[] _heartbeatBytes;

	public static AccountManager getInstance()
	{
		if(_instance == null)
			_instance = new AccountManager();
		return _instance;
	}

	public AccountManager()
	{
		_statusListener = new YiuNetworkStatusListener()
		{

			protected void doLost(YiuNetworkSocket socket)
			{
//				LogManager.getInstance().log("网络连接已中断", LogManager.LEVEL_ERROR);
				socket.close();
				return;
			}

			// status = [connect-failed,send-failed,receive-failed,connected]
			public void onNetworkStatusNotify(YiuNetworkSocket socket, String status)
			{
				LogManager.getInstance().log(status);
				if(status.equals("connect-failed") || status.equals("send-failed"))
				{
					doLost(socket);
				}
			}
		};
		try
		{
			_heartbeatBytes = heartbeat.newBuilder().setNoop(0).build().toByteArray();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		Stage.current.ticker.setTimeInterval(HEARTBEAT_INTERVAL, new ITickListener()
		{

			public void onTick(TickItem tickItem)
			{
				if(Global.socketHall != null && Global.socketHall.isConnected())
					Global.socketHall.sendProtobuf("heartbeat", _heartbeatBytes);
				if(Global.socketGame != null && Global.socketGame.isConnected())
					Global.socketGame.sendProtobuf("heartbeat", _heartbeatBytes);
			}
		}, null);

		_id = Global.account;
		_name = Global.adAccount;
		ProtocolList.init();
	}

	public String getId()
	{
		return _id;
	}

	public String getType()
	{
		return _type;
	}

	public String getName()
	{
		return _name;
	}

	public void reset()
	{
		if(Global.socketHall != null)
		{
			if(Global.socketHall.isConnected())
				Global.socketHall.close();
			Global.socketHall = null;
		}
		if(Global.socketGame != null)
		{
			if(Global.socketGame.isConnected())
				Global.socketGame.close();
			Global.socketGame = null;
		}
		Global.giftVO = null;
	}

	public void connect()
	{
		// 大厅套接字
		YiuNetworkSocket socketHall = new YiuNetworkSocket(Global.cfg.hallAddressVO());
		Stage.current.ticker.setTimeInterval(SOCKET_INTERVAL, socketHall, null);
		socketHall.setStatusListener(_statusListener);
		socketHall.connect();
		Global.socketHall = socketHall;

		// 游戏房间套接字,暂时不连接，当进入房间才连接
		YiuNetworkSocket socketGame = new YiuNetworkSocket();
		Stage.current.ticker.setTimeInterval(SOCKET_INTERVAL, socketGame, null);
		socketGame.setStatusListener(_statusListener);
		Global.socketGame = socketGame;
		String ret = YiuHttpManager.PostOptJson(Global.cfg.gateAddressVO().toHttpAddress() + "/login", "id=" + _id + "&idtype=" + _type + "&name=" + _name + "&version=0.1");
		if(ret == null || ret.equals("{}"))
		{
			LogManager.getInstance().log("登录失败", LogManager.LEVEL_ERROR);
		}
		else
		{
			try
			{
				JSONObject json = new JSONObject(ret);
				int day = json.getInt("loginday");
				int gold = json.getInt("logingold");
				boolean fetched = json.getBoolean("logingold_fetched");
				Global.giftVO = new GiftVO(day, gold, fetched);
			}
			catch(JSONException e)
			{
				LogManager.getInstance().log("登录/获取登录奖励信息失败", LogManager.LEVEL_ERROR);
			}
			LogManager.getInstance().log("登陆成功");
			YiuNetworkHandlerMgr.subscribe(this);
			reqEnterHall();
		}
	}
	
	public void reqEnterHall()
	{
		Global.socketHall.send(new JSONArray().put("enter_hall").put(_id).put(_type).put(0).toString());
	}

	public boolean onNetworkEvent(String name, ByteString content)
	{
		try
		{
			if(name.equals("sc_enter_hall"))
			{
				YiuNetworkHandlerMgr.unSubscribe(this);
				sc_enter_hall msg = sc_enter_hall.parseFrom(content.toByteArray());
				Global.userDataVO = new UserDataVO(msg);
				PlaceDataManager.getInstance().init(msg.getPlace_infos());
				Global.startGame(null);
				return false;
			}
			else if(name.equals("sc_force_continue_game"))
			{
				YiuNetworkHandlerMgr.unSubscribe(this);
				sc_force_continue_game msg = sc_force_continue_game.parseFrom(content.toByteArray());
				Global.startGame(new EnterGameVO(new IpAddressVO(msg.getHost(), msg.getPort()), true));
				return false;
			}
		}
		catch(IOException e)
		{
			LogManager.getInstance().log("解析sc_enter_hall协议失败", LogManager.LEVEL_ERROR);
		}
		return true;
	}
}
