
package jing.game.net;

import java.io.IOException;

import jing.consts.PlayerAction;
import game.control.AccountManager;
import game.control.LogManager;
import game.control.WindowManager;
import game.model.Global;
import game.view.scene.gamescene.GameScene;

import org.json.me.JSONArray;

import protocol.cs_game_action;
import protocol.cs_game_manual;
import protocol.cs_ready_game;

/**
 * 游戏场景发出的请求
 * 
 * @author Jing
 */
public class GameRequest
{

	static private GameRequest _ins = new GameRequest();

	static public GameRequest ins()
	{
		return _ins;
	}

	public GameRequest()
	{

	}

	public void enterGame()
	{
		String json = new JSONArray().put("enter_game").put(AccountManager.getInstance().getId()).put(AccountManager.getInstance().getType()).put(0).put("none").put(false).put(1).put("nil").put("nil").toString();
		Global.socketGame.send(json);
	}

	public void readyGame()
	{
		try
		{
			Global.socketGame.sendProtobuf("cs_ready_game", cs_ready_game.newBuilder().setNoop(0).build().toByteArray());
		}
		catch(IOException e)
		{
			requestError("cs_ready_game", e);
		}
	}

	/**
	 * 定缺
	 * 
	 * @param id
	 */
	public void sureLack(int code)
	{
		cs_game_action.Builder builder = cs_game_action.newBuilder();
		builder.setId(PlayerAction.LACK);
		builder.setTile_type_or_id(code);
		try
		{
			Global.socketGame.sendProtobuf("cs_game_action", builder.build().toByteArray());
		}
		catch(IOException e)
		{
			requestError("cs_game_action", e);
		}
	}

	/**
	 * 玩家动作
	 * 
	 * @param action 操作ID
	 * @param cardTypeOrId 牌的ID或类型
	 */
	public void gameAction(int action, int cardTypeOrId)
	{
		cs_game_action.Builder builder = cs_game_action.newBuilder();
		builder.setId(action);
		builder.setTile_type_or_id(cardTypeOrId);
		cs_game_action pb = builder.build();
		try
		{
			Global.socketGame.sendProtobuf("cs_game_action", pb.toByteArray());
		}
		catch(IOException e)
		{
			requestError("cs_game_action", e);
		}
	}

	public void enterHall()
	{
		String id = AccountManager.getInstance().id();
		String type = AccountManager.getInstance().type();
		Global.socketHall.send(new JSONArray().put("enter_hall").put(id).put(type).put(0).toString());
	}

	/**
	 * 取消托管
	 */
	public void gameManual()
	{
		try
		{
			Global.socketGame.sendProtobuf("cs_game_manual", cs_game_manual.newBuilder().setNoop(0).build().toByteArray());
		}
		catch(IOException e)
		{
			requestError("cs_game_manual", e);
		}
	}

	private void requestError(String content, IOException e)
	{
		LogManager.getInstance().log("协议发送出错：" + content, LogManager.LEVEL_ERROR);
		e.printStackTrace();
	}

}
