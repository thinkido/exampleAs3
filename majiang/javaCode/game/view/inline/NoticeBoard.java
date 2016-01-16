package game.view.inline;

import java.util.Vector;

import javax.microedition.lcdui.Font;

import framework.resources.Res;
import framework.views.Bitmap;
import framework.views.Sprite;
import framework.views.Stage;
import framework.views.TextField;

/**
 * 跑马灯
 * 
 * @author Jing
 */
public class NoticeBoard extends Sprite {

	static private NoticeBoard _nb = new NoticeBoard();

	static public void show(String content) {
		_nb.add(content);
		_nb.setPosition(0, 50);
	}

	private Bitmap _bg;

	private TextField _tf;

	private Vector contents = new Vector();

	private boolean _playing = false;

	private NoticeBoard() {
		String filename = "notice_board_bg_png";
		_bg = new Bitmap(Res.actively.getTexture(filename));
		Res.actively.release(filename);
		this.addChild(_bg);
		_tf = new TextField();
		_tf.setBold(true);
		_tf.setColor(0xFFFFFF);
		_tf.setSize(Font.SIZE_LARGE);
		this.addChild(_tf);

	}

	public void add(String content) {
		contents.addElement(content);
		if (false == _playing) {
			next();
		}

	}

	/**
	 * 游戏进入新一帧
	 */
	protected void enterFrame(long time) {
		if (this.getParent() != null) {
			super.enterFrame(time);
			_tf.setPosition(_tf.getX() - 2, _tf.getY());
			if (_tf.getX() < -320) {
				_playing = false;
				next();
			}
		}
	}

	private void next() {
		if (contents.size() > 0) {
			_playing = true;
			String content = (String) contents.elementAt(0);
			contents.removeElementAt(0);
			_tf.setText(content);
			_tf.setPosition(640, 5);
			Stage.current.getRoot().addChild(_nb);
		} else {
			if (this.getParent() != null) {
				((Sprite) this.getParent()).removeChild(this);
			}
		}
	}
}
