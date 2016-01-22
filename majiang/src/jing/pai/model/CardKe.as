package jing.pai.model
{
/**
 * ¿Ì
 * 
 * @author Jing
 */
public class CardKe
{
	/**
	 * ¿̵ÄÀàÐÍ
	 */
	public var type:int= 0;
	
	/**
	 * ¿̵ÄÀàÐÍ2
	 */
	public var type2:int= 0;

	/**
	 * Èç¹ûÊÇÁ¬×֣¬ÔòcardΪÁ¬×ֵÚһ¸򣬺óÃæΪcard + 1, card + 2
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