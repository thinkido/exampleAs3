package jing.pai.helper
{
import jing.pai.consts.CardCode;
import jing.pai.consts.GBHuType;
import jing.pai.model.CardKe;
import jing.pai.model.CardVector;
import jing.pai.utils.GuoBiaoCardsParser;
import jing.pai.utils.GuoBiaoCardsParser.GameHu;
import jing.pai.vo.HuVO;

/**
 * ¸ù¾ÝÅÆÐÍËã³öºúÅÆ BUG: 1.½«¶ÔÓдíÎó£¬Ӧ¸ÃÊǶԶԺúΪ»ù´¡
 * 
 * @param cards
 */
public class HuHelp
{
	public function HuHelp()
	{


	}

	public function getHu(inHands:CardVector, onTables:Array, huCard:int):HuVO{
		int pai[] = new int[48];
		
		for (var i:int= 0; i < inHands.count(); i++) {
			pai[inHands.getAt(i)] += 1;
		}
		pai[huCard] += 1;
		return getHu(pai, onTables.length, onTables, 0, 0);
		
	}
	public function getHu(int pai[], complex_length:int, CardKe complex[], hu_tile:int, mo:int):HuVO{
		var result:HuVO= new HuVO();
	    var flag:Boolean= false;
	    var gamehu:Array= new GuoBiaoCardsParser.GameHu[CardCode.HU_MAX_NUM];
	    for (var i:int= 0; i < gamehu.length; i++) {
	    	gamehu[i] = new GuoBiaoCardsParser.GameHu();
	    }
	    var gamehu_len:int= 0;
	    /*
	    //    ÌØÊⷬÐÍ
	    */
	    //Á¬Æ߶Ô
	    if (HuTypeParser.is_lian_qi_dui(pai))
	    {
	    	result.add_result(GBHuType.HU_LIAN_QI_DUI, 88);
	    }
	    //ʮÈýçÛ
	    if (HuTypeParser.is_shi_san_yao(pai)) {
	    	result.add_result(GBHuType.HU_SHI_SAN_YAO, 88);
	    }
	    //ÆßÐǲ»¿¿
	    if (HuTypeParser.is_qi_xing_bu_kao(pai)) {
	        result.add_result(GBHuType.HU_QI_XING_BU_KAO, 24);
	    }
	    //ȫ²»¿¿
	    if (HuTypeParser.is_quan_bu_kao(pai)){
	        result.add_result(GBHuType.HU_QUAN_BU_KAO, 12);
	    }
	    //×éºÏÁú
	    if (HuTypeParser.is_zu_he_long(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_ZU_HE_LONG, 12);
	    }
	    //ÆßС¶ÔÅÆ
	    if (HuTypeParser.is_qi_dui(pai)) {
	        result.add_result(GBHuType.HU_QI_DUI, 24);
	    }
	    //Èýɫ˫Áú»á
	    if (HuTypeParser.is_san_se_shuang_long_hui(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_SAN_SE_SHUANG, 16);
	    }
	    //ÅжÏÊǷñºú
	    flag = GuoBiaoCardsParser.hu(pai, GuoBiaoCardsParser.tileRemain(pai), 0);
	    if (flag) {
	        //·ÖÎöºúÅƵĸ÷ÖÖÇé¿ö
	    	var huType:GameHu= new GameHu();
	    	gamehu_len = GuoBiaoCardsParser.hu_result(pai, GuoBiaoCardsParser.tileRemain(pai), 0, gamehu, huType, gamehu_len);
	    }
	    if (!flag) {
	        return result;
	    }
	    
	    var com_hu:Array;
	    var com_len:int= 0;
	    var mul_hu:Array= new int[35];

	    //ÅÆÐͷÖÎö
	    for (var i:int= 0; i < gamehu_len; i++)
	    {
	        for (var j:int= 0; j < complex_length; j++) {
	        	gamehu[i].push(complex[j].type, complex[j].type2, complex[j].id);
	        }
	        
	        com_hu = gamehu[i].complex;
	        com_len = gamehu[i].len;
	        /*
	        //    ÅжϷ¬ÐÍ
	        */
	        //Çåç۾Å
	        if (mul_hu[0] == 0&& HuTypeParser.is_qing_yao_jiu(com_hu, com_len)) {
	            mul_hu[0] = 1;
	            result.add_result(GBHuType.HU_QING_YAO_JIU, 64);
	        }
	        //һɫËÄͬ˳
	        if (mul_hu[1] == 0&& HuTypeParser.is_yi_se_si_tong_shun(com_hu, com_len)) {
	            mul_hu[1] = 1;
	            result.add_result(GBHuType.HU_YI_SHI_TONG, 48);
	        }
	        //һɫËĽڸß
	        if (mul_hu[2] == 0&& HuTypeParser.is_yi_se_si_jie_gao(com_hu, com_len)) {
	            mul_hu[2] = 1;
	            result.add_result(GBHuType.HU_YI_SHI_JIE, 48);
	        }
	        //һɫËĲ½¸ß
	        if (mul_hu[3] == 0&& HuTypeParser.is_yi_se_si_bu_gao(com_hu, com_len)) {
	            mul_hu[3] = 1;
	            result.add_result(GBHuType.HU_YI_SHI_BU, 32);
	        }
	        //һɫÈýͬ˳
	        if (mul_hu[4] == 0&& HuTypeParser.is_yi_se_san_tong_shun(com_hu, com_len)) {
	            mul_hu[4] = 1;
	            result.add_result(GBHuType.HU_YI_SE_TONG, 24);
	        }
	        //һɫÈý½ڸß
	        if (mul_hu[5] == 0&& HuTypeParser.is_yi_se_san_jie_gao(com_hu, com_len)) {
	            mul_hu[5] = 1;
	            result.add_result(GBHuType.HU_YI_SE_JIE, 24);
	        }
	        //һɫÈ񲽸ß
	        if (mul_hu[6] == 0&& HuTypeParser.is_yi_se_san_bu_gao(com_hu, com_len)) {
	            mul_hu[6] = 1;
	            result.add_result(GBHuType.HU_YI_SE_BU, 16);
	        }
	        //ȫ´øÎå
	        if (mul_hu[7] == 0&& HuTypeParser.is_quan_dai_wu(com_hu, com_len)) {
	            mul_hu[7] = 1;
	            result.add_result(GBHuType.HU_QUAN_DAI_WU, 16);
	        }
	        //´óÓÚÎå
	        if (mul_hu[8] == 0&& HuTypeParser.is_da_yu_wu(com_hu, com_len)) {
	            mul_hu[8] = 1;
	            result.add_result(GBHuType.HU_DA_WU, 12);
	        }
	        //СÓÚÎå
	        if (mul_hu[9] == 0&& HuTypeParser.is_xiao_yu_wu(com_hu, com_len)) {
	            mul_hu[9] = 1;
	            result.add_result(GBHuType.HU_XIAO_WU, 12);
	        }
	        //Èý·ç¿Ì
	        if (mul_hu[10] == 0&& HuTypeParser.is_san_feng_ke(com_hu, com_len)) {
	            mul_hu[10] = 1;
	            result.add_result(GBHuType.HU_SAN_FENG_KE, 12);
	        }
	        //»¨Áú
	        if (mul_hu[11] == 0&& HuTypeParser.is_hua_long(com_hu, com_len)) {
	            mul_hu[11] = 1;
	            result.add_result(GBHuType.HU_HUA_LONG, 8);
	        }
	        //ÈýɫÈýͬ˳
	        if (mul_hu[12] == 0&& HuTypeParser.is_san_se_san_tong_shun(com_hu, com_len)) {
	            mul_hu[12] = 1;
	            result.add_result(GBHuType.HU_SAN_SE_TONG, 8);
	        }
	        //ÈýɫÈý½ڸß
	        if (mul_hu[13] == 0&& HuTypeParser.is_san_se_san_jie_gao(com_hu, com_len)) {
	            mul_hu[13] = 1;
	            result.add_result(GBHuType.HU_SAN_SE_JIE, 8);
	        }
	        //ÅöÅöºÍ
	        if (mul_hu[14] == 0&& HuTypeParser.is_peng_peng_hu(com_hu, com_len)) {
	            mul_hu[14] = 1;
	            result.add_result(GBHuType.HU_PENG_PENG, 6);
	        }
	        //ÈýɫÈ񲽸ß
	        if (mul_hu[15] == 0&& HuTypeParser.is_san_se_san_bu_gao(com_hu, com_len)) {
	            mul_hu[15] = 1;
	            result.add_result(GBHuType.HU_SAN_SE_BU, 6);
	        }
	        //˫¼ý¿Ì
	        if (mul_hu[16] == 0&& HuTypeParser.is_shuang_jian_ke(com_hu, com_len)) {
	            mul_hu[16] = 1;
	            result.add_result(GBHuType.HU_SHUANG_JIAN_KE, 6);
	        }
	        //ȫ´øçÛ
	        if (mul_hu[17] == 0&& HuTypeParser.is_quan_dai_yao(com_hu, com_len)) {
	            mul_hu[17] = 1;
	            result.add_result(GBHuType.HU_QUAN_DAI_YAO, 4);
	        }
	        //¼ý¿Ì
	        if (mul_hu[18] == 0&& HuTypeParser.is_jian_ke(com_hu, com_len)) {
	            mul_hu[18] = 1;
	            result.add_result(GBHuType.HU_JIAN_KE, 2);
	        }
	        //ƽºÍ
	        if (mul_hu[19] == 0&& HuTypeParser.is_ping_hu(com_hu, com_len)) {
	            mul_hu[19] = 1;
	            result.add_result(GBHuType.HU_PING_HU, 2);
	        }
	        //˫ͬ¿Ì
	        if (mul_hu[20] == 0&& HuTypeParser.is_shuang_tong_ke(com_hu, com_len)) {
	            mul_hu[20] = 1;
	            result.add_result(GBHuType.HU_SHUANG_TONG_KE, 2);
	        }
	        //˫°µ¿Ì
	        if (mul_hu[21] == 0&& HuTypeParser.is_shuang_an_ke(com_hu, com_len)) {
	            mul_hu[21] = 1;
	            result.add_result(GBHuType.HU_SHUANG_AN_KE, 2);
	        }
	        //һ°ã¸ß
	        if (mul_hu[22] == 0&& HuTypeParser.is_yi_ban_gao(com_hu, com_len)) {
	            mul_hu[22] = 1;
	            result.add_result(GBHuType.HU_YI_BAN_GAO, 1);
	        }
	        //ϲÏà·ê
	        if (mul_hu[23] == 0&& HuTypeParser.is_xi_xiang_feng(com_hu, com_len)) {
	            mul_hu[23] = 1;
	            result.add_result(GBHuType.HU_XI_XIANG_FENG, 1);
	        }
	        //Á¬Áù
	        if (mul_hu[24] == 0&& HuTypeParser.is_lian_liu(com_hu, com_len)) {
	            mul_hu[24] = 1;
	            result.add_result(GBHuType.HU_LIAN_LIU, 1);
	        }
	        //ÀÏÉٸ±
	        if (mul_hu[25] == 0&& HuTypeParser.is_lao_shao_fu(com_hu, com_len)) {
	            mul_hu[25] = 1;
	            result.add_result(GBHuType.HU_LAO_SHAO_JIANG, 1);
	        }
	        //ç۾ſÌ
	        if (mul_hu[26] == 0&& HuTypeParser.is_yao_jiu_ke(com_hu, com_len)) {
	            mul_hu[26] = 1;
	            result.add_result(GBHuType.HU_YAO_JIU, 1);
	        }
	        //±ßÕÅ
	        if (mul_hu[27] == 0&& HuTypeParser.is_bian_zhang(com_hu, com_len, hu_tile)) {
	            mul_hu[27] = 1;
	            result.add_result(GBHuType.HU_BIAN_ZHANG, 1);
	        }
	        //¿²ÕÅ
	        if (mul_hu[28] == 0&& HuTypeParser.is_kan_zhang(com_hu, com_len, hu_tile)) {
	            mul_hu[28] = 1;
	            result.add_result(GBHuType.HU_KAN_ZHANG, 1);
	        }
	        //µ¥µö½«
	        if (mul_hu[29] == 0&& HuTypeParser.is_dan_diao_jiang(com_hu, com_len, hu_tile)) {
	            mul_hu[29] = 1;
	            result.add_result(GBHuType.HU_DAN_DIAO_JIANG, 1);
	        }
	        //ËĹéһ
	        if (mul_hu[30] == 0&& HuTypeParser.is_si_gui_yi(com_hu, com_len)) {
	            mul_hu[30] = 1;
	            result.add_result(GBHuType.HU_SHI_GUI_YI, 1);
	        }
	    }
	    com_hu = gamehu[0].complex;
	    com_len = gamehu[0].len;
	    /*
	    //    ÅжϷ¬Ðͣ¬ÕâЩÅÆÐÍֻÐèÅжÏһÖÖÇé¿򼴿É
	    */
	    //ÂÌһɫ
	    if (HuTypeParser.is_lv_yi_se(com_hu, com_len)) {
	        result.add_result(GBHuType.HU_LU_YI_SE, 88);
	    }

	    /*
	    //    ÅжϷ¬ÐÍ
	    */
	    //´óËÄϲ
	    if (HuTypeParser.is_da_si_xi(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_DA_SHI_XI, 88);
	    }
	    //´óÈýԪ
	    if (HuTypeParser.is_da_san_yuan(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_DA_SAN_YUAN, 88);
	    }
	    //Ëİµ¿Ì
	    if (HuTypeParser.is_si_an_ke(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_SI_AN_KE, 64);
	    }
	    //СËÄϲ
	    if (HuTypeParser.is_xiao_si_xi(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_XIAO_SHI_XI, 64);
	    }
	    //СÈýԪ
	    if (HuTypeParser.is_xiao_san_yuan(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_XIAO_SAN_YUAN, 64);
	    }
	    //×ÖһɫÅÆ
	    if (HuTypeParser.is_zi_yi_se(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_ZI_YI_SE, 64);
	    }
	    //һɫ˫Áú»á
	    if (HuTypeParser.is_yi_se_shuang_long_hui(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_YI_SE_SHUANG, 64);
	    }
	    //»ìç۾Å
	    if (HuTypeParser.is_hun_jiu_yao(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_HUN_YAO, 32);
	    }
	    //ȫ˫¿Ì
	    if (HuTypeParser.is_quan_shuang_ke(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_QUAN_SHUANG, 24);
	    }
	    
	    //Èýͬ¿Ì
	    if (HuTypeParser.is_san_tong_ke(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_SAN_TONG_KE, 16);
	    }
	    //È񰵿Ì
	    if (HuTypeParser.is_san_an_ke(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_SAN_AN_KE, 16);
	    }
	    //ÇåÁú
	    if (HuTypeParser.is_qing_long(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_QING_LONG, 16);
	    }
	    //¾ÅÁ«±¦µÆ
	    if (HuTypeParser.is_jiu_lian_bao_deng(pai, complex, complex_length, hu_tile)) {
	        result.add_result(GBHuType.HU_JIU_LIAN_DENG, 88);
	    }
	    //ËĸÜ
	    if (HuTypeParser.is_si_gang(complex, complex_length)) {
	        result.add_result(GBHuType.HU_SI_GANG, 88);
	    }
	    //˫°µ¸Ü
	    if (HuTypeParser.is_shuang_an_gang(complex, complex_length)) {
	        result.add_result(GBHuType.HU_SHUANG_AN_GANG, 6);
	    }
	    //˫Ã÷¸Ü
	    if (HuTypeParser.is_shuang_ming_gang(complex, complex_length)) {
	        result.add_result(GBHuType.HU_SHUANG_MING_GANG, 4);
	    }
	    //°µ¸Ü
	    if (HuTypeParser.is_an_gang(complex, complex_length)) {
	        result.add_result(GBHuType.HU_AN_GANG, 2);
	    }
	    //Ã÷¸Ü
	    if (HuTypeParser.is_ming_gang(complex, complex_length)) {
	        result.add_result(GBHuType.HU_MING_GANG, 1);
	    }
	    //Èý¸Ü
	    if (HuTypeParser.is_san_gang(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_SAN_GANG, 32);
	    }
	    //ȫ´ó
	    if (HuTypeParser.is_quan_da(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_QUAN_DA, 24);
	    }
	    //ȫÖÐ
	    if (HuTypeParser.is_quan_zhong(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_QUAN_ZHONG, 24);
	    }
	    //ȫС
	    if (HuTypeParser.is_quan_xiao(pai, complex, complex_length)) {
	        result.add_result(GBHuType.HU_QUAN_XIAO, 24);
	    }

	    if (mo == 1) {
	        //²»ÇóÈË
	        if (HuTypeParser.is_bu_qiu_ren(complex, complex_length)) {
	            result.add_result(GBHuType.HU_BU_QIU_REN, 4);
	        }
	    }
	    else {
	        //ÃÅǰÇå
	        if (HuTypeParser.is_men_qian_qing(complex, complex_length)) {
	            result.add_result(GBHuType.HU_MEN_QI_QING, 2);
	        }
	    }

	    if (gamehu_len != 0)
	    {
	        /*
	        //    ÅжϷ¬ÐÍ
	        */
	        //ÍƲ»µ¹
	        if (HuTypeParser.is_tui_bu_dao(pai, complex, complex_length)) {
	            result.add_result(GBHuType.HU_TUI_BU_DAO, 8);
	        }
	        //ÇåһɫÅÆ
	        if (HuTypeParser.is_qing_yi_se(pai, complex, complex_length)) {
	            result.add_result(GBHuType.HU_QING_YI_SE, 24);
	        }
	        
	        //ÎÞ×Ö
	        if (HuTypeParser.is_wu_zi(com_hu, com_len)) {
	            result.add_result(GBHuType.HU_WU_ZI, 1);
	        }
	        //ȱһÃÅ
	        if (HuTypeParser.is_que_yi_men(com_hu, com_len)) {
	            result.add_result(GBHuType.HU_QUE_YI_MEN, 1);
	        }
	        //¶ÏçÛ
	        if (HuTypeParser.is_duan_yao(com_hu, com_len)) {
	            result.add_result(GBHuType.HU_DUAN_YAO, 2);
	        }
	        //ȫÇóÈË
	        if (HuTypeParser.is_quan_qiu_ren(pai, complex, complex_length)) {
	            result.add_result(GBHuType.HU_QUAN_QIU_REN, 6);
	        }
	        //ÎåÃÅÆë
	        if (HuTypeParser.is_wu_men_qi(com_hu, com_len)) {
	            result.add_result(GBHuType.HU_WU_MEN_QI, 6);
	        }
	        //»ìһɫ
	        if (HuTypeParser.is_hu_yi_se(com_hu, com_len)) {
	            result.add_result(GBHuType.HU_HUN_YI_SE, 6);
	        }
	        //Î޷¬ºÍ
	        if (result.len == 0) {
	            result.add_result(GBHuType.HU_WU_FAN, 8);
	        }
	    }
	    return result;
;
	}

}
}