
package game.view.scene.gamescene.windows;

import jing.consts.CardPlace;
import jing.consts.GameDir;
import jing.game.view.Mahjong;
import jing.game.vo.GameEndTypeVO;
import jing.game.vo.GameEndVO;
import ui.UIButton;
import ui.UIImageView;
import ui.UIObject;
import ui.UITextBMFont;
import ui.UIWindow;
import framework.resources.FontSheet;
import framework.resources.Res;
import framework.resources.SpriteSheet;
import framework.resources.Texture;
import framework.views.Bitmap;
import framework.views.BitmapFont;
import game.constant.WindowType;
import game.control.WindowManager;
import game.view.scene.gamescene.GameScene;

public class GameEndWindow extends UIWindow
{

	private UIButton _btnHall = null;

	private UIButton _btnReady = null;

	private UIButton _btnCollect = null;

	private UIImageView _gameResult = null;

	private UIImageView _scoreType = null;

	private UITextBMFont _txtMoney = null;

	private GameEndVO _vo = null;

	private FontSheet _fnt = null;

	private SpriteSheet _huTypes = null;

	protected void initUI()
	{
		_btnHall = (UIButton)getChildByName("btn_hall");
		_btnReady = (UIButton)getChildByName("btn_ready");
		_btnCollect = (UIButton)getChildByName("btn_collect");
		_gameResult = (UIImageView)getChildByName("game_result");
		_scoreType = (UIImageView)getChildByName("score_type");
		_txtMoney = (UITextBMFont)getChildByName("txt_money");

		_btnHall.setNeighbors(null, null, _btnReady, _btnCollect);
		_btnCollect.setNeighbors(null, null, _btnHall, _btnReady);
		_btnReady.setNeighbors(null, null, _btnCollect, _btnHall);

		switchFocus(_btnReady);
	}

	public void onEnter()
	{
		_vo = (GameEndVO)_args;
		_fnt = Res.actively.getFontSheet("gameend_txt_fnt");
		_huTypes = Res.actively.getSheet("hu_type_json");
		update();
	}

	public void onLeave()
	{
		this.removeAllChildren();
		Res.actively.release("gameend_txt_fnt");
		Res.actively.release("hu_type_json");
	}

	private void update()
	{
		if(0 == _vo.state)
		{
			_gameResult.setTexture("gameend_draw_png");
			_scoreType.setVisible(false);
		}
		else if(1 == _vo.state)
		{
			_gameResult.setTexture("gameend_win_png");
			_scoreType.setTexture("win_type_png");
			showTypes();
		}
		else if(2 == _vo.state)
		{
			_gameResult.setTexture("gameend_lose_png");
			_scoreType.setTexture("lose_type_png");
			showTypes();
		}

		showCards();
		_txtMoney.setText("" + _vo.totalScoreChange);
	}

	private void showCards()
	{
		if(null == _vo.cards)
		{
			return;
		}

		int mjx = 130;
		int mjy = 94;
		for(int i = 0; i < _vo.cards.length; i++)
		{
			int card = _vo.cards[i];
			Mahjong mj = new Mahjong(card, GameDir.DOWN, CardPlace.ON_TABLE);
			this.addChild(mj);

			if(i == _vo.cards.length - 1 && _vo.state == 1)
			{
				mjx += 20;
			}

			mj.setPosition(mjx, mjy);

			mjx += mj.getWidth();
		}
	}

	private void showTypes()
	{
		int x = 160;
		int y = 175;
		int gap = 5;
		if(_vo.state == 2)
		{
			GameEndTypeVO vo = (GameEndTypeVO)_vo.huTypeVec.elementAt(0);
			y = y + createBitmapFont("TO:" + vo.id.toUpperCase(), x, y) + gap;
		}

		for(int i = 0; i < _vo.huTypeVec.size(); i++)
		{
			GameEndTypeVO vo = (GameEndTypeVO)_vo.huTypeVec.elementAt(i);
			if(vo.fan > 0)
			{
				Texture t = _huTypes.getTexture("" + vo.type);

				if(t != null)
				{
					Bitmap bmd = new Bitmap(t);
					bmd.setPosition(x, y);
					this.addChild(bmd);

					String sFan = null;
					if(vo.fan < 10)
					{
						sFan = "0" + vo.fan + "番";
					}
					else
					{
						sFan = vo.fan + "番";
					}
					int th = createBitmapFont(sFan, x + 150, y);

					y = y + th + gap;
				}
			}
		}
	}

	private int createBitmapFont(String text, int x, int y)
	{
		BitmapFont bf = null;
		bf = new BitmapFont(_fnt);
		bf.setText(text);
		bf.setPosition(x, y);
		this.addChild(bf);
		return 22;
	}

	public void onConfirm(UIObject target)
	{
		if(target == _btnHall)
		{
			System.out.println("返回大厅");
			GameScene.cur.switchToHall();
		}
		else if(target == _btnReady)
		{
			System.out.println("再来一局");
			GameScene.cur.readyGame();
		}
		else if(target == _btnCollect)
		{
			System.out.println("集牌箱");
			WindowManager.getInstance().openWindow(WindowType.WINDOW_COLLECT, new Boolean(true));
		}
	}

}
