package jing.pai.helper
{
import jing.pai.consts.CardCode;
import jing.pai.model.CardKe;
import jing.pai.utils.GuoBiaoCardsParser;

public class HuTypeParser {
	
	public static function swap( a:Array, m:int, n:int):void{
		var tmp:int= a[m];
		a[m] = a[n];
		a[n] = tmp;
	}
	
	public static function is_san_se_seq(id1:int, id2:int, id3:int):Boolean{
	    return ((id1 % 10+ 1== id2 % 10) && (id2 % 10+ 1== id3 % 10) 
	            && ((id1 / 10!= id2 / 10) && (id2 / 10!= id3 / 10) && (id1 / 10!= id3 / 10)));
	}
	

	/*大四喜*/
	public static function is_da_si_xi( pai:Array, complex:Array, len:int):Boolean{	//CardKe complex[]
	    var handfeng:int= 0;
	    /*东西南北风*/
	    for (var i:int= CardCode.HAND_ZIS; i <= CardCode.HAND_ZIS + 3; i++){
	        if (pai[i] == 3) {
	            handfeng++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS && complex[j].id < CardCode.HAND_ZIS + 4)) {
	            handfeng++;
	        }
	    }
	    return (handfeng == 4);
	}

	/*大三元*/
	public static function is_da_san_yuan( pai:Array, complex:Array , len:int):Boolean{
	    var handjian:int= 0;
	    /*中发白*/
	    for (var i:int= 4; i < 7; i++){
	        if (pai[i + CardCode.HAND_ZIS] == 3) {
	            handjian++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS + 4&& complex[j].id < CardCode.HAND_ZIS + 7)) {
	            handjian++;
	        }
	    }
	    return (handjian == 3);
	}

	public static function is_lv_se(id:int):Boolean{
	    var index:int= 0;
	    if (id == 46)return true;

	    if (id / 10!= 3){
	        return false;
	    }

	    index = id % 10;
	    if (index == 1|| index == 5|| index == 7|| index == 9){
	        return false;
	    }
	    return true;
	}

	/*绿一色*/
	public static function is_lv_yi_se(comhu:Array, comhu_len:int):Boolean{	//CardKe comhu
	    for (var j:int= 0; j < comhu_len; j++){
	        var type:int= comhu[j].type;
	        var id:int= comhu[j].id;
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

	/*九莲宝灯*/
	public static function is_jiu_lian_bao_deng(pai:Array, complex:Array, len:int, hu:int):Boolean{
	    var check_value:Array = [3,1,1,1,1,1,1,1,3];
	    var result:Boolean= false;
	    var start:int= 0;

	    pai[hu] -= 1;
	    //吃牌则不能胡九张，所以顺子一定在手牌上
	    for (var i:int= CardCode.HAND_SEQS; i < CardCode.HAND_SEQE; i += 10) {
	        if (pai[i] > 0){
	            start = i; 
	            result = true;
	            break;
	        }
	    }
	    
	    if (start == CardCode.HAND_SEQS || start == CardCode.HAND_SEQS + 10|| start == CardCode.HAND_SEQS + 20) {
	        //offset
	        for (var offset:int= 0; offset < check_value.length; offset++) {
	            if (pai[start + offset] != check_value[offset]) {
	                result = false;
	                break;
	            }
	        }
	    }

	    pai[hu] += 1;
	    return result;
	}

	/*四杠*/
	public static function is_si_gang(complex:Array, len:int):Boolean{
	    if (len < 4) return false;

	    for (var j:int= 0; j < len; j++){
	        var type:int= complex[j].type;
	        if (type != CardCode.COM_GANG) {
	            return false;
	        }
	    }
	    return true;
	}


	/*连七对，特殊牌型*/
	public static function is_lian_qi_dui( pai:Array ):Boolean{
	    var i:int= CardCode.HAND_SEQS;
	    var start:int= 0;
	    var check_index:Array = [ 
	        CardCode.HAND_SEQS, CardCode.HAND_SEQS + 1, CardCode.HAND_SEQS + 2,
	        CardCode.HAND_SEQS + 10, CardCode.HAND_SEQS + 11, CardCode.HAND_SEQS + 12,
	        CardCode.HAND_SEQS + 20, CardCode.HAND_SEQS + 21, CardCode.HAND_SEQS + 22,
	    ];

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
	    var end:int= start + 6;
	    for (var j:int= start; i <= end; i++)
	        if (pai[j] != 2) return false;

	    return true;
	}

	/*十三幺，特殊牌型*/
	public static function is_shi_san_yao( pai:Array ):Boolean{
	    var yao_seq_index:Array = [ CardCode.HAND_SEQS, CardCode.HAND_SEQS + 8, CardCode.HAND_SEQS + 10, CardCode.HAND_SEQS + 18, CardCode.HAND_SEQS + 20, CardCode.HAND_SEQS + 28,
	        CardCode.HAND_ZIS, CardCode.HAND_ZIS + 1, CardCode.HAND_ZIS + 2, CardCode.HAND_ZIS + 3, CardCode.HAND_ZIS + 4, CardCode.HAND_ZIS + 5, CardCode.HAND_ZIS + 6];
	    var eye:Boolean= false;
	    var cnt:int= 0;

	    for (var i:int= 0; i < yao_seq_index.length; i++) {
	        if ( !eye && pai[yao_seq_index[i]] == 2) {
	            eye = true;
	            continue;
	        }
	        if (pai[yao_seq_index[i]] != 1)return false;
	        cnt++;
	    }
	    return (cnt == 12&& eye);
	}

	/*清幺九*/
	public static function is_qing_yao_jiu(comhu:Array, comhu_len:int):Boolean{	//CardKe comhu
	    for (var j:int= 0; j < comhu_len; j++){
	        var type:int= comhu[j].type;
	        var id:int= comhu[j].id;
	        //将牌不做要求
	        if (type == CardCode.COM_JIANG) continue;
	        if (id % 10!= 1&& id % 10!= 9) return false;
	        if (type != CardCode.COM_PENG && type != CardCode.COM_GANG) {
	            return false;
	        }
	    }
	    return true;
	}

	/*小四喜*/
	public static function is_xiao_si_xi(pai:Array, complex:Array, len:int):Boolean{
	    var handfeng:int= 0;
	    var jiang:int= 0;
	    /*东西南北风*/
	    for (var i:int= CardCode.HAND_ZIS; i < CardCode.HAND_ZIS + 4; i++){
	        if (pai[i] == 3) {
	            handfeng++;
	        }
	        if (pai[i] == 2) {
	            jiang++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS && complex[j].id < CardCode.HAND_ZIS + 4)) {
	            handfeng++;
	        }
	    }
	    return (handfeng == 3&& jiang == 1);
	}

	/*小三元*/
	public static function is_xiao_san_yuan(pai:Array, complex:Array, len:int):Boolean{
	    var handjian:int= 0;
	    var jiang:int= 0;
	    /*中发白*/
	    for (var i:int= 4; i < 7; i++){
	        if (pai[i + CardCode.HAND_ZIS] == 3) {
	            handjian++;
	        }
	        if (pai[i + CardCode.HAND_ZIS] == 2) {
	            jiang++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS + 4&& complex[j].id < CardCode.HAND_ZIS + 7)) {
	            handjian++;
	        }
	    }
	    return (handjian == 2&& jiang == 1);
	}

	/*字一色*/
	public static function is_zi_yi_se(pai:Array, complex:Array, len:int):Boolean{
	    var handzi:int= 0;
	    var jiang:int= 0;
	    /*中发白*/
	    for (var i:int= 0; i < 7; i++){
	        if (pai[i + CardCode.HAND_ZIS] == 3) {
	            handzi++;
	        }
	        if (pai[i + CardCode.HAND_ZIS] == 2) {
	            jiang++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        if ((complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG)
	            && (complex[j].id >= CardCode.HAND_ZIS + 4&& complex[j].id < CardCode.HAND_ZIS + 7)) {
	            handzi++;
	        }
	    }
	    return (handzi == 4&& jiang == 1);
	}

	/*四暗刻 */
	public static function is_si_an_ke(pai:Array, complex:Array, len:int):Boolean{
	    var handke:int= 0;
	    /*中发白*/
	    for (var i:int= CardCode.HAND_SEQS; i < CardCode.HAND_LEN; i++){
	        //四暗刻不会出现手牌中多于三个的
	        if (pai[i] == 3) {
	            handke++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_GANG && complex[j].type == CardCode.COM_AN_GANG) {
	            handke++;
	        }
	    }
	    return (handke == 4);
	}

	/*一色双龙会*/
	public static function is_yi_se_shuang_long_hui(pai:Array, complex:Array, len:int):Boolean{
	    var handshao:int= 0;
	    var handlao:int= 0;
	    var color:int= 0;

	    for (var i:int= CardCode.HAND_SEQS + 4; i < CardCode.HAND_SEQE; i += 10){
	        if (pai[i] == 2) {
	            color = i / 10;
	            if (pai[i - 4] == pai[i - 3] && pai[i - 4] == pai[i - 2])
	                handshao += pai[i - 4];
	            if (pai[i + 4] == pai[i + 3] && pai[i + 4] == pai[i + 2])
	                handlao += pai[i + 4];
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_CHI) {
	            var id:int= complex[j].id;
	            if (color != id / 10)
	                return false;
	            if (id % 10== 1)
	                handshao++;
	            if (id % 10== 7) {
	                handlao++;
	            }
	        }
	    }
	    return (handshao == 2&& handlao == 2);
	}

	/*一色四同顺*/
	public static function is_yi_se_si_tong_shun(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [ 0, 0, 0, 0];
	    var len_seq:int= 0;

	    for (var j:int= 0; j < comhu_len; j++){
	        var id:int= comhu[j].id;
	        var type:int= comhu[j].type;
	        if (type == CardCode.COM_CHI && len_seq < seq.length) {
	            seq[len_seq++] = id;
	        }
	    }
	    if (len_seq != seq.length) return false;

	    if ((seq[0] == seq[1]) && (seq[1] == seq[2]) && (seq[2] == seq[3]))
	        return true;
	    return false;
	}

	/* 一色四节高*/
	public static function is_yi_se_si_jie_gao(comhu:Array, comhu_len:int):Boolean{
	    var ke_seq:Array = [ 0, 0, 0, 0];
	    var len_ke:int= 0;

	    for (var j:int= 0; j < comhu_len; j++){
	        var id:int= comhu[j].id;
	        var type:int= comhu[j].type;
	        var type2:int= comhu[j].type2;
	        if ((type == CardCode.COM_GANG || (type == CardCode.COM_PENG && type2 == CardCode.COM_KE)) && len_ke < ke_seq.length) {
	            ke_seq[len_ke++] = id;
	        }
	    }
	    if (len_ke != ke_seq.length) return false;

	    for (var m:int= 0; m < len_ke - 1; m++) {
	        for (var n:int= m + 1; m < len_ke; m++) {
	            if (ke_seq[n] < ke_seq[m]) {
	            	HuTypeParser.swap(ke_seq, m, n);
	            }
	        }
	    }

	    for (var m:int= 0; m < len_ke - 1; m++) {
	        if (ke_seq[m] + 1!= ke_seq[m + 1]){
	            return false;
	        }
	    }
	    return true;
	}

	/* 一色四步高*/
	public static function is_yi_se_si_bu_gao(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [ 0, 0, 0, 0];
	    var seq_len:int= 0;
	    for (var j:int= 0; j < comhu_len; j++){
	        if (comhu[j].type == CardCode.COM_CHI) {
	            seq[seq_len++] = comhu[j].id;
	        }
	    }

	    if (seq_len != seq.length) return false;

	    for (var m:int= 0; m < seq_len - 1; m++) {
	        for (var n:int= m + 1; m < seq_len; m++) {
	            if (seq[n] < seq[m]) {
	            	HuTypeParser.swap(seq, m, n);
	            }
	        }
	    }
	    var step:int= seq[1] - seq[0];
	    if (step > 2) return false;
	    for (var m:int= 1; m < seq_len - 1; m++) {
	        if (seq[m] + step != seq[m + 1]){
	            return false;
	        }
	    }
	    return true;
	}

	public static function get_gang(CardKe complex[], len:int):int{
	    var gang:int= 0;
	    for (var j:int= 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_GANG) {
	            gang++;
	        }
	    }
	    return gang;
	}

	/*三杠*/
	public static function is_san_gang(pai:Array, complex:Array, len:int):Boolean{
	    var gang:int= get_gang(complex, len);

	    return (gang == 3);
	}

	/*混幺九*/
	public static function is_hun_jiu_yao(pai:Array, complex:Array, len:int):Boolean{
	    var jiang:int= 0;
	    var ke:int= 0;
	    var id:int, type;
	    var seq_index:Array = [ CardCode.HAND_SEQS, CardCode.HAND_SEQS + 8, CardCode.HAND_SEQS + 10, CardCode.HAND_SEQS + 18, CardCode.HAND_SEQS + 20, CardCode.HAND_SEQS + 28];
	    for (var i:int= 0; i < seq_index.length; i++){
	        //不同花色是不连续的，所以
	        if (pai[seq_index[i]] == 2){
	            jiang++;
	        } else if (pai[seq_index[i]] == 3){
	            ke++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        id = complex[j].id;
	        type = complex[j].type;
	        if ((type == CardCode.COM_PENG || type == CardCode.COM_PENG) && (id >= CardCode.HAND_ZIS && id <= CardCode.HAND_ZIE)) {
	            ke++;
	        }
	    }
	    return (ke == 4&& jiang == 1);
	}

	/*七对，特殊牌型*/
	public static function is_qi_dui(pai:Array):Boolean{
	    var i:int= CardCode.HAND_START;
	    var num_dui:int= 0;

	    for (; i < CardCode.HAND_LEN; i++) {
	        if (pai[i] % 2!= 0) {
	            return false;
	        }
	        num_dui += pai[i] / 2;
	    }
	    return (num_dui == 7);
	}

	public static function bu_kao_seq_cnt(pai:Array):int{
	    var total:int= 0;
	    var seq:Array = [ 0, 0, 0];
	    var cnt_seq_index:Array = [ CardCode.HAND_SEQS, CardCode.HAND_SEQS + 1, CardCode.HAND_SEQS + 2, CardCode.HAND_SEQS + 10, CardCode.HAND_SEQS + 11, CardCode.HAND_SEQS + 12,
	        CardCode.HAND_SEQS + 20, CardCode.HAND_SEQS + 21, CardCode.HAND_SEQS + 22];
	    var i:int= 0;
	    while (i < cnt_seq_index.length) {
	        var pai_index:int= cnt_seq_index[i];
	        if (pai[pai_index] == 1){
	            /*如果一种类型已经有了，则不统计*/
	            var seqi:int= pai_index % 10- 1;
	            if (seq[seqi] == 0) {
	                total++;
	                if (pai[pai_index + 3] == 1)
	                    total++;
	                if (pai[pai_index + 6] == 1)
	                    total++;
	                seq[seqi] = 1;
	            }
	            /*下一个花色*/
	            i = (i + 3) / 3* 3;
	            continue;
	        }
	        i++;
	    }
	    return total;
	}

	/*七星不靠，特殊牌型*/
	public static function is_qi_xing_bu_kao(pai:Array):Boolean{
	    var total:int= bu_kao_seq_cnt(pai);
	    
	    if (total != 7) return false;
	    for (var j:int= CardCode.HAND_ZIS; j <= CardCode.HAND_ZIE; j++){
	        if (pai[j] != 1) return false;
	    }
	    return true;
	}

	/*全双刻*/
	public static function is_quan_shuang_ke(pai:Array, complex:Array, len:int):Boolean{
	    var id:int, type;
	    var shuang:int= 0;
	    var jiang:int= 0;
	    for (var i:int= CardCode.HAND_SEQS + 1; i < CardCode.HAND_SEQE; i += 2){
	        if (pai[i] == 3){
	            shuang++;
	        }
	        if (jiang == 0&& pai[i] == 2) {
	            jiang++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        id = complex[j].id;
	        type = complex[j].type;
	        if ((type == CardCode.COM_PENG || type == CardCode.COM_PENG) && (id >= CardCode.HAND_SEQS && id <= CardCode.HAND_SEQE) && (id % 2== 0)) {
	            shuang++;
	        }
	    }
	    return (shuang == 4&& jiang == 1);
	}

	/*一色三同顺*/
	public static function is_yi_se_san_tong_shun(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [ 0, 0, 0, 0];
	    var len_seq:int= 0;

	    for (var j:int= 0; j < comhu_len; j++){
	        var id:int= comhu[j].id;
	        var type:int= comhu[j].type;
	        if (type == CardCode.COM_CHI && len_seq < seq.length) {
	            seq[len_seq++] = id;
	        }
	    }
	    if (len_seq < seq.length-1) return false;

	    for (var m:int= 0; m < len_seq - 1; m++) {
	        for (var n:int= m + 1; m < len_seq; m++) {
	            if (seq[n] < seq[m]) {
	            	HuTypeParser.swap(seq, m, n);
	            }
	        }
	    }
	    //三个
	    if ((seq[0] == seq[1]) && (seq[1] == seq[2]))
	        return true;
	    //多于三个
	    if (len_seq > 3&& ((seq[1] == seq[2]) && (seq[2] == seq[3])))
	        return true;
	    return false;
	}

	/*一色三节高*/
	public static function is_yi_se_san_jie_gao(comhu:Array, comhu_len:int):Boolean{
	    var ke_seq:Array = [ 0, 0, 0, 0];
	    var len_ke:int= 0;

	    for (var j:int= 0; j < comhu_len; j++){
	        var id:int= comhu[j].id;
	        var type:int= comhu[j].type;
	        var type2:int= comhu[j].type2;
	        if ((type == CardCode.COM_GANG || (type == CardCode.COM_PENG && type2 == CardCode.COM_KE)) && len_ke < ke_seq.length) {
	            ke_seq[len_ke++] = id;
	        }
	    }
	    if (len_ke < ke_seq.length - 1) return false;

	    for (var m:int= 0; m < len_ke - 1; m++) {
	        for (var n:int= m + 1; m < len_ke; m++) {
	            if (ke_seq[n] < ke_seq[m]) {
	            	HuTypeParser.swap(ke_seq, m, n);
	            }
	        }
	    }

	    //同色
	    if ((ke_seq[0] + 1== ke_seq[1]) && (ke_seq[1] + 1== ke_seq[2]))
	        return true;
	    if (len_ke > 3&& ((ke_seq[1] + 1== ke_seq[2]) && (ke_seq[2] + 1== ke_seq[3])))
	        return true;
	    return false;
	}

	public static function all_in_interval(pai:Array, complex:Array, len:int, s:int, e:int):Boolean{
	    var type:int, id;
	    var total:int= 0;
	    for (var i:int= CardCode.HAND_SEQS + s - 1; i < CardCode.HAND_SEQE; i += 10){
	        total += (pai[i] + pai[i + 1] + pai[i + 2]);
	    }

	    for (var j:int= 0; j < len; j++){
	        id = complex[j].id;
	        type = complex[j].type;
	        if (type == CardCode.COM_CHI && (id % 10== s)) {
	            total += 3;
	        }
	        if ((type == CardCode.COM_GANG || type == CardCode.COM_PENG) && id <= CardCode.HAND_SEQE && id % 10>= s && id % 10<= e) {
	            total += 3;
	        }
	    }
	    return (total == 14);
	}

	/*全大*/
	public static function is_quan_da(pai:Array, complex:Array, len:int):Boolean{
	    return all_in_interval(pai, complex, len, 7, 9);
	}

	/*全中*/
	public static function is_quan_zhong(pai:Array, complex:Array, len:int):Boolean{
	    return all_in_interval(pai, complex, len, 4, 6);
	}

	/*全小*/
	public static function is_quan_xiao(pai:Array, complex:Array, len:int):Boolean{
	    return all_in_interval(pai, complex, len, 1, 3);
	}

	/*清龙*/
	public static function is_qing_long(pai:Array, complex:Array, len:int):Boolean{
	    var rest:Array = [] ;//同色剩余牌
	    var ri:int= 0;
	    var found:Boolean= false;

	    for (var i:int= 11; i < pai.length; i++) {
	    	rest[i] = pai[i];
	    }

	    for (var j:int= 0; j < len; j++){
	        var id:int= complex[j].id;
	        var type:int= complex[j].type;

	        if (type == CardCode.COM_CHI) {
	            rest[id]++; rest[id + 1]++; rest[id + 2]++;
	        }
	    }

	    for (var i:int= CardCode.HAND_SEQS; i < CardCode.HAND_SEQE; i += 10){
	        if (rest[i] == 0) continue;
	        found = true;
	        for (var j:int= 0; j < 9; j++) {
	            var index:int= i + j;
	            if (rest[index] == 0) {
	                ri = 0;
	                found = false;//没找到
	                break;
	            }
	            rest[index] = rest[index] - 1;
	            ri++;
	        }
	        if (found) break;//找到
	    }

	    if (!found) return false;

	    return GuoBiaoCardsParser.hu(rest, ri, 0);
	}

	/*三色双龙会，特殊牌型*/
	public static function is_san_se_shuang_long_hui(pai:Array, complex:Array, len:int):Boolean{
	    var laoshao:Array = [] ;
	    var jiang:int= 0;

	    for (var i:int= CardCode.HAND_SEQS + 4; i < CardCode.HAND_SEQE; i += 10){
	        var k:int= (i / 10- 1) * 2;
	        if (pai[i] == 2) {
	            laoshao[k] = 1;laoshao[k + 1] = 1;
	            jiang++;
	            continue;
	        }
	        if (pai[i - 4] == 1&& pai[i - 3] == 1&& pai[i - 2] == 1)
	            laoshao[k] = 1;
	        if (pai[i + 4] == 1&& pai[i + 3] == 1&& pai[i + 2] == 1)
	            laoshao[k + 1] = 1;
	    }
	    for (var j:int= 0; j < len; j++){
	        var id:int= complex[j].id;
	        var type:int= complex[j].type;
	        var k:int= (id / 10- 1) * 2;

	        if (type == CardCode.COM_CHI) {
	            if (id % 10== 1) {
	                laoshao[k] = 1;;
	            }
	            if (id % 10== 7) {
	                laoshao[k + 1] = 1;
	            }
	        }
	    }
	    for (var i:int= 1; i < laoshao.length; i++) {
	        laoshao[0] += laoshao[i];
	    }
	    return (laoshao[0] == 6);
	}

	/*一色三步高*/
	public static function is_yi_se_san_bu_gao(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [ 0, 0, 0, 0];
	    var seq_len:int= 0;
	    for (var j:int= 0; j < comhu_len; j++){
	        if (comhu[j].type == CardCode.COM_CHI) {
	            seq[seq_len++] = comhu[j].id;
	        }
	    }

	    if (seq_len < seq.length - 1) return false;

	    for (var m:int= 0; m < seq_len - 1; m++) {
	        for (var n:int= m + 1; m < seq_len; m++) {
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

	/*全带五*/
	public static function is_quan_dai_wu(comhu:Array, comhu_len:int):Boolean{
	    var seq5:int= 0;
	    var jiang5:int= 0;

	    for (var j:int= 0; j < comhu_len; j++){
	        var type:int= comhu[j].type;
	        var id:int= comhu[j].id;

	        if ((type == CardCode.COM_CHI) && (id % 10>= 3) && (id % 10<= 5)) {
	            seq5++;
	        }
	        if (type == CardCode.COM_JIANG) {
	            jiang5++;
	        }
	    }
	    if (seq5 == 4&& jiang5 == 1)
	        return true;
	    return false;
	}

	/*三同刻 */
	public static function is_san_tong_ke(pai:Array, complex:Array, len:int):Boolean{
	    var seq:Array = [] ;//同色剩余牌
	    var remain:int= 0;
	    var found:Boolean= false;

	    for (var i:int= 11; i < pai.length; i++) {
	    	seq[i] = pai[i];
	    }
	    for (var j:int= 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_PENG || complex[j].type == CardCode.COM_GANG) {
	            seq[complex[j].id] += 3;
	        }
	    }

	    for (var i:int= CardCode.HAND_SEQS; i < CardCode.HAND_SEQS + 9; i++){
	        if (seq[i] > 3&& seq[i + 10] > 3&& seq[i + 10] > 3) {
	            seq[i] -= 3; seq[i + 10] -= 3; seq[i + 20] -= 3;
	            remain -= 9;
	            found = true;
	            break;
	        }
	    }
	    if (!found) return false;
	    return GuoBiaoCardsParser.hu(seq, remain, 0);
	}

	/* 三暗刻 */
	public static function is_san_an_ke(pai:Array, complex:Array, len:int):Boolean{
	    var handke:int= 0;
	    /*中发白*/
	    for (var i:int= CardCode.HAND_SEQS; i < CardCode.HAND_LEN; i++){
	        if (pai[i] == 3) {
	            handke++;
	        }
	    }
	    for (var j:int= 0; j < len; j++){
	        if (complex[j].type == CardCode.COM_GANG) {
	            handke++;
	        }
	    }
	    return (handke == 4);
	}

	/*全不靠，特殊牌型*/
	public static function is_quan_bu_kao(pai:Array):Boolean{
	    var total:int= bu_kao_seq_cnt(pai);

	    if (total != 9) return false;

	    for (var j:int= CardCode.HAND_ZIS; j <= CardCode.HAND_ZIE; j++){
	        if (pai[j] == 1) total++;
	    }
	    return (total == 14);
	}

	/*TODO:组合龙，特殊牌型*/
	public static function is_zu_he_long(pai:Array, complex:Array, len:int):Boolean{
	    return false;
	}

	/*大于五*/
	public static function is_da_yu_wu(comhu:Array, comhu_len:int):Boolean{
	    for (var j:int= 0; j < comhu_len; j++){
	        if (comhu[j].id >= CardCode.HAND_ZIS || comhu[j].id % 10<= 5) {
	            return false;
	        }
	    }
	    return true;
	}

	/*小于五*/
	public static function is_xiao_yu_wu(comhu:Array, comhu_len:int):Boolean{
	    for (var j:int= 0; j < comhu_len; j++){
	        if (comhu[j].id >= CardCode.HAND_ZIS || comhu[j].id % 10>= 5) {
	            return false;
	        }
	        if (comhu[j].type == CardCode.COM_CHI && comhu[j].id > 2) {
	            return false;
	        }
	    }
	    return true;
	}

	/*三风刻*/
	public static function is_san_feng_ke(comhu:Array, comhu_len:int):Boolean{
	    var fengke:int= 0;
	    for (var j:int= 0; j < comhu_len; j++){
	        var id:int= comhu[j].id;
	        var type:int= comhu[j].type;
	        if (type == CardCode.COM_PENG && type == CardCode.COM_GANG) {    
	            if (id >= CardCode.HAND_ZIS && id <= CardCode.HAND_ZIS + 3){
	                fengke++;
	            }
	        }
	    }
	    return (fengke == 3);
	}

	/*花龙*/
	public static function is_hua_long(comhu:Array, comhu_len:int):Boolean{	//CardKe
//	    int seq[][] = [] ;
		var seq:Array = [[],[],[]];
	    for (var j:int= 0; j < comhu_len; j++){
	        var id:int= comhu[j].id;
	        var type:int= comhu[j].type;
	        var index:int= id % 10;
	        
	        if (type == CardCode.COM_CHI) {
	            if (index % 3== 1){
	                seq[id / 10- 1][(index - 1) / 3] = 1;
	            }
	        }
	    }
	    for (var i:int= 0; i < 3; i++){
	        for (var j:int= 0; j < 3; j++) {
	            if (i == j) continue;
	            for (var k:int= 0; k < 3; k++) {
	                if (i == k || j == k)continue;
	                if (seq[0][i] == 1&& seq[1][j] == 1&& seq[2][k] == 1) {
	                    return true;
	                }    
	            }
	        }
	    }
	    return false;
	}

	/*推不倒*/
	public static function is_tui_bu_dao(pai:Array, complex:Array, len:int):Boolean{
	    var seq:Array = [ 22, 24, 25, 26, 28, 29, 31, 32, 33, 34, 35, 38, 39, 47];
	    var total:int= 0;
	    for (var j:int= 0; j < len; j++){
	        var type:int= complex[j].type;
	        if (type == CardCode.COM_CHI) {
	            pai[j]++; pai[j + 1]++; pai[j + 2]++;
	        }
	        if (type == CardCode.COM_PENG && type == CardCode.COM_GANG) {
	            pai[j] += 3;
	        }
	    }
	    for (var i:int= 0; i < seq.length; i++) {
	        total += pai[i];
	    }
	    for (var j:int= 0; j < len; j++){
	        var type:int= complex[j].type;
	        if (type == CardCode.COM_CHI) {
	            pai[j]--; pai[j + 1]--; pai[j + 2]--;
	        }
	        if (type == CardCode.COM_PENG && type == CardCode.COM_GANG) {
	            pai[j] -= 3;
	        }
	    }
	    return (total == 14);
	}

	/*三色三同顺*/
	public static function is_san_se_san_tong_shun(comhu:Array, comhu_len:int):Boolean{
	    var tile:Array = [] ;
	    var color:Array = [] ;
	    var color2:Array = [] ;
	    var single_color:int= 0;
	    var index:int= 0;
	    var len:int= 0;

	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        if (comhu[i].type == CardCode.COM_CHI) {
	            tile[len++] = id;
	            color[id / 10- 1]++;
	        }
	    }
	    if (color[0] == 0|| color[1] == 0|| color[2] == 0)
	        return false;
	    /*找到只有一副顺子的花色，然后找到它对应的牌号，然后再看其他两个花色有没有相等的牌号*/
	    if (color[0] == 1) {
	        single_color = 1;
	    } else {
	        single_color = 2;
	    }
	    for (var j:int= 0; j < len; j++) {
	        if (single_color == tile[j] / 10) {
	            index = tile[j] % 10;
	            break;
	        }
	    }
	    for (var j:int= 0; j < len; j++) {
	        if (index == tile[j] % 10) {
	            color2[tile[j] / 10- 1] = 1;
	        }
	    }
	    if (color2[0] == 0|| color2[1] == 0|| color2[2] == 0)
	        return false;

	    return true;
	}

	/*三色三节高*/
	public static function is_san_se_san_jie_gao(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [] ;
	    var seq_len:int= 0;

	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if (type == CardCode.COM_PENG || type == CardCode.COM_GANG) {
	            seq[seq_len++] = id;
	        }
	    }
	    if (seq_len < 3) return false;

	    for (var m:int= 0; m < seq_len - 1; m++) {
	        for (var n:int= m + 1; m < seq_len; m++) {
	            //根据index排序
	            if (seq[n] % 10< seq[m] % 10) {
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

	/*碰碰和*/
	public static function is_peng_peng_hu(comhu:Array, comhu_len:int):Boolean{
	    var total:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var type:int= comhu[i].type;
	        if (type == CardCode.COM_PENG || type == CardCode.COM_GANG) {
	            total++;
	        }
	    }
	    return (total == 4);
	}

	/*混一色*/
	public static function is_hu_yi_se(comhu:Array, comhu_len:int):Boolean{
	    var color:int= 0;
	    var zi:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
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

	/*三色三步高*/
	public static function is_san_se_san_bu_gao(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [] ;
	    var seq_len:int= 0;

	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if (type == CardCode.COM_CHI) {
	            seq[seq_len++] = id;
	        }
	    }
	    if (seq_len < 3) return false;

	    for (var m:int= 0; m < seq_len - 1; m++) {
	        for (var n:int= m + 1; m < seq_len; m++) {
	            //根据index排序
	            if (seq[n] % 10< seq[m] % 10) {
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

	/*五门齐*/
	public static function is_wu_men_qi(comhu:Array, comhu_len:int):Boolean{
	    var color:Array = [] ;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        if (id >= CardCode.HAND_ZIS + 4) {
	            color[4] = 1;
	        } else if (id >= CardCode.HAND_ZIS){
	            color[3] = 1;
	        } else {
	            color[id / 10- 1] = 1;
	        }
	    }
	    for (var j:int= 1; j < color.length; j++) {
	        color[0] += color[j];
	    }
	    return (color[0] == 5);
	}

	/*全求人*/
	public static function is_quan_qiu_ren(pai:Array, complex:Array, len:int):Boolean{
	    return (len == 4);
	}

	/*双暗杠*/
	public static function is_shuang_an_gang(CardKe complex[], len:int):Boolean{
	    var total:int= 0;
	    for (var i:int= 0; i < len; i++){
	        if (complex[i].type == CardCode.COM_GANG && complex[i].type2 == CardCode.COM_AN_GANG) {
	            total++;
	        }
	    }
	    return (total == 2);
	}

	/*双箭刻*/
	public static function is_shuang_jian_ke(comhu:Array, comhu_len:int):Boolean{
	    var total:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if ((id >= CardCode.HAND_ZIS + 4) && (type == CardCode.COM_GANG || type == CardCode.COM_PENG)){
	            total++;
	        }
	    }
	    return (total == 2);
	}

	/*全带幺*/
	public static function is_quan_dai_yao(comhu:Array, comhu_len:int):Boolean{
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if (id >= CardCode.HAND_ZIS)continue;
	        if (id % 10== 1|| id % 10== 9) continue;
	        if (id % 10== 7&& type == CardCode.COM_CHI)continue;
	        return false;
	    }
	    return true;
	}

	/*双明杠*/
	public static function is_shuang_ming_gang(CardKe complex[], len:int):Boolean{
	    var total:int= 0;
	    for (var i:int= 0; i < len; i++){
	        if (complex[i].type == CardCode.COM_GANG && complex[i].type2 == CardCode.COM_MING_GANG) {
	            total++;
	        }
	    }
	    return (total == 2);
	}

	/*箭刻*/
	public static function is_jian_ke(comhu:Array, comhu_len:int):Boolean{
	    var total:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if ((id >= CardCode.HAND_ZIS + 4) && (type == CardCode.COM_GANG || type == CardCode.COM_PENG)){
	            total++;
	        }
	    }
	    return (total == 1);
	}
	/*圈风刻，不支持*/
	public static function is_quan_feng_ke(comhu:Array, comhu_len:int):Boolean{
	    return false;
	}

	/*平和*/
	public static function is_ping_hu(comhu:Array, comhu_len:int):Boolean{
	    for (var i:int= 0; i < comhu_len; i++){
	        if (comhu[i].id >= CardCode.HAND_ZIS){
	            return false;
	        }
	        if (comhu[i].type != CardCode.COM_JIANG && comhu[i].type != CardCode.COM_CHI){
	            return false;
	        }
	    }
	    return true;
	}

	/*四归一*/
	public static function is_si_gui_yi(comhu:Array, comhu_len:int):Boolean{
	    var pai:Array = [] ;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        if (comhu[i].type == CardCode.COM_CHI){
	            pai[id]++; pai[id + 1]++; pai[id + 2]++;
	        } if (comhu[i].type == CardCode.COM_PENG){
	            pai[id] += 3;
	        } else if (comhu[i].type == CardCode.COM_JIANG){
	            pai[id] += 2;
	        }
	    }
	    for (var j:int= 0; j <= CardCode.HAND_SEQE; j++) {
	        if (pai[j] == 4)
	            return true;
	    }
	    return false;
	}

	/*双同刻*/
	public static function is_shuang_tong_ke(comhu:Array, comhu_len:int):Boolean{
	    var pai:Array = [] ;
	    for (var i:int= 0; i < comhu_len; i++){
	        var index:int= comhu[i].id % 10;
	        if (comhu[i].type == CardCode.COM_PENG || comhu[i].type == CardCode.COM_GANG){
	            pai[index]++;
	        }
	    }
	    for (var j:int= 0; j < pai.length; j++) {
	        if (pai[j] == 2)
	            return true;
	    }
	    return false;
	}

	/*双暗刻*/
	public static function is_shuang_an_ke(comhu:Array, comhu_len:int):Boolean{
	    var total:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var type:int= comhu[i].type;
	        var type2:int= comhu[i].type2;
	        if ((type == CardCode.COM_PENG && type2 == CardCode.COM_KE) || (type == CardCode.COM_GANG && type2 == CardCode.COM_AN_GANG)){
	            total++;
	        }
	    }
	    return (total == 2);
	}

	/*暗杠*/
	public static function is_an_gang(CardKe complex[], len:int):Boolean{
	    var total:int= 0;

	    for (var i:int= 0; i < len; i++){
	        var type:int= complex[i].type;
	        var type2:int= complex[i].type2;
	        if (type == CardCode.COM_GANG && type2 == CardCode.COM_AN_GANG) {
	            total++;
	        }
	    }
	    return (total == 1);
	}

	/*断幺*/
	public static function is_duan_yao(comhu:Array, comhu_len:int):Boolean{
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if (id >= CardCode.HAND_ZIS)return false;
	        if (id % 10== 1|| id % 10== 9) return false;
	        if (id % 10== 7&& type == CardCode.COM_CHI)return false;
	    }
	    return true;
	}

	/*一般高*/
	public static function is_yi_ban_gao(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [] ;
	    var len:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if (type != CardCode.COM_CHI)
	            continue;
	        seq[len++] = id;
	    }
	    if (len < 2) return false;

	    for (var m:int= 0; m < len - 1; m++) {
	        for (var n:int= m + 1; m < len; m++) {
	            if (seq[n] < seq[m]) {
	            	HuTypeParser.swap(seq, m, n);
	            }
	        }
	    }

	    var tong_cnt:int= 0;
	    for (var j:int= 0; j < len - 1; j++) {
	        if (seq[j] == seq[j + 1]) {
	            tong_cnt++;
	        }
	    }
	    return (tong_cnt == 1);
	}

	/*不求人*/
	public static function is_bu_qiu_ren(CardKe complex[], len:int):Boolean{
	    
	    return len == 0;
	}

	/*门前清*/
	public static function is_men_qian_qing(CardKe complex[], len:int):Boolean{
	    return len == 0;
	}

	/*喜相逢*/
	public static function is_xi_xiang_feng(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [] ;
	    var len:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if (type != CardCode.COM_CHI)
	            continue;
	        for (var j:int= 0; j < len; j++) {
	            if ((seq[0] % 10== id % 10) && (seq[0] / 10!= id / 10)){
	                return true;
	            }
	        }
	        seq[len++] = id;
	    }
	    return false;
	}
	/*连六*/
	public static function is_lian_liu(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [] ;
	    var len:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if (type != CardCode.COM_CHI) 
	            continue;
	        for (var j:int= 0; j < len; j++) {
	            if (seq[0] + 3== id || seq[0] == id + 3){
	                return true;
	            }
	        }
	        seq[len++] = id;
	    }
	    return false;
	}

	/*老少副*/
	public static function is_lao_shao_fu(comhu:Array, comhu_len:int):Boolean{
	    var seq:Array = [] ;
	    var len:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var index:int= id % 10;
	        var type:int= comhu[i].type;
	        if (type != CardCode.COM_CHI)
	            continue;
	        if (index != 1&& index != 7)
	            continue;
	        for (var j:int= 0; j < len; j++) {
	            if ((index + (seq[j] % 10) == 7) && (id / 10== seq[j] / 10))
	                return true;
	        }
	        seq[len++] = id;
	    }
	    return false;
	}

	/*幺九刻*/
	public static function is_yao_jiu_ke(comhu:Array, comhu_len:int):Boolean{
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        if (type != CardCode.COM_PENG && type != CardCode.COM_GANG)
	            continue;
	        if (id >= CardCode.HAND_ZIS)return true;
	        if (id % 10== 1|| id % 10== 9) return true;
	    }
	    return false;
	}

	/*明杠*/
	public static function is_ming_gang(CardKe complex[], len:int):Boolean{
	    for (var i:int= 0; i < len; i++){
	        if (complex[i].type == CardCode.COM_GANG && complex[i].type2 == CardCode.COM_MING_GANG) {
	            return true;
	        }
	    }
	    return false;
	}

	/*缺一门*/
	public static function is_que_yi_men(comhu:Array, comhu_len:int):Boolean{
	    var color:Array = [] ;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        if (id >= CardCode.HAND_ZIS)continue;
	        color[id / 10] = 1;
	    }
	    return (color[1] + color[2] + color[3] < 3);
	}

	/*无字*/
	public static function is_wu_zi(comhu:Array, comhu_len:int):Boolean{
	    for (var i:int= 0; i < comhu_len; i++){
	        if (comhu[i].id >= CardCode.HAND_ZIS){
	            return false;
	        }
	    }
	    return true;
	}

	/*边张*/
	public static function is_bian_zhang(comhu:Array, comhu_len:int, hu:int):Boolean{
	    var index:int= hu % 10;
	    var type:int= hu / 10;
	    var hu_seq:int= 0;
	    if (index != 3&& index != 7) {
	        return false;
	    }
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        if (comhu[i].type == CardCode.COM_CHI) {
	            if (id / 10== type) {
	                if ((id % 10== 2|| id % 10== 3) && index == 3&& comhu[i].type2 == CardCode.COM_SEQ){
	                    return false;
	                }
	                if ((id % 10== 5|| id % 10== 6) && index == 7&& comhu[i].type2 == CardCode.COM_SEQ){
	                    return false;
	                }
	            }
	            if ((id == hu - 2&& index == 3) || (id == hu && index == 7)) {
	                hu_seq = 1;
	            }
	        }
	    }
	    return hu_seq > 0;
	}

	/*坎张*/
	public static function is_kan_zhang(comhu:Array, comhu_len:int, hu:int):Boolean{
	    var index:int= hu % 10;
	    var type:int= hu / 10;
	    var hu_seq:int= 0;
	    if (index == 1|| index == 9) {
	        return false;
	    }
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        if (comhu[i].type == CardCode.COM_CHI) {
	            if (id / 10== type) {
	                if (comhu[i].type2 == CardCode.COM_SEQ && (id % 10== index || id % 10== index - 2)){
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

	/*单钓将*/
	public static function is_dan_diao_jiang(comhu:Array, comhu_len:int, hu:int):Boolean{
	    var jiang:int= 0;
	    var com:int= 0;
	    for (var i:int= 0; i < comhu_len; i++){
	        var id:int= comhu[i].id;
	        var type:int= comhu[i].type;
	        var type2:int= comhu[i].type2;
	        if (id == hu && type == CardCode.COM_JIANG){
	            jiang++;
	        }
	        if (type == CardCode.COM_CHI && type2 == CardCode.COM_SEQ && (((id % 10>= 3) && (id == hu - 3|| id == hu - 2)) || id == hu || id == hu + 1)){
	            com++;
	        }
	        if (type == CardCode.COM_PENG && type2 == CardCode.COM_KE && (id == hu - 1|| id == hu + 1)){
	            com++;
	        }
	    }
	    if (jiang > 0&& com == 0)
	        return true;
	    return false;
	}

	/*清一色*/
	public static function is_qing_yi_se(pai:Array, complex:Array, len:int):Boolean{

	    var wan:int= 0;
	    var tong:int= 0;
	    var tiao:int= 0;

	    var i:int= CardCode.HAND_SEQS;

	    //计算手牌
	    for (; i <= CardCode.HAND_SEQE; i++) {
	        if (i >= 11&& i <= 19) {
	            wan += pai[i];
	        } else if (i >= 21&& i <= 29) {
	            tong += pai[i];
	        } else if (i >= 31&& i <= 39) {
	            tiao += pai[i];
	        } else if (pai[i] > 0) {
	            return false;
	        }
	    }

	    //计算复牌
	    var j:int= 0;
	    for (; j < len; j++) {
	        var id:int= complex[j].id;
	        if (id >= 11&& id <= 19) {
	            wan += 3;
	        } else if (id >= 21&& id <= 29) {
	            tong += 3;
	        } else if (id >= 31&& id <= 39) {
	            tiao += 3;
	        } else {
	            return false;
	        }
	    }

	    return (wan >= 14|| tong >= 14|| tiao >= 14);
	}

}
}