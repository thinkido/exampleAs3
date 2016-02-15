package game.view.scene.gamescene.elements
{
	import com.thinkido.framework.manager.loader.LoaderManager;
	import com.thinkido.framework.manager.loader.vo.LoadData;
	
	import flash.geom.Point;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import framework.consts.TransType;
	import framework.resources.Res;
	
	import game.control.UserDataManager;
	import game.model.Global;
	
	import jing.consts.GameDir;
	
	import managers.ResManager;
	
	import starling.display.DisplayObject;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.text.TextField;
	
	import ui.UIContainer;
	import ui.UIImageView;
	import ui.UIText;
	import ui.UITextBMFont;
	
	/**
	 * 游戏信息层
	 * 
	 * @author Jing
	 */
	public class GameInfoUI extends UIContainer //implements ITickListener
	{
	
		// private Object statePoints = new Object(4);
	
		private var stateImgs:Object = {};
	
		private var txtNames:Object = {};
	
		private var huas:Object = {};
	
		private var huaStartPoint:Object = {};
	
		// private UIImageView lbRemain = null;
	
		private var nowAction:UIImageView = null;
	
		// private UIImageView lbBasescore = null;
	
		private var txtCd:UITextBMFont = null;
	
		private var txtBasescore:UITextBMFont = null;
	
		private var txtRemain:UITextBMFont = null;
	
		private var _cd:int = 0;
	
		private var _timerId:int = -1;
	
		public function GameInfoUI()
		{
			initWithJsonObject(getJson("gameinfo_json"));
			stateImgs[GameDir.UP] = getChildByName("state_up");
			stateImgs[GameDir.LEFT] = getChildByName("state_left");
			stateImgs[GameDir.RIGHT] = getChildByName("state_right");
			stateImgs[GameDir.DOWN] = getChildByName("state_down");
	
			txtNames[GameDir.UP] = getChildByName("txt_name_up");
			txtNames[GameDir.LEFT] = getChildByName("txt_name_left");
			txtNames[GameDir.RIGHT] = getChildByName("txt_name_right");
			txtNames[GameDir.DOWN] = getChildByName("txt_name_down");
	
			huas[GameDir.UP]= [];
			huas[GameDir.LEFT] = [];
			huas[GameDir.RIGHT] = [];
			huas[GameDir.DOWN] = [];
	
			// lbRemain = (UIImageView)getChildByName("lb_remain");
			nowAction = this.getChildByName("now_action") as UIImageView;
			// lbBasescore = (UIImageView)getChildByName("lb_basescore");
			txtCd = getChildByName("txt_cd") as UITextBMFont;
			txtBasescore = getChildByName("txt_basescore") as UITextBMFont;
			txtRemain = getChildByName("txt_remain") as UITextBMFont;
			initHuaStartPoints();
			reset();
	
			_timerId = setInterval( onTick, 1000 );
	
			layoutNameTxts();
	
			setName(GameDir.DOWN, UserDataManager.getInstance().getName());
	
			prereadyStatePoint(GameDir.UP);
			prereadyStatePoint(GameDir.LEFT);
			prereadyStatePoint(GameDir.DOWN);
			prereadyStatePoint(GameDir.RIGHT);
	
		}
	
		private function prereadyStatePoint( dir:String):void
		{
			var img:UIImageView = null;
			var p:Point = null;
			img = stateImgs[dir] as UIImageView;
			p = new Point(img.x + img.width / 2, img.y + img.height / 2);
//			img.setAnchor(AnchorType.ANCHOR_CENTER);
//			img.setPosition(p.x(), p.y());
			img.x = p.x;
			img.y = p.y;
			// statePoints[dir, p);
		}
	
		override public function dispose():void
		{
			clearInterval( _timerId) ;
			_timerId = -1;
		}
	
		public function reset():void
		{
			(stateImgs[GameDir.UP] as UIImageView).clearTexture();
			(stateImgs[GameDir.LEFT] as UIImageView).clearTexture();
			(stateImgs[GameDir.RIGHT] as UIImageView).clearTexture();
			(stateImgs[GameDir.DOWN] as UIImageView).clearTexture();
	
			setCountdown(0);
			setRemainTiles(0);
	
			clearVectorImg(huas[GameDir.UP] as Array);
			clearVectorImg(huas[GameDir.LEFT] as Array);
			clearVectorImg(huas[GameDir.RIGHT] as Array);
			clearVectorImg(huas[GameDir.DOWN] as Array);
		}
	
		private function clearVectorImg( vec:Array):void
		{
			for(var i:int = 0; i < vec.length; i++)
			{
				var img:UIImageView = vec[i] as UIImageView;
				if(img.parent == this)
				{
					this.removeChild(img);
				}
				img.clearTexture();
			}


		}
	
		public function setRoomBase( roomBase:int):void
		{
			txtBasescore.setText(roomBase + "");
		}
	
		public function setRemainTiles( remainTiles:int):void
		{
			var str:String = null;
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
	
		public function setReady( dir:String, isReady:Boolean):void
		{
			var img:UIImageView = stateImgs[dir] as UIImageView;
			if(isReady)
			{
				img.setTexture_2("player_ready_png");
			}
			else
			{
				img.clearTexture();
			}
		}
	
		public function setHu( dir:String, isHu:Boolean):void
		{
			if(isHu)
			{
				var img:UIImageView = stateImgs[dir] as UIImageView;
				img.setTexture_2("game_hu_png");
			}
		}
	
		public function setName( dir:String,  name:String):void
		{
			var txt:TextField = txtNames[dir];
			txt.text = name;
		}
	
		/**
		 * 当前回合方位
		 * 
		 * @param dir
		 */
		public function setTurnDir( dir:String):void
		{
			nowAction.setTexture_2("now_action_" + dir + "_png");
		}
	
		/**
		 * 设置倒计时显示
		 * 
		 * @param cd
		 */
		public function setCountdown( cd:int):void
		{
			_cd = cd;
//			onTick(null);
			this.onTick();
		}
	
		/**
		 * 对应的方位摸到花牌
		 * 
		 * @param dir
		 * @param card
		 */
		public function addHua( dir:String, card:int):void
		{
//			trace(dir + " 获得花牌：" + card);
			trace(dir + " 获得花牌：" + card)
	
			var img:UIImageView = new UIImageView();
			img.setTexture_2("hua_" + card + "_1_png");
			var p:Point = huaStartPoint[dir] as Point;
			var vec:Array = huas[dir] as Array;
	
			if(dir == GameDir.UP || dir == GameDir.DOWN)
			{
//				img.setPosition(p.x() + vec.size() * img.getWidth(), p.y());
				img.x = p.x + vec.length * img.width;
				img.y = p.y ;
			}
			else if(dir == GameDir.LEFT || dir == GameDir.RIGHT)
			{
//				img.setPosition(p.x(), p.y() + vec.size() * img.getHeight());
				img.x = p.x ;
				img.y = p.y + vec.length * img.height;
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
		public function showAuto( dir:String, v:Boolean):void
		{
			var img:UIImageView = stateImgs[dir] as UIImageView;
			if(true == v)
			{
				img.setTexture_2("player_auto_png");
			}
			else
			{
				img.clearTexture();
			}
		}
	
		public function onTick( ):void
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
	
		private function layoutNameTxts():void
		{
			var cx:int = Global.SCREEN_WIDTH >> 1;
			var cy:int = Global.SCREEN_HEIGHT >> 1;
	
			var txt:UIText = null;
			txt = txtNames[GameDir.UP] as UIText;
//			txt.setAnchor(ANCHOR_CENTER);
			txt.x = cx ;
			txt.y = 10 ;
			txt.setText("等待加入");
			txt = txtNames[GameDir.DOWN] as UIText;
//			txt.setAnchor(ANCHOR_CENTER);
			txt.x = cx ;
			txt.y = 520 ;
			txt.setText("等待加入");
			txt = txtNames[GameDir.LEFT] as UIText;
//			txt.setAnchor(ANCHOR_CENTER);
			txt.rotation = TransType.ROT270 ;
			txt.x = 10 ;
			txt.y = cy ;
			txt.setText("等待加入");
			txt = txtNames[GameDir.RIGHT] as UIText;
//			txt.setAnchor(ANCHOR_CENTER);
			txt.rotation = TransType.ROT90 ;
			txt.x = 630 ;
			txt.y = cy ;
			txt.setText("等待加入");
		}
	
		private function initHuaStartPoints():void
		{
			var img:DisplayObject = null;
			var p:Point = null;
	
			img = getChildByName("up_hua");
			p = new Point(img.x, img.x);
			huaStartPoint[GameDir.UP] = p;
			this.removeChild(img);
	
			img = getChildByName("left_hua");
			p = new Point(img.x, img.x);
			huaStartPoint[GameDir.LEFT] = p;
			this.removeChild(img);
	
			img = getChildByName("right_hua");
			p = new Point(img.x, img.x);
			huaStartPoint[GameDir.RIGHT] = p;
			this.removeChild(img);
	
			img = getChildByName("down_hua");
			p = new Point(img.x, img.x);
			huaStartPoint[GameDir.DOWN] = p;
			this.removeChild(img);
		}
		private var mc:MovieClip ;
		public function showEffect( dir:String, effect:String):void
		{
			var img:UIImageView = stateImgs[dir] as UIImageView;
			
			var url:String = "eft_" + effect + "_json" ;
			
			var ld:LoadData = new LoadData( url , effectLoaded , null , null,"",url) ;
			LoaderManager.load([ld] ,  ResManager.resLoader ) ;
			
			mc = ResManager.getFile("eft_" + effect + "_json" , Res.TYPE_MOVIECLIP ) as MovieClip;
			mc.x = img.x ;
			mc.y = img.y ;
			mc.addEventListener( Event.COMPLETE , mcEnd );
			this.addChild(mc);
			
//			var ss:SpriteSheet = Res.actively.getSheet("eft_" + effect + "_json");
//			var mc:MovieClip = new MovieClip(ss, 100);
//			mc.setAnchor(ANCHOR_CENTER);
//			mc.setAutoDispose(true);
//			mc.setPosition(img.getX(), img.getY());
//			this.addChild(mc);
		}
		
		private function mcEnd( evt:Event ):void{
			mc.removeEventListener( Event.COMPLETE , mcEnd );
			this.removeChild( mc ); 
		}
		
		private function effectLoaded( ld:LoadData , evt:Event ):void{
			
		}
		
	}
}
