
package game.view.scene.gamescene.elements;

import java.util.Hashtable;
import java.util.Vector;

import jing.consts.GameDir;
import ui.UIContainer;
import ui.UIImageView;
import ui.UIText;
import ui.UITextBMFont;
import framework.consts.TransType;
import framework.geom.Point;
import framework.resources.Res;
import framework.resources.SpriteSheet;
import framework.time.ITickListener;
import framework.time.TickItem;
import framework.views.DisplayObject;
import framework.views.MovieClip;
import framework.views.Stage;
import game.control.UserDataManager;

/**
 * 游戏信息层
 * 
 * @author Jing
 */
public class GameInfoUI extends UIContainer implements ITickListener
{

	// private Hashtable statePoints = new Hashtable(4);

	private Hashtable stateImgs = new Hashtable(4);

	private Hashtable txtNames = new Hashtable(4);

	private Hashtable huas = new Hashtable(4);

	private Hashtable huaStartPoint = new Hashtable(4);

	// private UIImageView lbRemain = null;

	private UIImageView nowAction = null;

	// private UIImageView lbBasescore = null;

	private UITextBMFont txtCd = null;

	private UITextBMFont txtBasescore = null;

	private UITextBMFont txtRemain = null;

	private int _cd = 0;

	private int _timerId = -1;

	public GameInfoUI()
	{
		initWithJsonObject(getJson("gameinfo_json"));
		stateImgs.put(GameDir.UP, getChildByName("state_up"));
		stateImgs.put(GameDir.LEFT, getChildByName("state_left"));
		stateImgs.put(GameDir.RIGHT, getChildByName("state_right"));
		stateImgs.put(GameDir.DOWN, getChildByName("state_down"));

		txtNames.put(GameDir.UP, getChildByName("txt_name_up"));
		txtNames.put(GameDir.LEFT, getChildByName("txt_name_left"));
		txtNames.put(GameDir.RIGHT, getChildByName("txt_name_right"));
		txtNames.put(GameDir.DOWN, getChildByName("txt_name_down"));

		huas.put(GameDir.UP, new Vector());
		huas.put(GameDir.LEFT, new Vector());
		huas.put(GameDir.RIGHT, new Vector());
		huas.put(GameDir.DOWN, new Vector());

		// lbRemain = (UIImageView)getChildByName("lb_remain");
		nowAction = (UIImageView)getChildByName("now_action");
		// lbBasescore = (UIImageView)getChildByName("lb_basescore");
		txtCd = (UITextBMFont)getChildByName("txt_cd");
		txtBasescore = (UITextBMFont)getChildByName("txt_basescore");
		txtRemain = (UITextBMFont)getChildByName("txt_remain");
		initHuaStartPoints();
		reset();

		_timerId = Stage.current.ticker.setTimeInterval(1000, this, null);

		layoutNameTxts();

		setName(GameDir.DOWN, UserDataManager.getInstance().getName());

		prereadyStatePoint(GameDir.UP);
		prereadyStatePoint(GameDir.LEFT);
		prereadyStatePoint(GameDir.DOWN);
		prereadyStatePoint(GameDir.RIGHT);

	}

	private void prereadyStatePoint(String dir)
	{
		UIImageView img = null;
		Point p = null;
		img = (UIImageView)stateImgs.get(dir);
		p = new Point(img.getX() + img.getWidth() / 2, img.getY() + img.getHeight() / 2);
		img.setAnchor(ANCHOR_CENTER);
		img.setPosition(p.x(), p.y());
		// statePoints.put(dir, p);
	}

	public void dispose()
	{
		Stage.current.ticker.release(_timerId);
		_timerId = -1;
	}

	public void reset()
	{
		((UIImageView)stateImgs.get(GameDir.UP)).clearTexture();
		((UIImageView)stateImgs.get(GameDir.LEFT)).clearTexture();
		((UIImageView)stateImgs.get(GameDir.RIGHT)).clearTexture();
		((UIImageView)stateImgs.get(GameDir.DOWN)).clearTexture();

		setCountdown(0);
		setRemainTiles(0);

		clearVectorImg((Vector)huas.get(GameDir.UP));
		clearVectorImg((Vector)huas.get(GameDir.LEFT));
		clearVectorImg((Vector)huas.get(GameDir.RIGHT));
		clearVectorImg((Vector)huas.get(GameDir.DOWN));
		
		
	}

	private void clearVectorImg(Vector vec)
	{
		for(int i = 0; i < vec.size(); i++)
		{
			UIImageView img = (UIImageView)vec.elementAt(i);
			if(img.getParent() == this)
			{
				this.removeChild(img);
			}
			img.clearTexture();
		}
		vec.removeAllElements();
	}

	public void setRoomBase(int roomBase)
	{
		txtBasescore.setText(roomBase + "");
	}

	public void setRemainTiles(int remainTiles)
	{
		String str = null;
		if(remainTiles >= 10)
		{
			str = remainTiles + "";
		}
		else
		{
			str = "0" + remainTiles;
		}
		txtRemain.setText(str);
	}

	public void setReady(String dir, boolean isReady)
	{
		UIImageView img = (UIImageView)stateImgs.get(dir);
		if(isReady)
		{
			img.setTexture("player_ready_png");
		}
		else
		{
			img.clearTexture();
		}
	}

	public void setHu(String dir, boolean isHu)
	{
		if(isHu)
		{
			UIImageView img = (UIImageView)stateImgs.get(dir);
			img.setTexture("game_hu_png");
		}
	}

	public void setName(String dir, String name)
	{
		UIText txt = (UIText)txtNames.get(dir);
		txt.setText(name);
	}

	/**
	 * 当前回合方位
	 * 
	 * @param dir
	 */
	public void setTurnDir(String dir)
	{
		nowAction.setTexture("now_action_" + dir + "_png");
	}

	/**
	 * 设置倒计时显示
	 * 
	 * @param cd
	 */
	public void setCountdown(int cd)
	{
		_cd = cd;
		onTick(null);
	}

	/**
	 * 对应的方位摸到花牌
	 * 
	 * @param dir
	 * @param card
	 */
	public void addHua(String dir, int card)
	{
		System.out.println(dir + " 获得花牌：" + card);

		UIImageView img = new UIImageView();
		img.setTexture("hua_" + card + "_1_png");
		Point p = (Point)huaStartPoint.get(dir);
		Vector vec = (Vector)huas.get(dir);

		if(dir.equals(GameDir.UP) || dir.equals(GameDir.DOWN))
		{
			img.setPosition(p.x() + vec.size() * img.getWidth(), p.y());
		}
		else if(dir.equals(GameDir.LEFT) || dir.equals(GameDir.RIGHT))
		{
			img.setPosition(p.x(), p.y() + vec.size() * img.getHeight());
		}
		this.addChild(img);
		vec.addElement(img);
	}

	/**
	 * 设置玩家是否托管
	 * 
	 * @param dir
	 * @param v
	 */
	public void showAuto(String dir, boolean v)
	{
		UIImageView img = (UIImageView)stateImgs.get(dir);
		if(true == v)
		{
			img.setTexture("player_auto_png");
		}
		else
		{
			img.clearTexture();
		}
	}

	public void onTick(TickItem tickItem)
	{
		if(_cd > 0)
		{
			_cd--;
			if(_cd < 10)
			{
				txtCd.setText("0" + _cd);
			}
			else
			{
				txtCd.setText("" + _cd);
			}
		}
	}

	private void layoutNameTxts()
	{
		int cx = Stage.current.stageWidth() >> 1;
		int cy = Stage.current.stageHeight() >> 1;

		UIText txt = null;
		txt = (UIText)txtNames.get(GameDir.UP);
		txt.setAnchor(ANCHOR_CENTER);
		txt.setPosition(cx, 10);
		txt.setText("等待加入");
		txt = (UIText)txtNames.get(GameDir.DOWN);
		txt.setAnchor(ANCHOR_CENTER);
		txt.setPosition(cx, 520);
		txt.setText("等待加入");
		txt = (UIText)txtNames.get(GameDir.LEFT);
		txt.setAnchor(ANCHOR_CENTER);
		txt.setTrans(TransType.ROT270);
		txt.setPosition(10, cy);
		txt.setText("等待加入");
		txt = (UIText)txtNames.get(GameDir.RIGHT);
		txt.setAnchor(ANCHOR_CENTER);
		txt.setTrans(TransType.ROT90);
		txt.setPosition(630, cy);
		txt.setText("等待加入");
	}

	private void initHuaStartPoints()
	{
		DisplayObject img = null;
		Point p = null;

		img = getChildByName("up_hua");
		p = new Point(img.getX(), img.getY());
		huaStartPoint.put(GameDir.UP, p);
		this.removeChild(img);

		img = getChildByName("left_hua");
		p = new Point(img.getX(), img.getY());
		huaStartPoint.put(GameDir.LEFT, p);
		this.removeChild(img);

		img = getChildByName("right_hua");
		p = new Point(img.getX(), img.getY());
		huaStartPoint.put(GameDir.RIGHT, p);
		this.removeChild(img);

		img = getChildByName("down_hua");
		p = new Point(img.getX(), img.getY());
		huaStartPoint.put(GameDir.DOWN, p);
		this.removeChild(img);
	}

	public void showEffect(String dir, String effect)
	{
		UIImageView img = (UIImageView)stateImgs.get(dir);

		SpriteSheet ss = Res.actively.getSheet("eft_" + effect + "_json");
		MovieClip mc = new MovieClip(ss, 100);
		mc.setAnchor(ANCHOR_CENTER);
		mc.setAutoDispose(true);
		mc.setPosition(img.getX(), img.getY());
		this.addChild(mc);
	}
}
