
package jing.game.view;

import jing.consts.CardPlace;
import jing.consts.GameDir;
import jing.pai.vo.JiaoVO;
import framework.resources.FontSheet;
import framework.resources.Res;
import framework.resources.Texture;
import framework.views.Bitmap;
import framework.views.BitmapFont;
import framework.views.Sprite;

/**
 * Ω–≈∆‘§¿¿
 * 
 * @author Jing
 */
public class JiaoPreviewUI extends Sprite
{

	private Texture _bgT = null;
	
	private FontSheet _fnt = null;

	public JiaoPreviewUI()
	{		
		_bgT = Res.actively.getTexture("jiao_preview_bg_png");
		_fnt = Res.actively.getFontSheet("gameend_txt_fnt");
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
			
			if(jiaos[i].hu != null)
			{
				BitmapFont bf = null;
				bf = new BitmapFont(_fnt);
				bf.setText(jiaos[i].hu.all_fan + "∑¨");
				bf.setPosition(mjx, mjy + mj.getHeight());
				this.addChild(bf);
			}
			
			BitmapFont bf = null;
			bf = new BitmapFont(_fnt);
			bf.setText(111 + "∑¨");
			bf.setPosition(mjx, mjy + mj.getHeight());
			this.addChild(bf);
		}

		this.setWidth(x);

		this.setPosition((640 - x) / 2, 300);
	}

	public void dispose()
	{
		Res.actively.release("jiao_preview_bg_png");
	}

}
