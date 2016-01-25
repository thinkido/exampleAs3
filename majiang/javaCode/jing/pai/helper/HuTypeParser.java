package jing.pai.helper;

import jing.pai.consts.CardCode;
import jing.pai.model.CardKe;
import jing.pai.utils.GuoBiaoCardsParser;

public class HuTypeParser {
	
	public static void swap(int a[], int m, int n) {
		int tmp = a[m];
		a[m] = a[n];
		a[n] = tmp;
	}
	
	public static boolean is_san_se_seq(int id1, int id2, int id3) {
	    return ((id1 % 10 + 1 == id2 % 10) && (id2 % 10 + 1 == id3 % 10) 
	            && ((id1 / 10 != id2 / 10) && (id2 / 10 != id3 / 10) && (id1 / 10 != id3 / 10)));
	}
	

	/*����ϲ*/
	public static boolean is_da_si_xi(int pai[], CardKe complex[], int len) {
	    int handfeng = 0;
	    /*�����ϱ���*/
	    for (int i = CardCode.HAND_ZIS; i <= CardCode.HAND_ZIS + 3; i++){
	        if (pai[i] == 3) {
	            handfeng++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS && complex[j].id < CardCode.HAND_ZIS + 4)) {
	            handfeng++;
	        }
	    }
	    return (handfeng == 4);
	}

	/*����Ԫ*/
	public static boolean is_da_san_yuan(int pai[], CardKe complex[], int len) {
	    int handjian = 0;
	    /*�з���*/
	    for (int i = 4; i < 7; i++){
	        if (pai[i + CardCode.HAND_ZIS] == 3) {
	            handjian++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS + 4 && complex[j].id < CardCode.HAND_ZIS + 7)) {
	            handjian++;
	        }
	    }
	    return (handjian == 3);
	}

	public static boolean is_lv_se(int id){
	    int index = 0;
	    if (id == 46)return true;

	    if (id / 10 != 3){
	        return false;
	    }

	    index = id % 10;
	    if (index == 1 || index == 5 || index == 7 || index == 9){
	        return false;
	    }
	    return true;
	}

	/*��һɫ*/
	public static boolean is_lv_yi_se(CardKe comhu[], int comhu_len) {
	    for (int j = 0; j < comhu_len; j++){
	        int type = comhu[j].type;
	        int id = comhu[j].id;
	        if (type == CardCode.COM_CHI && id == 32) {
	            continue;
	        }
	        if ((type == CardCode.COM_PENG || type == CardCode.COM_GANG || type == CardCode.COM_JIANG) && is_lv_se(id)) {
	                continue;
	        }
	        return false;
	    }
	    return true;
	}

	/*��������*/
	public static boolean is_jiu_lian_bao_deng(int pai[], CardKe complex[], int len, int hu) {
	    int check_value[] = {3,1,1,1,1,1,1,1,3};
	    boolean result = false;
	    int start = 0;

	    pai[hu] -= 1;
	    //�������ܺ����ţ�����˳��һ����������
	    for (int i = CardCode.HAND_SEQS; i < CardCode.HAND_SEQE; i += 10) {
	        if (pai[i] > 0){
	            start = i; 
	            result = true;
	            break;
	        }
	    }
	    
	    if (start == CardCode.HAND_SEQS || start == CardCode.HAND_SEQS + 10 || start == CardCode.HAND_SEQS + 20) {
	        //offset
	        for (int offset = 0; offset < check_value.length; offset++) {
	            if (pai[start + offset] != check_value[offset]) {
	                result = false;
	                break;
	            }
	        }
	    }

	    pai[hu] += 1;
	    return result;
	}

	/*�ĸ�*/
	public static boolean is_si_gang(CardKe complex[], int len) {
	    if (len < 4) return false;

	    for (int j = 0; j < len; j++){
	        int type = complex[j].type;
	        if (type != CardCode.COM_GANG) {
	            return false;
	        }
	    }
	    return true;
	}


	/*���߶ԣ���������*/
	public static boolean is_lian_qi_dui(int pai[]) {
	    int i = CardCode.HAND_SEQS;
	    int start = 0;
	    int check_index[] = { 
	        CardCode.HAND_SEQS, CardCode.HAND_SEQS + 1, CardCode.HAND_SEQS + 2,
	        CardCode.HAND_SEQS + 10, CardCode.HAND_SEQS + 11, CardCode.HAND_SEQS + 12,
	        CardCode.HAND_SEQS + 20, CardCode.HAND_SEQS + 21, CardCode.HAND_SEQS + 22,
	    };

	    for (; i < check_index.length; i++) {
	        if (pai[check_index[i]] != 0) {
	            start = check_index[i];
	            break;
	        }
	    }
	    //assert((start != 0) && (start % 10 != 0));
	    if (start == 0) {
	        return false;
	    }
	    int end = start + 6;
	    for (int j = start; i <= end; i++)
	        if (pai[j] != 2) return false;

	    return true;
	}

	/*ʮ���ۣ���������*/
	public static boolean is_shi_san_yao(int pai[]) {
	    int yao_seq_index[] = { CardCode.HAND_SEQS, CardCode.HAND_SEQS + 8, CardCode.HAND_SEQS + 10, CardCode.HAND_SEQS + 18, CardCode.HAND_SEQS + 20, CardCode.HAND_SEQS + 28,
	        CardCode.HAND_ZIS, CardCode.HAND_ZIS + 1, CardCode.HAND_ZIS + 2, CardCode.HAND_ZIS + 3, CardCode.HAND_ZIS + 4, CardCode.HAND_ZIS + 5, CardCode.HAND_ZIS + 6 };
	    boolean eye = false;
	    int cnt = 0;

	    for (int i = 0; i < yao_seq_index.length; i++) {
	        if ( !eye && pai[yao_seq_index[i]] == 2) {
	            eye = true;
	            continue;
	        }
	        if (pai[yao_seq_index[i]] != 1)return false;
	        cnt++;
	    }
	    return (cnt == 12 && eye);
	}

	/*���۾�*/
	public static boolean is_qing_yao_jiu(CardKe comhu[], int comhu_len) {
	    for (int j = 0; j < comhu_len; j++){
	        int type = comhu[j].type;
	        int id = comhu[j].id;
	        //���Ʋ���Ҫ��
	        if (type == CardCode.COM_JIANG) continue;
	        if (id % 10 != 1 && id % 10 != 9) return false;
	        if (type != CardCode.COM_PENG && type != CardCode.COM_GANG) {
	            return false;
	        }
	    }
	    return true;
	}

	/*С��ϲ*/
	public static boolean is_xiao_si_xi(int pai[], CardKe complex[], int len) {
	    int handfeng = 0;
	    int jiang = 0;
	    /*�����ϱ���*/
	    for (int i = CardCode.HAND_ZIS; i < CardCode.HAND_ZIS + 4; i++){
	        if (pai[i] == 3) {
	            handfeng++;
	        }
	        if (pai[i] == 2) {
	            jiang++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS && complex[j].id < CardCode.HAND_ZIS + 4)) {
	            handfeng++;
	        }
	    }
	    return (handfeng == 3 && jiang == 1);
	}

	/*С��Ԫ*/
	public static boolean is_xiao_san_yuan(int pai[], CardKe complex[], int len) {
	    int handjian = 0;
	    int jiang = 0;
	    /*�з���*/
	    for (int i = 4; i < 7; i++){
	        if (pai[i + CardCode.HAND_ZIS] == 3) {
	            handjian++;
	        }
	        if (pai[i + CardCode.HAND_ZIS] == 2) {
	            jiang++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS + 4 && complex[j].id < CardCode.HAND_ZIS + 7)) {
	            handjian++;
	        }
	    }
	    return (handjian == 2 && jiang == 1);
	}

	/*��һɫ*/
	public static boolean is_zi_yi_se(int pai[], CardKe complex[], int len) {
	    int handzi = 0;
	    int jiang = 0;
	    /*�з���*/
	    for (int i = 0; i < 7; i++){
	        if (pai[i + CardCode.HAND_ZIS] == 3) {
	            handzi++;
	        }
	        if (pai[i + CardCode.HAND_ZIS] == 2) {
	            jiang++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS + 4 && complex[j].id < CardCode.HAND_ZIS + 7)) {
	            handzi++;
	        }
	    }
	    return (handzi == 4 && jiang == 1);
	}

	/*�İ��� */
	public static boolean is_si_an_ke(int pai[], CardKe complex[], int len) {
	    int handke = 0;
	    /*�з���*/
	    for (int i = CardCode.HAND_SEQS; i < CardCode.HAND_LEN; i++){
	        //�İ��̲�����������ж���������
	        if (pai[i] == 3) {
	            handke++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_GANG && complex[j].type == CardCode.COM_AN_GANG) {
	            handke++;
	        }
	    }
	    return (handke == 4);
	}

	/*һɫ˫����*/
	public static boolean is_yi_se_shuang_long_hui(int pai[], CardKe complex[], int len) {
	    int handshao = 0;
	    int handlao = 0;
	    int color = 0;

	    for (int i = CardCode.HAND_SEQS + 4; i < CardCode.HAND_SEQE; i += 10){
	        if (pai[i] == 2) {
	            color = i / 10;
	            if (pai[i - 4] == pai[i - 3] && pai[i - 4] == pai[i - 2])
	                handshao += pai[i - 4];
	            if (pai[i + 4] == pai[i + 3] && pai[i + 4] == pai[i + 2])
	                handlao += pai[i + 4];
	        }
	    }
	    for (int j = 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_CHI) {
	            int id = complex[j].id;
	            if (color != id / 10)
	                return false;
	            if (id % 10 == 1)
	                handshao++;
	            if (id % 10 == 7) {
	                handlao++;
	            }
	        }
	    }
	    return (handshao == 2 && handlao == 2);
	}

	/*һɫ��ͬ˳*/
	public static boolean is_yi_se_si_tong_shun(CardKe comhu[], int comhu_len) {
	    int seq[] = { 0, 0, 0, 0 };
	    int len_seq = 0;

	    for (int j = 0; j < comhu_len; j++){
	        int id = comhu[j].id;
	        int type = comhu[j].type;
	        if (type == CardCode.COM_CHI && len_seq < seq.length) {
	            seq[len_seq++] = id;
	        }
	    }
	    if (len_seq != seq.length) return false;

	    if ((seq[0] == seq[1]) && (seq[1] == seq[2]) && (seq[2] == seq[3]))
	        return true;
	    return false;
	}

	/* һɫ�Ľڸ�*/
	public static boolean is_yi_se_si_jie_gao(CardKe comhu[], int comhu_len) {
	    int ke_seq[] = { 0, 0, 0, 0 };
	    int len_ke = 0;

	    for (int j = 0; j < comhu_len; j++){
	        int id = comhu[j].id;
	        int type = comhu[j].type;
	        int type2 = comhu[j].type2;
	        if ((type == CardCode.COM_GANG || (type == CardCode.COM_PENG && type2 == CardCode.COM_KE)) && len_ke < ke_seq.length) {
	            ke_seq[len_ke++] = id;
	        }
	    }
	    if (len_ke != ke_seq.length) return false;

	    for (int m = 0; m < len_ke - 1; m++) {
	        for (int n = m + 1; m < len_ke; m++) {
	            if (ke_seq[n] < ke_seq[m]) {
	            	HuTypeParser.swap(ke_seq, m, n);
	            }
	        }
	    }

	    for (int m = 0; m < len_ke - 1; m++) {
	        if (ke_seq[m] + 1 != ke_seq[m + 1]){
	            return false;
	        }
	    }
	    return true;
	}

	/* һɫ�Ĳ���*/
	public static boolean is_yi_se_si_bu_gao(CardKe comhu[], int comhu_len) {
	    int seq[] = { 0, 0, 0, 0 };
	    int seq_len = 0;
	    for (int j = 0; j < comhu_len; j++){
	        if (comhu[j].type == CardCode.COM_CHI) {
	            seq[seq_len++] = comhu[j].id;
	        }
	    }

	    if (seq_len != seq.length) return false;

	    for (int m = 0; m < seq_len - 1; m++) {
	        for (int n = m + 1; m < seq_len; m++) {
	            if (seq[n] < seq[m]) {
	            	HuTypeParser.swap(seq, m, n);
	            }
	        }
	    }
	    int step = seq[1] - seq[0];
	    if (step > 2) return false;
	    for (int m = 1; m < seq_len - 1; m++) {
	        if (seq[m] + step != seq[m + 1]){
	            return false;
	        }
	    }
	    return true;
	}

	public static int get_gang(CardKe complex[], int len)
	{
	    int gang = 0;
	    for (int j = 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_GANG) {
	            gang++;
	        }
	    }
	    return gang;
	}

	/*����*/
	public static boolean is_san_gang(int pai[], CardKe complex[], int len) {
	    int gang = get_gang(complex, len);

	    return (gang == 3);
	}

	/*���۾�*/
	public static boolean is_hun_jiu_yao(int pai[], CardKe complex[], int len) {
	    int jiang = 0;
	    int ke = 0;
	    int id, type;
	    int seq_index[] = { CardCode.HAND_SEQS, CardCode.HAND_SEQS + 8, CardCode.HAND_SEQS + 10, CardCode.HAND_SEQS + 18, CardCode.HAND_SEQS + 20, CardCode.HAND_SEQS + 28 };
	    for (int i = 0; i < seq_index.length; i++){
	        //��ͬ��ɫ�ǲ������ģ�����
	        if (pai[seq_index[i]] == 2){
	            jiang++;
	        } else if (pai[seq_index[i]] == 3){
	            ke++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        id = complex[j].id;
	        type = complex[j].type;
	        if ((type == CardCode.COM_PENG || type == CardCode.COM_PENG) && (id >= CardCode.HAND_ZIS && id <= CardCode.HAND_ZIE)) {
	            ke++;
	        }
	    }
	    return (ke == 4 && jiang == 1);
	}

	/*�߶ԣ���������*/
	public static boolean is_qi_dui(int pai[]) {
	    int i = CardCode.HAND_START;
	    int num_dui = 0;

	    for (; i < CardCode.HAND_LEN; i++) {
	        if (pai[i] % 2 != 0) {
	            return false;
	        }
	        num_dui += pai[i] / 2;
	    }
	    return (num_dui == 7);
	}

	public static int bu_kao_seq_cnt(int pai[]){
	    int total = 0;
	    int seq[] = { 0, 0, 0 };
	    int cnt_seq_index[] = { CardCode.HAND_SEQS, CardCode.HAND_SEQS + 1, CardCode.HAND_SEQS + 2, CardCode.HAND_SEQS + 10, CardCode.HAND_SEQS + 11, CardCode.HAND_SEQS + 12,
	        CardCode.HAND_SEQS + 20, CardCode.HAND_SEQS + 21, CardCode.HAND_SEQS + 22, };
	    int i = 0;
	    while (i < cnt_seq_index.length) {
	        int pai_index = cnt_seq_index[i];
	        if (pai[pai_index] == 1){
	            /*���һ�������Ѿ����ˣ���ͳ��*/
	            int seqi = pai_index % 10 - 1;
	            if (seq[seqi] == 0) {
	                total++;
	                if (pai[pai_index + 3] == 1)
	                    total++;
	                if (pai[pai_index + 6] == 1)
	                    total++;
	                seq[seqi] = 1;
	            }
	            /*��һ����ɫ*/
	            i = (i + 3) / 3 * 3;
	            continue;
	        }
	        i++;
	    }
	    return total;
	}

	/*���ǲ�������������*/
	public static boolean is_qi_xing_bu_kao(int pai[]) {
	    int total = bu_kao_seq_cnt(pai);
	    
	    if (total != 7) return false;
	    for (int j = CardCode.HAND_ZIS; j <= CardCode.HAND_ZIE; j++){
	        if (pai[j] != 1) return false;
	    }
	    return true;
	}

	/*ȫ˫��*/
	public static boolean is_quan_shuang_ke(int pai[], CardKe complex[], int len) {
	    int id, type;
	    int shuang = 0;
	    int jiang = 0;
	    for (int i = CardCode.HAND_SEQS + 1; i < CardCode.HAND_SEQE; i += 2){
	        if (pai[i] == 3){
	            shuang++;
	        }
	        if (jiang == 0 && pai[i] == 2) {
	            jiang++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        id = complex[j].id;
	        type = complex[j].type;
	        if ((type == CardCode.COM_PENG || type == CardCode.COM_PENG) && (id >= CardCode.HAND_SEQS && id <= CardCode.HAND_SEQE) && (id % 2 == 0)) {
	            shuang++;
	        }
	    }
	    return (shuang == 4 && jiang == 1);
	}

	/*һɫ��ͬ˳*/
	public static boolean is_yi_se_san_tong_shun(CardKe comhu[], int comhu_len) {
	    int seq[] = { 0, 0, 0, 0 };
	    int len_seq = 0;

	    for (int j = 0; j < comhu_len; j++){
	        int id = comhu[j].id;
	        int type = comhu[j].type;
	        if (type == CardCode.COM_CHI && len_seq < seq.length) {
	            seq[len_seq++] = id;
	        }
	    }
	    if (len_seq < seq.length-1) return false;

	    for (int m = 0; m < len_seq - 1; m++) {
	        for (int n = m + 1; m < len_seq; m++) {
	            if (seq[n] < seq[m]) {
	            	HuTypeParser.swap(seq, m, n);
	            }
	        }
	    }
	    //����
	    if ((seq[0] == seq[1]) && (seq[1] == seq[2]))
	        return true;
	    //��������
	    if (len_seq > 3 && ((seq[1] == seq[2]) && (seq[2] == seq[3])))
	        return true;
	    return false;
	}

	/*һɫ���ڸ�*/
	public static boolean is_yi_se_san_jie_gao(CardKe comhu[], int comhu_len) {
	    int ke_seq[] = { 0, 0, 0, 0 };
	    int len_ke = 0;

	    for (int j = 0; j < comhu_len; j++){
	        int id = comhu[j].id;
	        int type = comhu[j].type;
	        int type2 = comhu[j].type2;
	        if ((type == CardCode.COM_GANG || (type == CardCode.COM_PENG && type2 == CardCode.COM_KE)) && len_ke < ke_seq.length) {
	            ke_seq[len_ke++] = id;
	        }
	    }
	    if (len_ke < ke_seq.length - 1) return false;

	    for (int m = 0; m < len_ke - 1; m++) {
	        for (int n = m + 1; m < len_ke; m++) {
	            if (ke_seq[n] < ke_seq[m]) {
	            	HuTypeParser.swap(ke_seq, m, n);
	            }
	        }
	    }

	    //ͬɫ
	    if ((ke_seq[0] + 1 == ke_seq[1]) && (ke_seq[1] + 1 == ke_seq[2]))
	        return true;
	    if (len_ke > 3 && ((ke_seq[1] + 1 == ke_seq[2]) && (ke_seq[2] + 1 == ke_seq[3])))
	        return true;
	    return false;
	}

	public static boolean all_in_interval(int pai[], CardKe complex[], int len, int s, int e){
	    int type, id;
	    int total = 0;
	    for (int i = CardCode.HAND_SEQS + s - 1; i < CardCode.HAND_SEQE; i += 10){
	        total += (pai[i] + pai[i + 1] + pai[i + 2]);
	    }

	    for (int j = 0; j < len; j++){
	        id = complex[j].id;
	        type = complex[j].type;
	        if (type == CardCode.COM_CHI && (id % 10 == s)) {
	            total += 3;
	        }
	        if ((type == CardCode.COM_GANG || type == CardCode.COM_PENG) && id <= CardCode.HAND_SEQE && id % 10 >= s && id % 10 <= e) {
	            total += 3;
	        }
	    }
	    return (total == 14);
	}

	/*ȫ��*/
	public static boolean is_quan_da(int pai[], CardKe complex[], int len) {
	    return all_in_interval(pai, complex, len, 7, 9);
	}

	/*ȫ��*/
	public static boolean is_quan_zhong(int pai[], CardKe complex[], int len) {
	    return all_in_interval(pai, complex, len, 4, 6);
	}

	/*ȫС*/
	public static boolean is_quan_xiao(int pai[], CardKe complex[], int len) {
	    return all_in_interval(pai, complex, len, 1, 3);
	}

	/*����*/
	public static boolean is_qing_long(int pai[], CardKe complex[], int len) {
	    int rest[] = new int[pai.length];//ͬɫʣ����
	    int ri = 0;
	    boolean found = false;

	    for (int i = 11; i < pai.length; i++) {
	    	rest[i] = pai[i];
	    }

	    for (int j = 0; j < len; j++){
	        int id = complex[j].id;
	        int type = complex[j].type;

	        if (type == CardCode.COM_CHI) {
	            rest[id]++; rest[id + 1]++; rest[id + 2]++;
	        }
	    }

	    for (int i = CardCode.HAND_SEQS; i < CardCode.HAND_SEQE; i += 10){
	        if (rest[i] == 0) continue;
	        found = true;
	        for (int j = 0; j < 9; j++) {
	            int index = i + j;
	            if (rest[index] == 0) {
	                ri = 0;
	                found = false;//û�ҵ�
	                break;
	            }
	            rest[index] = rest[index] - 1;
	            ri++;
	        }
	        if (found) break;//�ҵ�
	    }

	    if (!found) return false;

	    return GuoBiaoCardsParser.hu(rest, ri, 0);
	}

	/*��ɫ˫���ᣬ��������*/
	public static boolean is_san_se_shuang_long_hui(int pai[], CardKe complex[], int len) {
	    int laoshao[] = new int[6];
	    int jiang = 0;

	    for (int i = CardCode.HAND_SEQS + 4; i < CardCode.HAND_SEQE; i += 10){
	        int k = (i / 10 - 1) * 2;
	        if (pai[i] == 2) {
	            laoshao[k] = 1;laoshao[k + 1] = 1;
	            jiang++;
	            continue;
	        }
	        if (pai[i - 4] == 1 && pai[i - 3] == 1 && pai[i - 2] == 1)
	            laoshao[k] = 1;
	        if (pai[i + 4] == 1 && pai[i + 3] == 1 && pai[i + 2] == 1)
	            laoshao[k + 1] = 1;
	    }
	    for (int j = 0; j < len; j++){
	        int id = complex[j].id;
	        int type = complex[j].type;
	        int k = (id / 10 - 1) * 2;

	        if (type == CardCode.COM_CHI) {
	            if (id % 10 == 1) {
	                laoshao[k] = 1;;
	            }
	            if (id % 10 == 7) {
	                laoshao[k + 1] = 1;
	            }
	        }
	    }
	    for (int i = 1; i < laoshao.length; i++) {
	        laoshao[0] += laoshao[i];
	    }
	    return (laoshao[0] == 6);
	}

	/*һɫ������*/
	public static boolean is_yi_se_san_bu_gao(CardKe comhu[], int comhu_len) {
	    int seq[] = { 0, 0, 0, 0 };
	    int seq_len = 0;
	    for (int j = 0; j < comhu_len; j++){
	        if (comhu[j].type == CardCode.COM_CHI) {
	            seq[seq_len++] = comhu[j].id;
	        }
	    }

	    if (seq_len < seq.length - 1) return false;

	    for (int m = 0; m < seq_len - 1; m++) {
	        for (int n = m + 1; m < seq_len; m++) {
	            if (seq[n] < seq[m]) {
	            	HuTypeParser.swap(seq, m, n);
	            }
	        }
	    }
	    if (seq_len == 4) {
	        if ((seq[2] - seq[1] == seq[3] - seq[2]) && (seq[3] - seq[2] < 2) && (seq[3] != seq[2]))
	            return true;
	        if ((seq[2] - seq[0] == seq[3] - seq[2]) && (seq[3] - seq[2] < 2) && (seq[3] != seq[2]))
	            return true;
	        if ((seq[1] - seq[0] == seq[3] - seq[1]) && (seq[3] - seq[1] < 2) && seq[3] != seq[1])
	            return true;
	    }

	    if ((seq[1] - seq[0] == seq[2] - seq[1]) && (seq[2] - seq[1] < 2) && (seq[2] != seq[1]))
	        return true;
	    return false;
	}

	/*ȫ����*/
	public static boolean is_quan_dai_wu(CardKe comhu[], int comhu_len) {
	    int seq5 = 0;
	    int jiang5 = 0;

	    for (int j = 0; j < comhu_len; j++){
	        int type = comhu[j].type;
	        int id = comhu[j].id;

	        if ((type == CardCode.COM_CHI) && (id % 10 >= 3) && (id % 10 <= 5)) {
	            seq5++;
	        }
	        if (type == CardCode.COM_JIANG) {
	            jiang5++;
	        }
	    }
	    if (seq5 == 4 && jiang5 == 1)
	        return true;
	    return false;
	}

	/*��ͬ�� */
	public static boolean is_san_tong_ke(int pai[], CardKe complex[], int len) {
	    int seq[] = new int[pai.length];//ͬɫʣ����
	    int remain = 0;
	    boolean found = false;

	    for (int i = 11; i < pai.length; i++) {
	    	seq[i] = pai[i];
	    }
	    for (int j = 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG) {
	            seq[complex[j].id] += 3;
	        }
	    }

	    for (int i = CardCode.HAND_SEQS; i < CardCode.HAND_SEQS + 9; i++){
	        if (seq[i] > 3 && seq[i + 10] > 3 && seq[i + 10] > 3) {
	            seq[i] -= 3; seq[i + 10] -= 3; seq[i + 20] -= 3;
	            remain -= 9;
	            found = true;
	            break;
	        }
	    }
	    if (!found) return false;
	    return GuoBiaoCardsParser.hu(seq, remain, 0);
	}

	/* ������ */
	public static boolean is_san_an_ke(int pai[], CardKe complex[], int len) {
	    int handke = 0;
	    /*�з���*/
	    for (int i = CardCode.HAND_SEQS; i < CardCode.HAND_LEN; i++){
	        if (pai[i] == 3) {
	            handke++;
	        }
	    }
	    for (int j = 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_GANG) {
	            handke++;
	        }
	    }
	    return (handke == 4);
	}

	/*ȫ��������������*/
	public static boolean is_quan_bu_kao(int pai[]) {
	    int total = bu_kao_seq_cnt(pai);

	    if (total != 9) return false;

	    for (int j = CardCode.HAND_ZIS; j <= CardCode.HAND_ZIE; j++){
	        if (pai[j] == 1) total++;
	    }
	    return (total == 14);
	}

	/*TODO:���������������*/
	public static boolean is_zu_he_long(int pai[], CardKe complex[], int len) {
	    return false;
	}

	/*������*/
	public static boolean is_da_yu_wu(CardKe comhu[], int comhu_len) {
	    for (int j = 0; j < comhu_len; j++){
	        if (comhu[j].id >= CardCode.HAND_ZIS || comhu[j].id % 10 <= 5) {
	            return false;
	        }
	    }
	    return true;
	}

	/*С����*/
	public static boolean is_xiao_yu_wu(CardKe comhu[], int comhu_len) {
	    for (int j = 0; j < comhu_len; j++){
	        if (comhu[j].id >= CardCode.HAND_ZIS || comhu[j].id % 10 >= 5) {
	            return false;
	        }
	        if (comhu[j].type == CardCode.COM_CHI && comhu[j].id > 2) {
	            return false;
	        }
	    }
	    return true;
	}

	/*�����*/
	public static boolean is_san_feng_ke(CardKe comhu[], int comhu_len) {
	    int fengke = 0;
	    for (int j = 0; j < comhu_len; j++){
	        int id = comhu[j].id;
	        int type = comhu[j].type;
	        if (type == CardCode.COM_PENG && type == CardCode.COM_GANG) {    
	            if (id >= CardCode.HAND_ZIS && id <= CardCode.HAND_ZIS + 3){
	                fengke++;
	            }
	        }
	    }
	    return (fengke == 3);
	}

	/*����*/
	public static boolean is_hua_long(CardKe comhu[], int comhu_len) {
	    int seq[][] = new int[3][3];

	    for (int j = 0; j < comhu_len; j++){
	        int id = comhu[j].id;
	        int type = comhu[j].type;
	        int index = id % 10;
	        
	        if (type == CardCode.COM_CHI) {
	            if (index % 3 == 1){
	                seq[id / 10 - 1][(index - 1) / 3] = 1;
	            }
	        }
	    }
	    for (int i = 0; i < 3; i++){
	        for (int j = 0; j < 3; j++) {
	            if (i == j) continue;
	            for (int k = 0; k < 3; k++) {
	                if (i == k || j == k)continue;
	                if (seq[0][i] == 1 && seq[1][j] == 1 && seq[2][k] == 1) {
	                    return true;
	                }    
	            }
	        }
	    }
	    return false;
	}

	/*�Ʋ���*/
	public static boolean is_tui_bu_dao(int pai[], CardKe complex[], int len) {
	    int seq[] = { 22, 24, 25, 26, 28, 29, 31, 32, 33, 34, 35, 38, 39, 47 };
	    int total = 0;
	    for (int j = 0; j < len; j++){
	        int type = complex[j].type;
	        if (type == CardCode.COM_CHI) {
	            pai[j]++; pai[j + 1]++; pai[j + 2]++;
	        }
	        if (type == CardCode.COM_PENG && type == CardCode.COM_GANG) {
	            pai[j] += 3;
	        }
	    }
	    for (int i = 0; i < seq.length; i++) {
	        total += pai[i];
	    }
	    for (int j = 0; j < len; j++){
	        int type = complex[j].type;
	        if (type == CardCode.COM_CHI) {
	            pai[j]--; pai[j + 1]--; pai[j + 2]--;
	        }
	        if (type == CardCode.COM_PENG && type == CardCode.COM_GANG) {
	            pai[j] -= 3;
	        }
	    }
	    return (total == 14);
	}

	/*��ɫ��ͬ˳*/
	public static boolean is_san_se_san_tong_shun(CardKe comhu[], int comhu_len) {
	    int tile[] = new int[4];
	    int color[] = new int[3];
	    int color2[] = new int[3];
	    int single_color = 0;
	    int index = 0;
	    int len = 0;

	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        if (comhu[i].type == CardCode.COM_CHI) {
	            tile[len++] = id;
	            color[id / 10 - 1]++;
	        }
	    }
	    if (color[0] == 0 || color[1] == 0 || color[2] == 0)
	        return false;
	    /*�ҵ�ֻ��һ��˳�ӵĻ�ɫ��Ȼ���ҵ�����Ӧ���ƺţ�Ȼ���ٿ�����������ɫ��û����ȵ��ƺ�*/
	    if (color[0] == 1) {
	        single_color = 1;
	    } else {
	        single_color = 2;
	    }
	    for (int j = 0; j < len; j++) {
	        if (single_color == tile[j] / 10) {
	            index = tile[j] % 10;
	            break;
	        }
	    }
	    for (int j = 0; j < len; j++) {
	        if (index == tile[j] % 10) {
	            color2[tile[j] / 10 - 1] = 1;
	        }
	    }
	    if (color2[0] == 0 || color2[1] == 0 || color2[2] == 0)
	        return false;

	    return true;
	}

	/*��ɫ���ڸ�*/
	public static boolean is_san_se_san_jie_gao(CardKe comhu[], int comhu_len) {
	    int seq[] = new int[4];
	    int seq_len = 0;

	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if (type == CardCode.COM_PENG || type == CardCode.COM_GANG) {
	            seq[seq_len++] = id;
	        }
	    }
	    if (seq_len < 3) return false;

	    for (int m = 0; m < seq_len - 1; m++) {
	        for (int n = m + 1; m < seq_len; m++) {
	            //����index����
	            if (seq[n] % 10 < seq[m] % 10) {
	                swap(seq, m, n);
	            }
	        }
	    }
	    if (seq_len == 4) {
	        if (is_san_se_seq(seq[1], seq[2], seq[3]))
	            return true;
	        if (is_san_se_seq(seq[0], seq[2], seq[3]))
	            return true;
	        if (is_san_se_seq(seq[0], seq[1], seq[3]))
	            return true;
	    }
	    if (is_san_se_seq(seq[0], seq[1], seq[2]))
	        return true;
	    return false;
	}

	/*������*/
	public static boolean is_peng_peng_hu(CardKe comhu[], int comhu_len) {
	    int total = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int type = comhu[i].type;
	        if (type == CardCode.COM_PENG || type == CardCode.COM_GANG) {
	            total++;
	        }
	    }
	    return (total == 4);
	}

	/*��һɫ*/
	public static boolean is_hu_yi_se(CardKe comhu[], int comhu_len) {
	    int color = 0;
	    int zi = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        if (id >= CardCode.HAND_ZIS) {
	            zi++;
	            continue;
	        }
	        if (color == 0) {
	            color = id / 10;
	            continue;
	        }
	        if (color != id / 10)
	            return false;
	    }

	    return (zi != 0) && color != 0;
	}

	/*��ɫ������*/
	public static boolean is_san_se_san_bu_gao(CardKe comhu[], int comhu_len) {
	    int seq[] = new int[4];
	    int seq_len = 0;

	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if (type == CardCode.COM_CHI) {
	            seq[seq_len++] = id;
	        }
	    }
	    if (seq_len < 3) return false;

	    for (int m = 0; m < seq_len - 1; m++) {
	        for (int n = m + 1; m < seq_len; m++) {
	            //����index����
	            if (seq[n] % 10 < seq[m] % 10) {
	                swap(seq, m, n);
	            }
	        }
	    }
	    if (seq_len == 4) {
	        if (is_san_se_seq(seq[1], seq[2], seq[3]))
	            return true;
	        if (is_san_se_seq(seq[0], seq[2], seq[3]))
	            return true;
	        if (is_san_se_seq(seq[0], seq[1], seq[3]))
	            return true;
	    }
	    if (is_san_se_seq(seq[0], seq[1], seq[2]))
	        return true;
	    return false;
	}

	/*������*/
	public static boolean is_wu_men_qi(CardKe comhu[], int comhu_len) {
	    int color[] = new int[5];
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        if (id >= CardCode.HAND_ZIS + 4) {
	            color[4] = 1;
	        } else if (id >= CardCode.HAND_ZIS){
	            color[3] = 1;
	        } else {
	            color[id / 10 - 1] = 1;
	        }
	    }
	    for (int j = 1; j < color.length; j++) {
	        color[0] += color[j];
	    }
	    return (color[0] == 5);
	}

	/*ȫ����*/
	public static boolean is_quan_qiu_ren(int pai[], CardKe complex[], int len) {
	    return (len == 4);
	}

	/*˫����*/
	public static boolean is_shuang_an_gang(CardKe complex[], int len) {
	    int total = 0;
	    for (int i = 0; i < len; i++){
	        if (complex[i].type == CardCode.COM_GANG && complex[i].type2 == CardCode.COM_AN_GANG) {
	            total++;
	        }
	    }
	    return (total == 2);
	}

	/*˫����*/
	public static boolean is_shuang_jian_ke(CardKe comhu[], int comhu_len) {
	    int total = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if ((id >= CardCode.HAND_ZIS + 4) && (type == CardCode.COM_GANG || type == CardCode.COM_PENG)){
	            total++;
	        }
	    }
	    return (total == 2);
	}

	/*ȫ����*/
	public static boolean is_quan_dai_yao(CardKe comhu[], int comhu_len) {
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if (id >= CardCode.HAND_ZIS)continue;
	        if (id % 10 == 1 || id % 10 == 9) continue;
	        if (id % 10 == 7 && type == CardCode.COM_CHI)continue;
	        return false;
	    }
	    return true;
	}

	/*˫����*/
	public static boolean is_shuang_ming_gang(CardKe complex[], int len) {
	    int total = 0;
	    for (int i = 0; i < len; i++){
	        if (complex[i].type == CardCode.COM_GANG && complex[i].type2 == CardCode.COM_MING_GANG) {
	            total++;
	        }
	    }
	    return (total == 2);
	}

	/*����*/
	public static boolean is_jian_ke(CardKe comhu[], int comhu_len) {
	    int total = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if ((id >= CardCode.HAND_ZIS + 4) && (type == CardCode.COM_GANG || type == CardCode.COM_PENG)){
	            total++;
	        }
	    }
	    return (total == 1);
	}
	/*Ȧ��̣���֧��*/
	public static boolean is_quan_feng_ke(CardKe comhu[], int comhu_len) {
	    return false;
	}

	/*ƽ��*/
	public static boolean is_ping_hu(CardKe comhu[], int comhu_len) {
	    for (int i = 0; i < comhu_len; i++){
	        if (comhu[i].id >= CardCode.HAND_ZIS){
	            return false;
	        }
	        if (comhu[i].type != CardCode.COM_JIANG && comhu[i].type != CardCode.COM_CHI){
	            return false;
	        }
	    }
	    return true;
	}

	/*�Ĺ�һ*/
	public static boolean is_si_gui_yi(CardKe comhu[], int comhu_len) {
	    int pai[] = new int[CardCode.HAND_SEQE + 1];
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        if (comhu[i].type == CardCode.COM_CHI){
	            pai[id]++; pai[id + 1]++; pai[id + 2]++;
	        } if (comhu[i].type == CardCode.COM_PENG){
	            pai[id] += 3;
	        } else if (comhu[i].type == CardCode.COM_JIANG){
	            pai[id] += 2;
	        }
	    }
	    for (int j = 0; j <= CardCode.HAND_SEQE; j++) {
	        if (pai[j] == 4)
	            return true;
	    }
	    return false;
	}

	/*˫ͬ��*/
	public static boolean is_shuang_tong_ke(CardKe comhu[], int comhu_len) {
	    int pai[] = new int[10];
	    for (int i = 0; i < comhu_len; i++){
	        int index = comhu[i].id % 10;
	        if (comhu[i].type == CardCode.COM_PENG || comhu[i].type == CardCode.COM_GANG){
	            pai[index]++;
	        }
	    }
	    for (int j = 0; j < pai.length; j++) {
	        if (pai[j] == 2)
	            return true;
	    }
	    return false;
	}

	/*˫����*/
	public static boolean is_shuang_an_ke(CardKe comhu[], int comhu_len) {
	    int total = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int type = comhu[i].type;
	        int type2 = comhu[i].type2;
	        if ((type == CardCode.COM_PENG && type2 == CardCode.COM_KE) || (type == CardCode.COM_GANG && type2 == CardCode.COM_AN_GANG)){
	            total++;
	        }
	    }
	    return (total == 2);
	}

	/*����*/
	public static boolean is_an_gang(CardKe complex[], int len) {
	    int total = 0;

	    for (int i = 0; i < len; i++){
	        int type = complex[i].type;
	        int type2 = complex[i].type2;
	        if (type == CardCode.COM_GANG && type2 == CardCode.COM_AN_GANG) {
	            total++;
	        }
	    }
	    return (total == 1);
	}

	/*����*/
	public static boolean is_duan_yao(CardKe comhu[], int comhu_len) {
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if (id >= CardCode.HAND_ZIS)return false;
	        if (id % 10 == 1 || id % 10 == 9) return false;
	        if (id % 10 == 7 && type == CardCode.COM_CHI)return false;
	    }
	    return true;
	}

	/*һ���*/
	public static boolean is_yi_ban_gao(CardKe comhu[], int comhu_len) {
	    int seq[] = new int[4];
	    int len = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if (type != CardCode.COM_CHI)
	            continue;
	        seq[len++] = id;
	    }
	    if (len < 2) return false;

	    for (int m = 0; m < len - 1; m++) {
	        for (int n = m + 1; m < len; m++) {
	            if (seq[n] < seq[m]) {
	            	HuTypeParser.swap(seq, m, n);
	            }
	        }
	    }

	    int tong_cnt = 0;
	    for (int j = 0; j < len - 1; j++) {
	        if (seq[j] == seq[j + 1]) {
	            tong_cnt++;
	        }
	    }
	    return (tong_cnt == 1);
	}

	/*������*/
	public static boolean is_bu_qiu_ren(CardKe complex[], int len) {
	    
	    return len == 0;
	}

	/*��ǰ��*/
	public static boolean is_men_qian_qing(CardKe complex[], int len) {
	    return len == 0;
	}

	/*ϲ���*/
	public static boolean is_xi_xiang_feng(CardKe comhu[], int comhu_len) {
	    int seq[] = new int[4];
	    int len = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if (type != CardCode.COM_CHI)
	            continue;
	        for (int j = 0; j < len; j++) {
	            if ((seq[0] % 10 == id % 10) && (seq[0] / 10 != id / 10)){
	                return true;
	            }
	        }
	        seq[len++] = id;
	    }
	    return false;
	}
	/*����*/
	public static boolean is_lian_liu(CardKe comhu[], int comhu_len) {
	    int seq[] = new int[4];
	    int len = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if (type != CardCode.COM_CHI) 
	            continue;
	        for (int j = 0; j < len; j++) {
	            if (seq[0] + 3 == id || seq[0] == id + 3){
	                return true;
	            }
	        }
	        seq[len++] = id;
	    }
	    return false;
	}

	/*���ٸ�*/
	public static boolean is_lao_shao_fu(CardKe comhu[], int comhu_len) {
	    int seq[] = new int[4];
	    int len = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int index = id % 10;
	        int type = comhu[i].type;
	        if (type != CardCode.COM_CHI)
	            continue;
	        if (index != 1 && index != 7)
	            continue;
	        for (int j = 0; j < len; j++) {
	            if ((index + (seq[j] % 10) == 7) && (id / 10 == seq[j] / 10))
	                return true;
	        }
	        seq[len++] = id;
	    }
	    return false;
	}

	/*�۾ſ�*/
	public static boolean is_yao_jiu_ke(CardKe comhu[], int comhu_len) {
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        if (type != CardCode.COM_PENG && type != CardCode.COM_GANG)
	            continue;
	        if (id >= CardCode.HAND_ZIS)return true;
	        if (id % 10 == 1 || id % 10 == 9) return true;
	    }
	    return false;
	}

	/*����*/
	public static boolean is_ming_gang(CardKe complex[], int len) {
	    for (int i = 0; i < len; i++){
	        if (complex[i].type == CardCode.COM_GANG && complex[i].type2 == CardCode.COM_MING_GANG) {
	            return true;
	        }
	    }
	    return false;
	}

	/*ȱһ��*/
	public static boolean is_que_yi_men(CardKe comhu[], int comhu_len) {
	    int color[] = new int[4];
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        if (id >= CardCode.HAND_ZIS)continue;
	        color[id / 10] = 1;
	    }
	    return (color[1] + color[2] + color[3] < 3);
	}

	/*����*/
	public static boolean is_wu_zi(CardKe comhu[], int comhu_len) {
	    for (int i = 0; i < comhu_len; i++){
	        if (comhu[i].id >= CardCode.HAND_ZIS){
	            return false;
	        }
	    }
	    return true;
	}

	/*����*/
	public static boolean is_bian_zhang(CardKe comhu[], int comhu_len, int hu) {
	    int index = hu % 10;
	    int type = hu / 10;
	    int hu_seq = 0;
	    if (index != 3 && index != 7) {
	        return false;
	    }
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        if (comhu[i].type == CardCode.COM_CHI) {
	            if (id / 10 == type) {
	                if ((id % 10 == 2 || id % 10 == 3) && index == 3 && comhu[i].type2 == CardCode.COM_SEQ){
	                    return false;
	                }
	                if ((id % 10 == 5 || id % 10 == 6) && index == 7 && comhu[i].type2 == CardCode.COM_SEQ){
	                    return false;
	                }
	            }
	            if ((id == hu - 2 && index == 3) || (id == hu && index == 7)) {
	                hu_seq = 1;
	            }
	        }
	    }
	    return hu_seq > 0;
	}

	/*����*/
	public static boolean is_kan_zhang(CardKe comhu[], int comhu_len, int hu) {
	    int index = hu % 10;
	    int type = hu / 10;
	    int hu_seq = 0;
	    if (index == 1 || index == 9) {
	        return false;
	    }
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        if (comhu[i].type == CardCode.COM_CHI) {
	            if (id / 10 == type) {
	                if (comhu[i].type2 == CardCode.COM_SEQ && (id % 10 == index || id % 10 == index - 2)){
	                    return false;
	                }
	            }
	            if (id == hu - 1) {
	                hu_seq = 1;
	            }
	        }
	    }
	    return hu_seq > 0;
	}

	/*������*/
	public static boolean is_dan_diao_jiang(CardKe comhu[], int comhu_len, int hu) {
	    int jiang = 0;
	    int com = 0;
	    for (int i = 0; i < comhu_len; i++){
	        int id = comhu[i].id;
	        int type = comhu[i].type;
	        int type2 = comhu[i].type2;
	        if (id == hu && type == CardCode.COM_JIANG){
	            jiang++;
	        }
	        if (type == CardCode.COM_CHI && type2 == CardCode.COM_SEQ && (((id % 10 >= 3) && (id == hu - 3 || id == hu - 2)) || id == hu || id == hu + 1)){
	            com++;
	        }
	        if (type == CardCode.COM_PENG && type2 == CardCode.COM_KE && (id == hu - 1 || id == hu + 1)){
	            com++;
	        }
	    }
	    if (jiang > 0 && com == 0)
	        return true;
	    return false;
	}

	/*��һɫ*/
	public static boolean is_qing_yi_se(int pai[], CardKe complex[], int len) {

	    int wan = 0;
	    int tong = 0;
	    int tiao = 0;

	    int i = CardCode.HAND_SEQS;

	    //��������
	    for (; i <= CardCode.HAND_SEQE; i++) {
	        if (i >= 11 && i <= 19) {
	            wan += pai[i];
	        } else if (i >= 21 && i <= 29) {
	            tong += pai[i];
	        } else if (i >= 31 && i <= 39) {
	            tiao += pai[i];
	        } else if (pai[i] > 0) {
	            return false;
	        }
	    }

	    //���㸴��
	    int j = 0;
	    for (; j < len; j++) {
	        int id = complex[j].id;
	        if (id >= 11 && id <= 19) {
	            wan += 3;
	        } else if (id >= 21 && id <= 29) {
	            tong += 3;
	        } else if (id >= 31 && id <= 39) {
	            tiao += 3;
	        } else {
	            return false;
	        }
	    }

	    return (wan >= 14 || tong >= 14 || tiao >= 14);
	}

}
