
package jing.game.net.handler;

import jing.consts.PlayerAction;
import jing.game.net.GameRequest;
import game.view.scene.gamescene.windows.PlayerActionWindow;
import protocol.sc_game_show_actions;
import protocol.scgame_show_actions;

public class SCShowActions
{

	public SCShowActions(sc_game_show_actions pb)
	{
		System.out.println(pb.toString());
		
		
		if(pb.getShow_actions().size() == 1)
		{
			scgame_show_actions action = (scgame_show_actions)pb.getShow_actions().elementAt(0);
			int id = action.getId();
			int typeOrId = 0;
			if(id == PlayerAction.MING_GANG || id == PlayerAction.AN_GANG)
			{
				typeOrId = ((Integer)action.getTile_seq().elementAt(0)).intValue();
			}
			GameRequest.ins().gameAction(id, typeOrId);
			return;
		}
		
		// ÏÔÊ¾²Ù×÷Ãæ°å
		PlayerActionWindow.show(pb.getShow_actions());
	}

}
