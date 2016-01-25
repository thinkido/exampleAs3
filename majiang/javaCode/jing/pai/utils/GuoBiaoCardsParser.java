
package jing.pai.utils;


import jing.pai.consts.CardCode;
import jing.pai.model.CardKe;

/**
 * ���������
 * 
 * @author Jing
 */
public class GuoBiaoCardsParser
{

	public static class GameHu {
		public GameHu() {
			complex = new CardKe[100];
		}
		public CardKe[] complex;
		public int len;
		public void push(int type1, int type2, int id) {
			complex[len] = new CardKe(type1, type2, id);
			len++;
		}
		
		public void pop() {
			if (len > 0) {
				complex[len - 1] = null;
				len--;
			}
		}
	};
	
	private boolean is_hu = false;

	public boolean is_hu()
	{
		return is_hu;
	}


	public GuoBiaoCardsParser()
	{

	}

	/**
	 * ʣ������
	 * 
	 * @param cards
	 */
	public static int tileRemain(int[] pai) {
	    int sum = 0;
	    for (int i = CardCode.HAND_START; i < CardCode.HAND_LEN; i++) {
	        sum += pai[i];
	    }
	    return sum;
	}
	/**
	 * ��������
	 * 
	 * @param cards
	 */
	public void parse(int pai[], int remain, int jiang){
		if (hu(pai, remain, jiang)) {
			is_hu = true;
		}
	}
	public static boolean hu(int pai[], int remain, int jiang)
	{
	    if (remain == 0) return true; //�˳�������û��ʣ�ƣ������˳�

	    boolean result = false;
	    int i = CardCode.HAND_START;
	    for (; pai[i] == 0 && i < CardCode.HAND_LEN; i++); //�ҵ����Ƶĵط���iΪ��ǰ�ƣ�PAI[i] �Ǹ���

	    //����ѡ������һ����
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
	    //ѡ����
	    if (jiang == 0 && pai[i] >= 2) {
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
	    //˳��
	    if (i <= CardCode.HAND_SEQE - 2 && (i % 10 != 8 && i % 10 != 9) && pai[i + 1] != 0 && pai[i + 2] != 0) {
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
	

	public static int hu_result(int pai[], int remain, int jiang, GameHu[] gamehu, GameHu huType, int pos) {
	    GameHu curhu = huType;
	    int start = pos;
	    int end = 0;
	    boolean haspeng = false;
	    boolean hasjiang = false;
	    
	    if (remain == 0) {
	        if (pos < CardCode.HU_MAX_NUM) {
	        	for (int i = 0; i < curhu.len; i++) {
	        		gamehu[pos].push(curhu.complex[i].type, curhu.complex[i].type2, curhu.complex[i].id);
				}
	        	gamehu[pos].len = curhu.len;
	            pos++;
	        }
	        return pos; //�˳�������û��ʣ�ƣ������˳�
	    }
	    if (curhu.len >= CardCode.HU_MAX_NUM) {
	        return pos;
	    }
	    int i = CardCode.HAND_START;
	    for (; pai[i] == 0 && i < CardCode.HAND_LEN; i++); //�ҵ����Ƶĵط���iΪ��ǰ�ƣ�PAI[i] �Ǹ���

	    //˳��
	    if (i <= CardCode.HAND_SEQE - 2 && (i % 10 != 8 && i % 10 != 9) && pai[i + 1] != 0 && pai[i + 2] != 0) {
	        pai[i]--; pai[i + 1]--; pai[i + 2]--;
	        remain -= 3;
	        /*������ջ*/
	        curhu.push(CardCode.COM_CHI, CardCode.COM_SEQ, i);
	        pos = hu_result(pai, remain, jiang, gamehu, huType, pos);
	        curhu.pop();
	        pai[i]++; pai[i + 1]++; pai[i + 2]++;
	        remain += 3;
	    }
	    end = pos;
	    /*�������ͬʱΪ���ƺ�˳�ӣ����п��ܻ��ظ������ظ�����*/
	    for (int j = start; j < end; j++){
	        for (int k = 0; k < gamehu[j].len; k++)
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
	    //����
	    if (!haspeng && pai[i] >= 3) {
	        pai[i] -= 3;
	        remain -= 3;
	        curhu.push(CardCode.COM_PENG, CardCode.COM_KE, i);
	        pos = hu_result(pai, remain, jiang, gamehu, huType, pos);
	        curhu.pop();
	        remain += 3;
	        pai[i] += 3;
	    }
	    //����
	    if (!hasjiang && jiang == 0 && pai[i] >= 2) {
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
