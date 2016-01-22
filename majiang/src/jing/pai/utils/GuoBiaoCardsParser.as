package jing.pai.utils
{
import jing.pai.consts.CardCode;
import jing.pai.model.CardKe;

/**
 * ÅÆ×é½âÎöÆ÷
 * 
 * @author Jing
 */
public class GuoBiaoCardsParser
{

	public static class GameHu {
		public function GameHu() {
			complex = new CardKe[100];
		}
		public var complex:Array;
		public var len:int;
		public function push(type1:int, type2:int, id:int):void{
			complex[len] = new CardKe(type1, type2, id);
			len++;
		}
		
		public function pop():void{
			if (len > 0) {
				complex[len - 1] = null;
				len--;
			}
		}
	};
	
	private var is_hu:Boolean= false;

	public function is_hu():Boolean{
		return is_hu;
	}


	public function GuoBiaoCardsParser()
	{

	}

	/**
	 * ʣÓàÅÆÊý
	 * 
	 * @param cards
	 */
	public static function tileRemain(pai:Array):int{
	    var sum:int= 0;
	    for (var i:int= CardCode.HAND_START; i < CardCode.HAND_LEN; i++) {
	        sum += pai[i];
	    }
	    return sum;
	}
	/**
	 * ½âÎöÅÆ×é
	 * 
	 * @param cards
	 */
	public function parse(int pai[], remain:int, jiang:int):void{
		if (hu(pai, remain, jiang)) {
			is_hu = true;
		}
	}
	public static function hu(int pai[], remain:int, jiang:int):Boolean{
	    if (remain == 0) return true; //Í˳öÌõ¼þ£¬ûÓÐʣÅƣ¬ºúÅÆÍ˳ö

	    var result:Boolean= false;
	    var i:int= CardCode.HAND_START;
	    for (; pai[i] == 0&& i < CardCode.HAND_LEN; i++); //Õҵ½ÓÐÅƵĵط½£¬iΪµ±ǰÅƣ¬PAI[i] ÊǸöÊý

	    //ÓÅÏÈѡÔñÈý¸öһÑùµÄ
	    if (pai[i] >= 3) {
	        pai[i] -= 3;
	        remain -= 3;
	        result = hu(pai, remain, jiang);
	        remain += 3;
	        pai[i] += 3;
	        if (result) {
	            return result;
	        }
	    }
	    //ѡÔñ½«ÅÆ
	    if (jiang == 0&& pai[i] >= 2) {
	        jiang = 1;
	        pai[i] -= 2;
	        remain -= 2;
	        result = hu(pai, remain, jiang);
	        remain += 2;
	        pai[i] += 2;
	        jiang = 0;
	        if (result) {
	            return result;
	        }

	    }
	    //˳×Ó
	    if (i <= CardCode.HAND_SEQE - 2&& (i % 10!= 8&& i % 10!= 9) && pai[i + 1] != 0&& pai[i + 2] != 0) {
	        pai[i]--;
	        pai[i + 1]--;
	        pai[i + 2]--;
	        remain -= 3;
	        result = hu(pai, remain, jiang);
	        pai[i]++;
	        pai[i + 1]++;
	        pai[i + 2]++;
	        remain += 3;
	        if (result) {
	            return result;
	        }

	    }
	    return false;
	}
	

	public static function hu_result(int pai[], remain:int, jiang:int, gamehu:Array, huType:GameHu, pos:int):int{
	    var curhu:GameHu= huType;
	    var start:int= pos;
	    var end:int= 0;
	    var haspeng:Boolean= false;
	    var hasjiang:Boolean= false;
	    
	    if (remain == 0) {
	        if (pos < CardCode.HU_MAX_NUM) {
	        	for (var i:int= 0; i < curhu.len; i++) {
	        		gamehu[pos].push(curhu.complex[i].type, curhu.complex[i].type2, curhu.complex[i].id);
				}
	        	gamehu[pos].len = curhu.len;
	            pos++;
	        }
	        return pos; //Í˳öÌõ¼þ£¬ûÓÐʣÅƣ¬ºúÅÆÍ˳ö
	    }
	    if (curhu.len >= CardCode.HU_MAX_NUM) {
	        return pos;
	    }
	    var i:int= CardCode.HAND_START;
	    for (; pai[i] == 0&& i < CardCode.HAND_LEN; i++); //Õҵ½ÓÐÅƵĵط½£¬iΪµ±ǰÅƣ¬PAI[i] ÊǸöÊý

	    //˳×Ó
	    if (i <= CardCode.HAND_SEQE - 2&& (i % 10!= 8&& i % 10!= 9) && pai[i + 1] != 0&& pai[i + 2] != 0) {
	        pai[i]--; pai[i + 1]--; pai[i + 2]--;
	        remain -= 3;
	        /*·ÅÈë½á¹ûջ*/
	        curhu.push(CardCode.COM_CHI, CardCode.COM_SEQ, i);
	        pos = hu_result(pai, remain, jiang, gamehu, huType, pos);
	        curhu.pop();
	        pai[i]++; pai[i + 1]++; pai[i + 2]++;
	        remain += 3;
	    }
	    end = pos;
	    /*Èç¹ûÅÆÐÍͬʱΪ½«ÅƺÍ˳×ӣ¬ÔòÓпÉÄܻáÖظ´£¬²»Öظ´¼ÆËã*/
	    for (var j:int= start; j < end; j++){
	        for (var k:int= 0; k < gamehu[j].len; k++)
	        {
	            if (gamehu[j].complex[k].id == i){
	                if (gamehu[j].complex[k].type == CardCode.COM_PENG) {
	                	haspeng = true; break;
	                }
	                if (gamehu[j].complex[k].type == CardCode.COM_JIANG) {
	                	hasjiang = true; break;
	                }
	            }
	            if (gamehu[j].complex[k].id > i)
	                break;
	        }
	        if (haspeng || hasjiang) break;
	    }
	    //¿Ì×Ó
	    if (!haspeng && pai[i] >= 3) {
	        pai[i] -= 3;
	        remain -= 3;
	        curhu.push(CardCode.COM_PENG, CardCode.COM_KE, i);
	        pos = hu_result(pai, remain, jiang, gamehu, huType, pos);
	        curhu.pop();
	        remain += 3;
	        pai[i] += 3;
	    }
	    //½«ÅÆ
	    if (!hasjiang && jiang == 0&& pai[i] >= 2) {
	        jiang = 1;
	        pai[i] -= 2;
	        remain -= 2;
	        curhu.push(CardCode.COM_JIANG, 0, i);
	        pos = hu_result(pai, remain, jiang, gamehu, huType, pos);
	        curhu.pop();
	        remain += 2;
	        pai[i] += 2;
	        jiang = 0;
	    }
	    return pos;
	}

}
}