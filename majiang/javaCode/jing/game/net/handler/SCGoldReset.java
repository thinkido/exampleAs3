
package jing.game.net.handler;

import game.model.Global;
import protocol.sc_gold_reset;

public class SCGoldReset
{

	public SCGoldReset(sc_gold_reset pb)
	{
		Global.userDataVO.gold = pb.getTotal();
	}

}
