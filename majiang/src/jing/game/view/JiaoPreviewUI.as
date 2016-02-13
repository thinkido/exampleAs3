package jing.game.view
{
import framework.resources.Res;

import jing.consts.CardPlace;
import jing.consts.GameDir;
import jing.pai.vo.JiaoVO;

import managers.ResManager;

import starling.display.Image;
import starling.display.Sprite;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;

/**
 * ½ÐÅÆԤÀÀ
 * 
 * @author Jing
 */
public class JiaoPreviewUI extends Sprite
{

	private var _bgT:Texture= null;
	
	private var _fntName:String = "" ;

	public function JiaoPreviewUI()
	{		
		_bgT = ResManager.getFile("jiao_preview_bg_png" , Res.TYPE_TEXTURE ) ;
		_fntName = "gameend_txt_fnt" ;
	}

	public function update(jiaos:Vector.<JiaoVO>):void{
		this.removeAllChildren();
		var x:int= 0;
		for(var i:int= 0; i < jiaos.length; i++)
		{
			var bg:Image= new Image(_bgT);
			this.addChild(bg);
			bg.x = x ;
			x += bg.width ;
			
			var mj:Mahjong= new Mahjong(jiaos[i].jiaoCard, GameDir.DOWN, CardPlace.IN_HAND);
			var mjx:int= bg.x + (bg.width - mj.width) / 2;
			var mjy:int= bg.y + (bg.height - mj.height) / 2;
//			mj.setPosition(mjx, mjy);
			mj.x = mjx;
			mj.y = mjy;
			this.addChild(mj);
			var bf:BitmapFont= null;
			bf = ResManager.getFile(_fntName , Res.TYPE_FONT ) as BitmapFont;
			TextField.registerBitmapFont( bf , _fntName );
			var txt:TextField ;
			
			if(jiaos[i].hu != null)
			{
				txt = new TextField();
				txt.text = jiaos[i].hu.all_fan + "·¬" ;
				txt.x = mjx ;
				txt.y = mjy + mj.height ;
				txt.fontName = _fntName ;
				this.addChild(txt);
			}
			
			txt = new TextField();
			txt.text = 111 + "·¬" ;
			txt.x = mjx ;
			txt.y = mjy + mj.height ;
			txt.fontName = _fntName ;
			this.addChild(txt);
		}

//		this.setWidth(x);
		this.width = x;

//		this.setPosition((640- x) / 2, 300);
		this.x = (640 - x) / 2;
		this.y = 300;
	}
	
	public function removeAllChildren():void
	{
		var num:int = this.numChildren;
		while(num-- > 0)
		{
			this.removeChildAt(0);
		}
	}

	public function dispose():void{
		ResManager.release("jiao_preview_bg_png");
	}

}
}