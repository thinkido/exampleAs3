package game.control;

import protocol.sc_enter_hall;
import protocol.t_friend_data;

public class UserDataManager {

	private static UserDataManager _instance;

	private String _name = "Jordan";

	private long _gold = 0;

	private long _exp = 0;

	private int _level = 0;

	private int _sex = 0;

	private int _vip = 0;

	private boolean _first = false;

	private int _portrait = 0;

	private int _score = 0;

	private String _idtype = "tv";

	// private int _taskAwardNum;
	// private int _achieveAwardNum;

	public UserDataManager() {

	}

	public static UserDataManager getInstance() {
		if (null == _instance) {
			_instance = new UserDataManager();
		}
		return _instance;
	}

	public void initData(sc_enter_hall msg) {
		_name = msg.getName();
		// if(_name)

		_gold = msg.getGold();
		_exp = msg.getExp();
		_level = msg.getLevel();
		_sex = msg.getSex();
		_vip = msg.getVip();
		_first = msg.getFirst_buy_gold();
		_portrait = msg.getPortrait();
		_score = msg.getCollect_score();
		// _taskAwardNum = msg.getQuest_can_fetch();
		// _achieveAwardNum = msg.getAch_can_fetch();
	}

	public void updateByFriendProfile(t_friend_data friend) {
		_name = friend.getName();
		_gold = friend.getGold();
		_exp = friend.getExp();
		_level = friend.getLevel();
		_sex = friend.getSex();
		_vip = friend.getVip();
		_portrait = friend.getPortrait();

		// TODO: no score
		// _score = friend.getScore();
	}

	public String getName() {
		return _name;
	}

	public long getGold() {
		return _gold;
	}

	public void setGold(long value) {
		_gold = value;
	}

	public long changeGold(long value) {
		_gold += value;
		return _gold;
	}

	public long getExp() {
		return _exp;
	}

	public long changeExp(long value) {
		_exp += value;
		return _exp;
	}

	public int getLevel() {
		return _level;
	}

	public int changeExp(int value) {
		_level += value;
		return _level;
	}

	public int getSex() {
		return _sex;
	}

	public void setSex(int value) {
		_sex = value;
	}

	public int getVip() {
		return _vip;
	}

	public int changeVip(int value) {
		_vip += value;
		return _vip;
	}

	public int getScore() {
		return _score;
	}

	public int changeScore(int value) {
		_score += value;
		return _score;
	}

	public boolean getFirst() {
		return _first;
	}

	public boolean changeFirst() {
		return _first = !_first;
	}

	public String getIdType() {
		return _idtype;
	}

	public int getPortrait() {
		return _portrait;
	}

	public void setPortrait(int portrait) {
		_portrait = portrait;
	}
}
