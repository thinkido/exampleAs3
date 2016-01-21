package jing.pai.vo
{
import jing.pai.consts.GBHuType;

public class HuVO
{

	/**
	 * ºúµÄÅÆÐÍ
	 */
	public var types:Array= null;

	/**
	 * ºúµÄ×ܷ¬Êý
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
		return "[ ·¬Êý: " + fan + " , ÀàÐÍ: " + strTypes + " ]";
	}
}
}