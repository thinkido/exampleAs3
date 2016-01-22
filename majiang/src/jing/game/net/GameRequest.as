package jing.game.net
{
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

	static private var _ins:GameRequest= new GameRequest();

	static public function ins():GameRequest{
		return _ins;
	}

	public function GameRequest()
	{

	}

	public function enterGame():void{
		var json:String= new JSONArray().put("enter_game").put(AccountManager.getInstance().getId()).put(AccountManager.getInstance().getType()).put(0).put("none").put(false).put(1).put("nil").put("nil").toString();
		Global.socketGame.send(json);
	}

	public function readyGame():void{
		try
		{
			Global.socketGame.sendProtobuf("cs_ready_game", cs_ready_game.newBuilder().setNoop(0).build().toByteArray());
		}
		catch(var e:IOException)
		{
			requestError("cs_ready_game", e);
		}
	}

	/**
	 * 定缺
	 * 
	 * @param id
	 */
	public function sureLack(code:int):void{
		var builder:cs_game_action.Builder= cs_game_action.newBuilder();
		builder.setId(PlayerAction.LACK);
		builder.setTile_type_or_id(code);
		try
		{
			Global.socketGame.sendProtobuf("cs_game_action", builder.build().toByteArray());
		}
		catch(var e:IOException)
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
	public function gameAction(action:int, cardTypeOrId:int):void{
		var builder:cs_game_action.Builder= cs_game_action.newBuilder();
		builder.setId(action);
		builder.setTile_type_or_id(cardTypeOrId);
		var pb:cs_game_action= builder.build();
		try
		{
			Global.socketGame.sendProtobuf("cs_game_action", pb.toByteArray());
		}
		catch(var e:IOException)
		{
			requestError("cs_game_action", e);
		}
	}

	public function enterHall():void{
		var id:String= AccountManager.getInstance().id();
		var type:String= AccountManager.getInstance().type();
		Global.socketHall.send(new JSONArray().put("enter_hall").put(id).put(type).put(0).toString());
	}

	/**
	 * 取消托管
	 */
	public function gameManual():void{
		try
		{
			Global.socketGame.sendProtobuf("cs_game_manual", cs_game_manual.newBuilder().setNoop(0).build().toByteArray());
		}
		catch(var e:IOException)
		{
			requestError("cs_game_manual", e);
		}
	}

	private function requestError(content:String, e:IOException):void{
		LogManager.getInstance().log("协议发送出错：" + content, LogManager.LEVEL_ERROR);
		e.printStackTrace();
	}

}
}