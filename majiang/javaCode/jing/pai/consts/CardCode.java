package jing.pai.consts;

/**
 * 牌的值
 * @author Jing
 *
 */
public class CardCode
{
	static public int W1 = 11;
	static public int W2 = 12;
	static public int W3 = 13;
	static public int W4 = 14;
	static public int W5 = 15;
	static public int W6 = 16;
	static public int W7 = 17;
	static public int W8 = 18;
	static public int W9 = 19;
	
	static public int O1 = 21;
	static public int O2 = 22;
	static public int O3 = 23;
	static public int O4 = 24;
	static public int O5 = 25;
	static public int O6 = 26;
	static public int O7 = 27;
	static public int O8 = 28;
	static public int O9 = 29;
	
	static public int I1 = 31;
	static public int I2 = 32;
	static public int I3 = 33;
	static public int I4 = 34;
	static public int I5 = 35;
	static public int I6 = 36;
	static public int I7 = 37;
	static public int I8 = 38;
	static public int I9 = 39;
	
	static public int DONG = 41;
	static public int NAN = 42;
	static public int XI = 43;
	static public int BEI = 44;
	static public int ZHONG = 45;
	static public int FA = 46;
	static public int BAI = 47;
	
	static public int HUA_1 = 51;
	static public int HUA_2 = 52;
	static public int HUA_3 = 53;
	static public int HUA_4 = 54;
	static public int HUA_5 = 55;
	static public int HUA_6 = 56;
	static public int HUA_7 = 57;
	static public int HUA_8 = 58;
	
	
	static public int  HAND_SEQS =  11;
	static public int  HAND_SEQE =  39;
	static public int  HAND_ZIS = 41;
	static public int  HAND_ZIE = 47;
	static public int  HAND_HUAS  = 51;
	static public int  HAND_HUAE  = 58;

	static public int  HAND_START = HAND_SEQS;
	/*花牌不会出现在手牌中*/
	static public int  HAND_LEN  = 48;

	static public int  COM_SIZE  =  5;

	//#define HAND_LEN    40

	static public int  COMPLEX_LEN = 10;

	static public int  HU_MAX_NUM = 20;

	static public int  HU_MAX_TYPE = 20;
	
	static public int  COM_PENG   = 1;
	static public int  COM_GANG   = 2;
	static public int  COM_CHI    = 4;//包含所有的连牌
	static public int  COM_JIANG  = 7;
	
	static public int  COM_PENG2     = 0;
	static public int  COM_KE        = 1;
	static public int  COM_MING_GANG = 2;
	static public int  COM_AN_GANG   = 3;
	static public int  COM_SEQ       = 4;/*手牌中的序牌*/
	static public int  COM_ZUO_CHI   = 5;/*左吃*/
	static public int  COM_MID_CHI   = 6;/*中吃*/
	static public int  COM_YOU_CHI   = 7;/*右吃*/
}
