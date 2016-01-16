
package game.model.vo;

import protocol.t_rank_data;

public class RankItemVO
{

	public int rank;

	public int portrait;

	public String name;

	public String value;

	public RankItemVO(t_rank_data msg)
	{
		rank = msg.getRank();
		portrait = msg.getPortrait();
		if(portrait == 0)
			portrait = 1;
		value = String.valueOf(msg.getValue_int_1());
		setName(msg.getName());
	}

	public RankItemVO(int _rank, int _portrait, String _name, String _value)
	{
		rank = _rank;
		portrait = _portrait;
		if(portrait == 0)
			portrait = 1;
		value = _value;
		setName(_name);
	}

	private void setName(String _name)
	{
		if(_name.length() > 7)
			name = _name.substring(_name.length() - 7);
		else
			name = _name;
	}
}
