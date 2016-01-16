
package game.view.window.rank;

import framework.resources.SpriteSheet;
import game.control.WindowManager;
import game.model.Global;
import game.model.vo.RankItemVO;
import game.util.CommonUtil;

import java.io.IOException;
import java.util.Vector;

import net.jarlehansen.protobuf.javame.ByteString;
import network.YiuNetworkHandlerMgr;
import network.YiuNetworkListener;
import protocol.cs_rank_list;
import protocol.sc_rank_list;
import protocol.t_rank_data;
import ui.UIButton;
import ui.UIImageView;
import ui.UILayer;
import ui.UIObject;
import ui.UITextBMFont;
import ui.UIWindow;

public class RankWindow extends UIWindow implements YiuNetworkListener
{

	private final int TAB_LENGTH = 3;

	private int _curTab;

	private UIButton[] _btnTabList;

	private RankLayerMediator[] _mediatorList;

	private UIButton _btnClose;

	private UIImageView _imgHead;

	private UITextBMFont _bfName;

	private UITextBMFont _bfLevel;

	private UITextBMFont _bfRank;

	private UITextBMFont _bfGold;

	private int[] _myRankList = new int[TAB_LENGTH];

	public void onEnter()
	{
		YiuNetworkHandlerMgr.subscribe(this);
		String name = Global.userDataVO.name;
		if(name.length() > 5)
			name = name.substring(name.length() - 5);
		_bfName.setText(name);
		_bfGold.setText(CommonUtil.formatGold(Global.userDataVO.gold));
		_bfLevel.setText(String.valueOf(Global.userDataVO.level));
		_bfRank.setText("0");
		_imgHead.setTexture(Global.getMyHeadTexture());
		try
		{
			Global.socketHall.sendProtobuf("cs_rank_list", cs_rank_list.newBuilder().setNoop(1).build().toByteArray());
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
	}

	public void onLeave()
	{
		YiuNetworkHandlerMgr.unSubscribe(this);
	}

	public void onConfirm(UIObject target)
	{
		if(target == _btnClose)
		{
			WindowManager.getInstance().closeCurWindow();
		}
	}

	public void updateTab()
	{
		for(int i = 0; i < TAB_LENGTH; i++)
		{
			boolean isCur = i == _curTab;
			if(isCur)
				switchFocus(_btnTabList[i]);
			_mediatorList[i].setVisible(isCur);
		}
		if(_myRankList[_curTab] == 0)
			_bfRank.setText("--");
		else
			_bfRank.setText("" + _myRankList[_curTab]);
	}

	public void onMove(byte dir)
	{
		if(_selected == _btnClose)
		{
			if(dir == DIR_DOWN)
			{
				switchFocus(_btnTabList[_curTab]);
			}
		}
		else
		{
			if(dir == DIR_DOWN)
				_mediatorList[_curTab].goNext();
			else if(dir == DIR_UP && _mediatorList[_curTab].goPre())
			{
				switchFocus(_btnClose);
			}
			else if(dir == DIR_LEFT)
			{
				_curTab--;
				if(_curTab < 0)
					_curTab += TAB_LENGTH;
				updateTab();
			}
			else if(dir == DIR_RIGHT)
			{
				_curTab++;
				if(_curTab >= TAB_LENGTH)
					_curTab -= TAB_LENGTH;
				updateTab();
			}
		}
	}

	public void initUI()
	{
		_btnTabList = new UIButton[TAB_LENGTH];
		_mediatorList = new RankLayerMediator[TAB_LENGTH];
		SpriteSheet ssSmallHead = getSheet("small_head_json");
		for(int i = 0; i < TAB_LENGTH; i++)
		{
			_btnTabList[i] = (UIButton)getChildByName("btn_tab_" + (i + 1));
			_mediatorList[i] = new RankLayerMediator((UILayer)getChildByName("layer_tab_" + (i + 1)), ssSmallHead);
		}
		_btnClose = (UIButton)getChildByName("btn_close");
		_imgHead = (UIImageView)getChildByName("img_head");
		_bfName = (UITextBMFont)getChildByName("bf_name");
		_bfName.setAnchor(ANCHOR_BOTTOM_LEFT);
		_bfLevel = (UITextBMFont)getChildByName("bf_level");
		_bfLevel.setAnchor(ANCHOR_BOTTOM_LEFT);
		_bfRank = (UITextBMFont)getChildByName("bf_rank");
		_bfRank.setAnchor(ANCHOR_BOTTOM_LEFT);
		_bfGold = (UITextBMFont)getChildByName("bf_gold");
		_bfGold.setAnchor(ANCHOR_BOTTOM_LEFT);
	}

	/** ÏûÏ¢·µ»Ø¼àÌý */
	public boolean onNetworkEvent(String name, ByteString content)
	{
		try
		{
			if(name.equals("sc_rank_list"))
			{
				sc_rank_list msg = sc_rank_list.parseFrom(content.toByteArray());
				Vector datalist = msg.getCoinData();
				int len = datalist.size();
				RankItemVO[] goldData = new RankItemVO[len];
				for(int i = 0; i < len; i++)
				{
					goldData[i] = new RankItemVO((t_rank_data)datalist.elementAt(i));
					goldData[i].value = CommonUtil.formatGold(Integer.valueOf(goldData[i].value).longValue());
				}
				_mediatorList[0].initData(goldData);
				datalist = msg.getExpData();
				len = datalist.size();
				RankItemVO[] levelData = new RankItemVO[len];
				for(int i = 0; i < len; i++)
				{
					levelData[i] = new RankItemVO((t_rank_data)datalist.elementAt(i));
				}
				_mediatorList[1].initData(levelData);
				datalist = msg.getWinData();
				len = datalist.size();
				RankItemVO[] winData = new RankItemVO[len];
				for(int i = 0; i < len; i++)
				{
					winData[i] = new RankItemVO((t_rank_data)datalist.elementAt(i));
				}
				_mediatorList[2].initData(winData);
				_myRankList[0] = msg.getMyCoin();
				_myRankList[1] = msg.getMyLevel();
				_myRankList[2] = msg.getMyWin();
				updateTab();
				return true;
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return true;
		}
		return false;
	}

	public void onDispose()
	{
		super.onDispose();
		_btnTabList = null;
		_mediatorList = null;
		_btnClose = null;
		_imgHead = null;
		_bfName = null;
		_bfLevel = null;
		_bfRank = null;
		_bfGold = null;
	}
}
