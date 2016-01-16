
package jing.game.view;

import jing.consts.CardPlace;
import jing.consts.GameDir;
import jing.pai.vo.JiaoVO;
import framework.resources.Res;
import framework.resources.Texture;
import framework.views.Bitmap;
import framework.views.Sprite;

/**
 * Ω–≈∆‘§¿¿
 * 
 * @author Jing
 */
public class JiaoPreviewUI extends Sprite
{

	private Texture _bgT = null;

	public JiaoPreviewUI()
	{
		_bgT = Res.actively.getTexture("jiao_preview_bg_png");
	}

	public void update(JiaoVO[] jiaos)
	{
		this.removeAllChildren();
		int x = 0;
		for(int i = 0; i < jiaos.length; i++)
		{
			Bitmap bg = new Bitmap(_bgT);
			this.addChild(bg);
			bg.setPosition(x, 0);
			x += bg.getWidth();

			Mahjong mj = new Mahjong(jiaos[i].jiaoCard, GameDir.DOWN, CardPlace.IN_HAND);
			int mjx = bg.getX() + (bg.getWidth() - mj.getWidth()) / 2;
			int mjy = bg.getY() + (bg.getHeight() - mj.getHeight()) / 2;
			mj.setPosition(mjx, mjy);
			this.addChild(mj);
		}

		this.setWidth(x);

		this.setPosition((640 - x) / 2, 300);
	}

	public void dispose()
	{
		Res.actively.release("jiao_preview_bg_png");
	}

}
