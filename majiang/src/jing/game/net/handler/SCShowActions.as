package jing.game.net.handler
{
import jing.consts.PlayerAction;
import jing.game.net.GameRequest;
import game.view.scene.gamescene.windows.PlayerActionWindow;
import protocol.sc_game_show_actions;
import protocol.scgame_show_actions;

public class SCShowActions
{

	public function SCShowActions(pb:sc_game_show_actions)
	{
		System.out.println(pb.toString());
		
		
		if(pb.getShow_actions().size() == 1)
		{
			var action:scgame_show_actions= scgame_show_actions(pb.getShow_actions().elementAt(0));
			var id:int= action.getId();
			var typeOrId:int= 0;
			if(id == PlayerAction.MING_GANG || id == PlayerAction.AN_GANG)
			{
				typeOrId = (Integer(action.getTile_seq().elementAt(0))).intValue();
			}
			GameRequest.ins().gameAction(id, typeOrId);
			return;
		}
		
		// ÏÔʾ²Ù×÷Ãæ°å
		PlayerActionWindow.show(pb.getShow_actions());
	}

}
}