
package jing.pai.vo;

public class ChuVO
{

	public ChuVO()
	{

	}

	public ChuVO(int playCard, int jiaoCount)
	{
		this.playCard = playCard;
		this.jiaos = new JiaoVO[jiaoCount];
	}

	/**
	 * ������
	 */
	public int playCard = -1;

	/**
	 * �µĽ�
	 */
	public JiaoVO[] jiaos = null;

	public String toString()
	{
		if(null == this.jiaos || -1 == this.playCard)
		{
			return "none";
		}

		String out = "PlayCard: " + this.playCard + "\n";

		for(int i = 0; i < jiaos.length; i++)
		{
			out += "Jiao: " + jiaos[i].toString() + "\n";
		}

		return out;
	}

}
