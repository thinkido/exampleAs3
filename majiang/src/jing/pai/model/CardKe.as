package jing.pai.model
{
/**
 * 刻
 * 
 * @author Jing
 */
public class CardKe
{
	/**
	 * 刻的类型
	 */
	public var type:int= 0;
	
	/**
	 * 刻的类型2
	 */
	public var type2:int= 0;

	/**
	 * 如果是连字，则card为连字第一个，后面为card + 1, card + 2
	 */
	public var id:int= 0;

	public function CardKe(type:int, card:int, type2:int)
	{
		this.type = type;
		this.id = card;
		this.type2 = type2;
	}
	
	public function toStrong():String{
		return "CardKe: type = "+type+", type2 = "+type2+", id = "+id+";";
	}
}
}