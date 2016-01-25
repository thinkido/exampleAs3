package jing.game.view
{
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
 * ½ÐÅÆԤÀÀ
 * 
 * @author Jing
 */
public class JiaoPreviewUI extends Sprite
{

	private var _bgT:Texture= null;
	
	private var _fnt:FontSheet= null;

	public function JiaoPreviewUI()
	{		
		_bgT = Res.actively.getTexture("jiao_preview_bg_png");
		_fnt = Res.actively.getFontSheet("gameend_txt_fnt");
	}

	public function update(jiaos:Array):void{
		this.removeAllChildren();
		var x:int= 0;
		for(var i:int= 0; i < jiaos.length; i++)
		{
			var bg:Bitmap= new Bitmap(_bgT);
			this.addChild(bg);
			bg.setPosition(x, 0);
			x += bg.getWidth();
			
			var mj:Mahjong= new Mahjong(jiaos[i].jiaoCard, GameDir.DOWN, CardPlace.IN_HAND);
			var mjx:int= bg.getX() + (bg.getWidth() - mj.getWidth()) / 2;
			var mjy:int= bg.getY() + (bg.getHeight() - mj.getHeight()) / 2;
			mj.setPosition(mjx, mjy);
			this.addChild(mj);
			
			if(jiaos[i].hu != null)
			{
				var bf:BitmapFont= null;
				bf = new BitmapFont(_fnt);
				bf.setText(jiaos[i].hu.all_fan + "·¬");
				bf.setPosition(mjx, mjy + mj.getHeight());
				this.addChild(bf);
			}
			
			var bf:BitmapFont= null;
			bf = new BitmapFont(_fnt);
			bf.setText(111+ "·¬");
			bf.setPosition(mjx, mjy + mj.getHeight());
			this.addChild(bf);
		}

		this.setWidth(x);

		this.setPosition((640- x) / 2, 300);
	}

	public function dispose():void{
		Res.actively.release("jiao_preview_bg_png");
	}

}
}