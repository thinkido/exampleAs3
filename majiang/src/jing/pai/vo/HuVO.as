package jing.pai.vo
{
import jing.pai.consts.GBHuType;

public class HuVO
{

	/**
	 * ºúµÄÅÆÐÍ
	 */
	public var types:Array= null;
	public var len:int;

	public function HuVO() {
		types = new int[100];
	}
	/**
	 * ºúµÄ×ܷ¬Êý
	 */
	public var all_fan:int= 0;
	
	public function add_result(type:int, fan:int):void{
		if (len >= types.length) {
			System.out.println("add_result "+len);
		} else {
			types[len] = type;
			len++;
			this.all_fan += fan;
		}
	}

	public function toString():String{
		var strTypes:String= "";
		for(var i:int= 0; i < types.length; i++)
		{
			var type:int= types[i];
			var typeDesc:String= " { " + type + " : " + GBHuType.HU_TXT[type] + " }";
			strTypes += typeDesc;
		}
		return "[ ·¬Êý: " + all_fan + " , ÀàÐÍ: " + strTypes + " ]";
	}
}
}