package jing.pai.vo
{
import jing.pai.consts.GBHuType;

public class HuVO
{

	/**
	 * 胡的牌型
	 */
	public var types:Array= null;

	/**
	 * 胡的总番数
	 */
	public var fan:int= 0;

	public function toString():String{
		var strTypes:String= "";
		for(var i:int= 0; i < types.length; i++)
		{
			var type:int= types[i];
			var typeDesc:String= " { " + type + " : " + GBHuType.HU_TXT[type] + " }";
			strTypes += typeDesc;
		}
		return "[ 番数: " + fan + " , 类型: " + strTypes + " ]";
	}
}
}