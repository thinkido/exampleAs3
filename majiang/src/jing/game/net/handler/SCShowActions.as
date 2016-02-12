package jing.game.net.handler
{
import game.view.scene.gamescene.windows.PlayerActionWindow;

import jing.consts.PlayerAction;
import jing.game.net.GameRequest;

import protocol.gameserver.sc_game_show_actions;
import protocol.gameserver.scgame_show_actions;

public class SCShowActions
{

	public function SCShowActions(pb:sc_game_show_actions)
	{
		trace(pb.toString());
		
		
		if(pb.showActions.length == 1)
		{
			var action:scgame_show_actions= pb.showActions[0] as scgame_show_actions;
			var id:int= action.id;
			var typeOrId:int= 0;
			if(id == PlayerAction.MING_GANG || id == PlayerAction.AN_GANG)
			{
				typeOrId = int(action.tileSeq[0]);
			}
			GameRequest.ins().gameAction(id, typeOrId);
			return;
		}
		
		// ÏÔʾ²Ù×÷Ãæ°å
		PlayerActionWindow.show(pb.showActions);
	}

}
}