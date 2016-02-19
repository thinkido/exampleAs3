
package jing.pai.consts;

import java.util.Hashtable;

public class GBHuType
{

	static public final String[] HU_TXT = {
		"无",
		"自摸",
		"单钓将",
		"坎张",
		"边张",
		"无字",
		"缺一门",
		"明杠",
		"幺九刻",
		"老少副",
		"连六",
		"喜相逢",
		"一般高",
		"断幺",
		"暗杠",
		"双暗刻",
		"双同刻",
		"四归一",
		"平和",
		"门前清",
		"门风刻",
		"圈风刻",
		"箭刻",
		"绝张",
		"双明杠",
		"不求人",
		"全带幺",
		"双箭刻",
		"双暗杠",
		"全求人",
		"五门齐",
		"三色三步高",
		"混一色",
		"碰碰和",
		"抢杠和",
		"杠上开花",
		"海底捞月",
		"妙手回春",
		"无番和",
		"三色三节高",
		"三色三同顺",
		"推不倒",
		"花龙",
		"三风刻",
		"小于五",
		"大于五",
		"组合龙",
		"全不靠",
		"三暗刻",
		"三同刻",
		"全带五",
		"一色三步高",
		"三色双龙会",
		"清龙",
		"全小",
		"全中",
		"全大",
		"一色三节高",
		"一色三同顺",
		"清一色",
		"全双",
		"七星不靠",
		"七对",
		"混幺九",
		"三杠",
		"一色四步高",
		"一色四节高",
		"一色四同顺",
		"一色双龙会",
		"四暗刻",
		"字一色",
		"小三元",
		"小四喜",
		"清幺九",
		"十三幺",
		"连七对",
		"四杠",
		"九莲宝灯",
		"绿一色",
		"大三元",
		"大四喜",
	};

	/*
	 * 1番
	 */
	static public final int HU_ZI_MO = 1;// 自摸

	static public final int HU_DAN_DIAO_JIANG = 2;// 单钓将

	static public final int HU_KAN_ZHANG = 3;// 坎张

	static public final int HU_BIAN_ZHANG = 4;// 边张

	static public final int HU_WU_ZI = 5;// 无字

	static public final int HU_QUE_YI_MEN = 6;// 缺一门

	static public final int HU_MING_GANG = 7;// 明杠

	static public final int HU_YAO_JIU = 8;// 幺九刻

	static public final int HU_LAO_SHAO_JIANG = 9;// 老少副

	static public final int HU_LIAN_LIU = 10;// 连六

	static public final int HU_XI_XIANG_FENG = 11;// 喜相逢

	static public final int HU_YI_BAN_GAO = 12;// 一般高

	/*
	 * 2番
	 */
	static public final int HU_DUAN_YAO = 13;// 断幺

	static public final int HU_AN_GANG = 14;// 暗杠

	static public final int HU_SHUANG_AN_KE = 15;// 双暗刻

	static public final int HU_SHUANG_TONG_KE = 16;// 双同刻

	static public final int HU_SHI_GUI_YI = 17;// 四归一

	static public final int HU_PING_HU = 18;// 平和

	static public final int HU_MEN_QI_QING = 19;// 门前清

	static public final int HU_MEN_FENG_KE = 20;// 门风刻

	static public final int HU_QUAN_FENG_KE = 21;// 圈风刻

	static public final int HU_JIAN_KE = 22;// 箭刻

	/*
	 * 4番
	 */
	static public final int HU_JUE_ZHANG = 23;// 绝张

	static public final int HU_SHUANG_MING_GANG = 24;// 双明杠

	static public final int HU_BU_QIU_REN = 25;// 不求人

	static public final int HU_QUAN_DAI_YAO = 26;// 全带幺

	/*
	 * 6番
	 */
	static public final int HU_SHUANG_JIAN_KE = 27;// 双箭刻

	static public final int HU_SHUANG_AN_GANG = 28;// 双暗杠

	static public final int HU_QUAN_QIU_REN = 29;// 全求人

	static public final int HU_WU_MEN_QI = 30;// 五门齐

	static public final int HU_SAN_SE_BU = 31;// 三色三步高

	static public final int HU_HUN_YI_SE = 32;// 混一色

	static public final int HU_PENG_PENG = 33;// 碰碰和

	/*
	 * 8番
	 */
	static public final int HU_QIANG_GANG = 34;// 抢杠和

	static public final int HU_GANG_KAI = 35;// 杠上开花

	static public final int HU_HAI_DI = 36;// 海底捞月

	static public final int HU_MIAO_SHOU = 37;// 妙手回春

	static public final int HU_WU_FAN = 38;// 无番和

	static public final int HU_SAN_SE_JIE = 39;// 三色三节高

	static public final int HU_SAN_SE_TONG = 40;// 三色三同顺

	static public final int HU_TUI_BU_DAO = 41;// 推不倒

	static public final int HU_HUA_LONG = 42;// 花龙

	/*
	 * 12番
	 */
	static public final int HU_SAN_FENG_KE = 43;// 三风刻

	static public final int HU_XIAO_WU = 44;// 小于五

	static public final int HU_DA_WU = 45;// 大于五

	static public final int HU_ZU_HE_LONG = 46;// 组合龙

	static public final int HU_QUAN_BU_KAO = 47;// 全不靠

	/*
	 * 16番
	 */
	static public final int HU_SAN_AN_KE = 48;// 三暗刻

	static public final int HU_SAN_TONG_KE = 49;// 三同刻

	static public final int HU_QUAN_DAI_WU = 50;// 全带五

	static public final int HU_YI_SE_BU = 51;// 一色三步高

	static public final int HU_SAN_SE_SHUANG = 52;// 三色双龙会

	static public final int HU_QING_LONG = 53;// 清龙

	/*
	 * 24番
	 */
	static public final int HU_QUAN_XIAO = 54;// 全小

	static public final int HU_QUAN_ZHONG = 55;// 全中

	static public final int HU_QUAN_DA = 56;// 全大

	static public final int HU_YI_SE_JIE = 57;// 一色三节高

	static public final int HU_YI_SE_TONG = 58;// 一色三同顺

	static public final int HU_QING_YI_SE = 59;// 清一色

	static public final int HU_QUAN_SHUANG = 60;// 全双

	static public final int HU_QI_XING_BU_KAO = 61;// 七星不靠

	static public final int HU_QI_DUI = 62;// 七对

	/*
	 * 32番
	 */
	static public final int HU_HUN_YAO = 63;// 混幺九

	static public final int HU_SAN_GANG = 64;// 三杠

	static public final int HU_YI_SHI_BU = 65;// 一色四步高

	/*
	 * 48番
	 */
	static public final int HU_YI_SHI_JIE = 66;// 一色四节高

	static public final int HU_YI_SHI_TONG = 67;// 一色四同顺

	/*
	 * 64番
	 */
	static public final int HU_YI_SE_SHUANG = 68;// 一色双龙会

	static public final int HU_SI_AN_KE = 69;// 四暗刻

	static public final int HU_ZI_YI_SE = 70;// 字一色

	static public final int HU_XIAO_SAN_YUAN = 71;// 小三元

	static public final int HU_XIAO_SHI_XI = 72;// 小四喜

	static public final int HU_QING_YAO_JIU = 73;// 清幺九

	/*
	 * 88番
	 */
	static public final int HU_SHI_SAN_YAO = 74;// 十三幺

	static public final int HU_LIAN_QI_DUI = 75;// 连七对

	static public final int HU_SI_GANG = 76;// 四杠

	static public final int HU_JIU_LIAN_DENG = 77;// 九莲宝灯

	static public final int HU_LU_YI_SE = 78;// 绿一色

	static public final int HU_DA_SAN_YUAN = 79;// 大三元

	static public final int HU_DA_SHI_XI = 80;// 大四喜
	
	public static Hashtable filter = null;
	
	static public Hashtable getHuTypeFilterMap() {
		if (filter != null) {
			return filter;
		}
		filter = new Hashtable();
		//1、大四喜 => 圈风刻、门风刻、三风刻、碰碰和、幺九刻
		filter.put(new Integer(HU_DA_SHI_XI + 1 * 1000), new Integer(HU_QUAN_FENG_KE));
		filter.put(new Integer(HU_DA_SHI_XI + 2 * 1000), new Integer(HU_MEN_FENG_KE));
		filter.put(new Integer(HU_DA_SHI_XI + 3 * 1000), new Integer(HU_SAN_FENG_KE));
		filter.put(new Integer(HU_DA_SHI_XI + 4 * 1000), new Integer(HU_PENG_PENG));
		filter.put(new Integer(HU_DA_SHI_XI + 5 * 1000), new Integer(HU_YAO_JIU));
		//2、大三元 => 双箭刻、箭刻
		filter.put(new Integer(HU_DA_SAN_YUAN + 1 * 1000), new Integer(HU_SHUANG_JIAN_KE));
		filter.put(new Integer(HU_DA_SAN_YUAN + 2 * 1000), new Integer(HU_JIAN_KE));
		// 3、绿一色
		// 4、九莲宝灯 => 清一色、门前清、幺九刻
		filter.put(new Integer(HU_JIU_LIAN_DENG + 1 * 1000), new Integer(
				HU_QING_YI_SE));
		filter.put(new Integer(HU_JIU_LIAN_DENG + 2 * 1000), new Integer(
				HU_MEN_QI_QING));
		filter.put(new Integer(HU_JIU_LIAN_DENG + 3 * 1000), new Integer(
				HU_YAO_JIU));
		// 5、四杠
		// 6、连七对 => 七对、清一色、不求人、单钓
		filter.put(new Integer(HU_LIAN_QI_DUI + 1 * 1000), new Integer(
				HU_QI_DUI));
		filter.put(new Integer(HU_LIAN_QI_DUI + 2 * 1000), new Integer(
				HU_QING_YI_SE));
		filter.put(new Integer(HU_LIAN_QI_DUI + 3 * 1000), new Integer(
				HU_BU_QIU_REN));
		filter.put(new Integer(HU_LIAN_QI_DUI + 4 * 1000), new Integer(
				HU_DAN_DIAO_JIANG));
		// 7、十三幺 => 五门齐、门前清、单钓
		filter.put(new Integer(HU_SHI_SAN_YAO + 1 * 1000), new Integer(
				HU_WU_MEN_QI));
		filter.put(new Integer(HU_SHI_SAN_YAO + 2 * 1000), new Integer(
				HU_MEN_QI_QING));
		filter.put(new Integer(HU_SHI_SAN_YAO + 3 * 1000), new Integer(
				HU_DAN_DIAO_JIANG));
		// 8、清幺九 => 碰碰和、全带幺、幺九刻、无字
		filter.put(new Integer(HU_QING_YAO_JIU + 1 * 1000), new Integer(
				HU_PENG_PENG));
		filter.put(new Integer(HU_QING_YAO_JIU + 2 * 1000), new Integer(
				HU_QUAN_DAI_YAO));
		filter.put(new Integer(HU_QING_YAO_JIU + 3 * 1000), new Integer(
				HU_YAO_JIU));
		filter.put(new Integer(HU_QING_YAO_JIU + 4 * 1000), new Integer(
				HU_WU_ZI));
		// 9、小四喜 => 三风刻
		filter.put(new Integer(HU_XIAO_SHI_XI + 1 * 1000), new Integer(
				HU_SAN_FENG_KE));
		// 10、小三元 => 箭刻
		filter.put(new Integer(HU_XIAO_SAN_YUAN + 1 * 1000), new Integer(
				HU_JIAN_KE));
		// 11、字一色 => 碰碰和
		filter.put(new Integer(HU_ZI_YI_SE + 1 * 1000), new Integer(
				HU_PENG_PENG));
		// 12、四暗刻 => 门前清、碰碰和
		filter.put(new Integer(HU_SI_AN_KE + 1 * 1000), new Integer(
				HU_MEN_QI_QING));
		filter.put(new Integer(HU_SI_AN_KE + 2 * 1000), new Integer(
				HU_PENG_PENG));
		// 13、一色双龙会 => 平和、七对、清一色
		filter.put(new Integer(HU_YI_SE_SHUANG + 1 * 1000), new Integer(
				HU_PING_HU));
		filter.put(new Integer(HU_YI_SE_SHUANG + 2 * 1000), new Integer(
				HU_QI_DUI));
		filter.put(new Integer(HU_YI_SE_SHUANG + 3 * 1000), new Integer(
				HU_QING_YI_SE));
		// 14、一色四同顺 => 三杠、一色三节高、一般高、四归一
		filter.put(new Integer(HU_YI_SHI_TONG + 1 * 1000), new Integer(
				HU_SAN_GANG));
		filter.put(new Integer(HU_YI_SHI_TONG + 2 * 1000), new Integer(
				HU_YI_SE_JIE));
		filter.put(new Integer(HU_YI_SHI_TONG + 3 * 1000), new Integer(
				HU_YI_BAN_GAO));
		filter.put(new Integer(HU_YI_SHI_TONG + 4 * 1000), new Integer(
				HU_SHI_GUI_YI));
		// 15、一色四节高 => 一色三同顺、碰碰和
		filter.put(new Integer(HU_YI_SHI_JIE + 1 * 1000), new Integer(
				HU_YI_SE_TONG));
		filter.put(new Integer(HU_YI_SHI_JIE + 2 * 1000), new Integer(
				HU_PENG_PENG));
		// 16、一色四步高
		// 17、三杠
		// 18、混幺九 => 碰碰和
		filter.put(new Integer(HU_HUN_YAO + 1 * 1000),
				new Integer(HU_PENG_PENG));
		// 19、七对 => 门前清、单钓
		filter.put(new Integer(HU_QI_DUI + 1 * 1000), new Integer(
						HU_WU_MEN_QI));
		filter.put(new Integer(HU_QI_DUI + 2 * 1000), new Integer(
				HU_DAN_DIAO_JIANG));
		// 20、七星不靠 => 五门齐、门前清、单钓
		filter.put(new Integer(HU_QI_XING_BU_KAO + 1 * 1000), new Integer(
				HU_WU_MEN_QI));
		filter.put(new Integer(HU_QI_XING_BU_KAO + 2 * 1000), new Integer(
				HU_MEN_QI_QING));
		filter.put(new Integer(HU_QI_XING_BU_KAO + 3 * 1000), new Integer(
				HU_DAN_DIAO_JIANG));
		// 21、全双刻 => 碰碰和、断幺
		filter.put(new Integer(HU_QUAN_SHUANG + 1 * 1000), new Integer(
				HU_PENG_PENG));
		filter.put(new Integer(HU_QUAN_SHUANG + 2 * 1000), new Integer(
				HU_DUAN_YAO));
		// 22、清一色 => 无字
		filter.put(new Integer(HU_QING_YI_SE + 1 * 1000), new Integer(
						HU_WU_ZI));
		// 23、一色三同顺 => 一色三节高
		filter.put(new Integer(HU_YI_SE_TONG + 1 * 1000), new Integer(
				HU_YI_SE_JIE));
		// 24、一色三节高 => 一色三同顺
		filter.put(new Integer(HU_YI_SE_JIE + 1 * 1000), new Integer(
				HU_YI_SE_TONG));
		// 25、全大 => 无字
		filter.put(new Integer(HU_QUAN_DA + 1 * 1000), new Integer(HU_WU_ZI));
		// 26、全中 => 断幺
		filter.put(new Integer(HU_QUAN_ZHONG + 1 * 1000), new Integer(
				HU_DUAN_YAO));
		// 27、全小 => 无字
		filter.put(new Integer(HU_QUAN_XIAO + 1 * 1000), new Integer(HU_WU_ZI));
		// 28、清龙
		// 29、三色双龙会 => 喜相逢、老少副、无字、平和
		filter.put(new Integer(HU_SAN_SE_SHUANG + 1 * 1000), new Integer(
				HU_XI_XIANG_FENG));
		filter.put(new Integer(HU_SAN_SE_SHUANG + 2 * 1000), new Integer(
				HU_LAO_SHAO_JIANG));
		filter.put(new Integer(HU_SAN_SE_SHUANG + 3 * 1000), new Integer(
				HU_WU_ZI));
		filter.put(new Integer(HU_SAN_SE_SHUANG + 4 * 1000), new Integer(
				HU_PING_HU));
		// 30、一色三步高 =>
		// 31、全带五 => 断幺
		filter.put(new Integer(HU_QUAN_DAI_WU + 1 * 1000), new Integer(
				HU_DUAN_YAO));
		// 32、三同刻
		// 33、三暗刻
		// 34、全不靠 => 五门齐、门前清、单钓
		filter.put(new Integer(HU_QUAN_BU_KAO + 1 * 1000), new Integer(
				HU_WU_MEN_QI));
		filter.put(new Integer(HU_QUAN_BU_KAO + 2 * 1000), new Integer(
				HU_MEN_QI_QING));
		filter.put(new Integer(HU_QUAN_BU_KAO + 3 * 1000), new Integer(
				HU_DAN_DIAO_JIANG));
		// 35、组合龙
		// 36、大于五 => 无字
		filter.put(new Integer(HU_DA_WU + 1 * 1000), new Integer(HU_WU_ZI));
		// 37、小于五 => 无字
		filter.put(new Integer(HU_XIAO_WU + 1 * 1000), new Integer(HU_WU_ZI));
		// 38、三风刻
		// 39、花龙
		// 40、推不倒 => 缺一门
		filter.put(new Integer(HU_TUI_BU_DAO + 1 * 1000), new Integer(
				HU_QUE_YI_MEN));
		// 41、三色三同顺
		// 42、三色三节高
		// 43、无番和
		// 44、妙手回春 => 自摸
		filter.put(new Integer(HU_MIAO_SHOU + 1 * 1000), new Integer(HU_ZI_MO));
		// 45、海底捞月
		// 46、杠上开花 => 自摸
		filter.put(new Integer(HU_GANG_KAI + 1 * 1000), new Integer(HU_ZI_MO));
		// 47、抢杠和 => 和绝张
		filter.put(new Integer(HU_QIANG_GANG + 1 * 1000), new Integer(
				HU_JUE_ZHANG));
		// 48、碰碰和
		// 49、混一色
		// 50、三色三步高
		// 51、五门齐
		// 52、全求人 => 单钓
		filter.put(new Integer(HU_QUAN_QIU_REN + 1 * 1000), new Integer(
				HU_DAN_DIAO_JIANG));
		// 53、双暗杠
		// 54、双箭刻
		// 55、全带幺
		// 56、不求人
		// 57、双明杠
		// 58、和绝张
		// 59、箭刻
		// 60、圈风刻
		// 61、门风刻
		// 62、门前清
		// 63、平和
		filter.put(new Integer(HU_PING_HU + 1 * 1000), new Integer(HU_WU_ZI));
		// 64、四归一
		// 65、双同刻
		// 66、双暗刻
		// 67、暗杠
		// 68、断幺
		// 69、一般高
		// 70、喜相逢
		// 71、连六
		// 72、老少副
		// 73、幺九刻
		// 74、明杠
		// 75、缺一门
		// 76、无字
		// 77、边张
		// 78、坎张
		// 79、单钓将
		// 80、自摸
		
		return filter;
	}
	
}
