
package game.model.vo;

import protocol.sc_enter_hall;
import protocol.t_friend_data;

public class UserDataVO
{

	public String name = "Jordan";

	public long gold = 0;

	public long exp = 0;

	public int level = 0;

	public int sex = 0;

	public int portrait = 0;

	public int score = 0;

	public int winNum;

	public int loseNum;

	public int pingNum;

	public UserDataVO(sc_enter_hall msg)
	{
		name = msg.getName();
		gold = msg.getGold();
		exp = msg.getExp();
		level = msg.getLevel();
		sex = msg.getSex();
		portrait = msg.getPortrait();
		score = msg.getCollect_score();
	}

	public void update(t_friend_data friend)
	{
		name = friend.getName();
		gold = friend.getGold();
		exp = friend.getExp();
		level = friend.getLevel();
		sex = friend.getSex();
		portrait = friend.getPortrait();
		winNum = friend.getWin_count();
		loseNum = friend.getLose_count();
		pingNum = friend.getPing_count();
	}
	
	public int getTotalNum()
	{
		return winNum + loseNum + pingNum;
	}

	public String getWinRate()
	{
		int totalNum = getTotalNum();
		if(totalNum > 0)
		{
			double bl = (double)winNum / (double)((totalNum == 0 ? 1 : totalNum));
			return String.valueOf(((int)(Math.floor(bl * 10000))) / 100) + "%";
		}
		else
			return "0%";
	}
}