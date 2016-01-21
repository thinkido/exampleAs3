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
	public var card:int= 0;

	public function CardKe(type:int, card:int, type2:int)
	{
		this.type = type;
		this.card = card;
		this.type2 = type2;
	}
}
}