
package game.view.window.rank;

import framework.resources.SpriteSheet;
import framework.views.DisplayObject;
import game.model.vo.RankItemVO;
import ui.UIButton;
import ui.UIImageView;
import ui.UILayer;
import ui.UITextBMFont;

public class RankLayerMediator
{

	private final int ITEM_LENGTH = 4;

	private UILayer _layer;

	private int _curPage;

	private int _totalPage;

	private int _totalLength;

	private int _lastPageOffset;

	private UITextBMFont[][] _bfValueList;

	private UIImageView[] _imgHead;

	private RankItemVO[] _dataList;

	private UIImageView[] _imgTopThree;
	
	private UIButton _btnPageUp;

	private UIButton _btnPageDown;

	private SpriteSheet _ssSmallHead;

	public RankLayerMediator(UILayer layer, SpriteSheet ssSmallHead)
	{
		_layer = layer;
		_ssSmallHead = ssSmallHead;
		_bfValueList = new UITextBMFont[3][ITEM_LENGTH];
		_imgHead = new UIImageView[ITEM_LENGTH];
		_imgTopThree = new UIImageView[3];
		for(int i = 0; i < 3; i++)
		{
			_imgTopThree[i] = (UIImageView)_layer.getChildByName("img_top_" + (i + 1));
			for(int j = 0; j < ITEM_LENGTH; j++)
			{
				_bfValueList[i][j] = (UITextBMFont)_layer.getChildByName("bf_value_" + (i + 1) + "_" + (j + 1));
				_bfValueList[i][j].setAnchor(DisplayObject.ANCHOR_BOTTOM_LEFT);
			}
		}
		for(int i = 0; i < ITEM_LENGTH; i++)
		{
			_imgHead[i] = (UIImageView)_layer.getChildByName("img_head_" + (i + 1));
		}
		_btnPageUp = (UIButton)_layer.getChildByName("btn_page_up");
		_btnPageDown = (UIButton)_layer.getChildByName("btn_page_down");
	}

	public void initData(RankItemVO[] dataList)
	{
		_dataList = dataList;
		_curPage = 0;
		_totalLength = dataList.length;
		_totalPage = (int)Math.ceil(1.0 * _totalLength / ITEM_LENGTH);
		_lastPageOffset = _totalLength % ITEM_LENGTH;
		updateView();
	}

	public boolean goPre()
	{
		if(_curPage > 0)
		{
			_curPage--;
			updateView();
			return false;
		}
		else
			return true;
	}

	public void goNext()
	{
		if(_curPage < _totalPage - 1)
		{
			_curPage++;
			updateView();
		}
	}

	public void setVisible(boolean b)
	{
		_layer.setVisible(b);
	}

	private void updateView()
	{
		int offset = _curPage * ITEM_LENGTH;
		if(_curPage == _totalPage - 1)
			offset -= _lastPageOffset;
		for(int i = 0; i < ITEM_LENGTH; i++)
		{
			RankItemVO data = _dataList[offset + i];
			_bfValueList[0][i].setText("" + data.rank);
			_bfValueList[1][i].setText(data.name);
			_bfValueList[2][i].setText(data.value);
			_imgHead[i].setTexture(_ssSmallHead.getTexture("head_" + data.portrait));
		}
		boolean isFirstPage = _curPage == 0;
		for(int i = 0; i < 3; i++)
		{
			_imgTopThree[i].setVisible(isFirstPage);
			_bfValueList[0][i].setVisible(!isFirstPage);
		}
		
		if(_curPage < _totalPage - 1)
			_btnPageDown.setState(UIButton.STATE_NORMAL);
		else
			_btnPageDown.setState(UIButton.STATE_DISABLE);
		if(_curPage > 0)
			_btnPageUp.setState(UIButton.STATE_NORMAL);
		else
			_btnPageUp.setState(UIButton.STATE_DISABLE);
	}
}
