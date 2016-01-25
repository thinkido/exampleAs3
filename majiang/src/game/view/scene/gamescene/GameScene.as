package game.view.scene.gamescene
{
	import framework.consts.EventType;
	import framework.consts.KeyType;
	
	import game.constant.SceneType;
	import game.control.SceneManager;
	import game.control.WindowManager;
	import game.model.Global;
	import game.model.vo.EnterGameVO;
	import game.view.scene.gamescene.elements.GameInfoUI;
	
	import jing.consts.CardPlace;
	import jing.consts.GameDir;
	import jing.consts.MahjongState;
	import jing.consts.PlayerAction;
	import jing.game.model.GamePlayModel;
	import jing.game.net.GameRequest;
	import jing.game.view.JiaoPreviewUI;
	import jing.game.view.Mahjong;
	import jing.game.view.Player;
	import jing.pai.vo.ChuVO;
	import jing.pai.vo.JiaoVO;
	
	import starling.display.Stage;
	import starling.events.EventDispatcher;
	
	import ui.UIObject;
	import ui.UIScene;
	
	public class GameScene extends UIScene
	{
		
		/**
		 * 当前使用的场景
		 */
		static public var cur:GameScene = null;
		
		/**
		 * 游戏模型
		 */
		public var model:GamePlayModel = null;
		
		/**
		 * 上方玩家
		 */
		public var pUp:Player = null;
		
		/**
		 * 左方玩家
		 */
		public var pLeft:Player = null;
		
		/**
		 * 右方玩家
		 */
		public var pRight:Player = null;
		
		/**
		 * 下方玩家
		 */
		public var pDown:Player = null;
		
		/**
		 * 游戏信息
		 */
		public var info:GameInfoUI = null;
		
		/**
		 * 最后打出的牌
		 */
		public var lastChu:Mahjong = null;
		
		/**
		 * 叫牌预览
		 */
		private var jiaoPre:JiaoPreviewUI = null;
		
		override public function initUI():void
		{
			pUp = new Player(GameDir.UP);
			pLeft = new Player(GameDir.LEFT);
			pRight = new Player(GameDir.RIGHT);
			pDown = new Player(GameDir.DOWN);
			info = new GameInfoUI();
			
			this.addChild(pUp);
			this.addChild(pLeft);
			this.addChild(pRight);
			this.addChild(pDown);
			this.addChild(info);
			
			jiaoPre = new JiaoPreviewUI();
			jiaoPre.setVisible(false);
			this.addChild(jiaoPre);
		}
		
		public function jiaoTip( jiaos:Vector.<JiaoVO>):void
		{
			if(null == jiaos)
			{
				jiaoPre.setVisible(false);
			}
			else
			{
				jiaoPre.setVisible(true);
				jiaoPre.update(jiaos);
			}
			
		}
		
		/**
		 * 获得焦点
		 */
		override public function onStageFocus():void
		{
			trace("gamescene 监听键盘事件");
			Stage.current.keyboard.addEventListener(EventType.EVENT_KEY_PRESSED, this);
		}
		
		/**
		 * 失去焦点
		 */
		override public function onStageBlur():void
		{
			trace("gamescene 释放键盘事件");
			Stage.current.keyboard.removeEventListener(EventType.EVENT_KEY_PRESSED, this);
		}
		
		override public function onEnter():void
		{
			GameScene.cur = this;
			model = new GamePlayModel(_args as EnterGameVO);
			model.init();
		}
		
		override public function onLeave():void
		{
			GameScene.cur = null;
			jiaoPre.dispose();
			info.dispose();
			model.dispose();
			model = null;
		}
		
		public function reset():void
		{
			lastChu = null;
			this.pDown.reset();
			this.pUp.reset();
			this.pLeft.reset();
			this.pRight.reset();
			
			this.info.reset();
			
			this.model.reset();
		}
		
		public function readyGame():void
		{
			if(GameScene.cur.model.isKicked())
			{
				switchToHall();
			}
			else
			{
				reset();
				WindowManager.getInstance().closeAllWindow();
				GameRequest.ins().readyGame();
			}
		}
		
		public function switchToHall():void
		{
			Global.socketGame.close();
			// if(GameScene.cur.model.isKicked())
			// {
			WindowManager.getInstance().closeAllWindow();
			SceneManager.getInstance().switchScene(SceneType.SCENE_HALL);
			// }
			// else
			// {
			// GameRequest.ins().enterHall();
			// }
		}
		
		override public function onConfirm( target:UIObject):void
		{
			
		}
		
		public function getPlayerByDir( dir:String):Player
		{
			if(GameDir.UP == dir)
			{
				return pUp;
			}
			
			if(GameDir.LEFT == dir)
			{
				return pLeft;
			}
			
			if(GameDir.RIGHT == dir)
			{
				return pRight;
			}
			
			if(GameDir.DOWN == dir)
			{
				return pDown;
			}
			
			return null;
		}
		
		public function getPlayerBySeat(seat:int):Player
		{
			var dir:String = getDirBySeat(seat);
			return getPlayerByDir(dir);
		}
		
		public function getDirBySeat(seat:int):String
		{
			var code:int = (seat + 4 - pDown.seat()) % 4;
			
			if(code == 1)
			{
				return GameDir.RIGHT;
			}
			
			if(code == 2)
			{
				return GameDir.UP;
			}
			
			if(code == 3)
			{
				return GameDir.LEFT;
			}
			
			return GameDir.DOWN;
		}
		
		override public function onReciveEvent( type:int,  dispatcher:EventDispatcher, data:Object):void
		{
			if(type == EventType.EVENT_KEY_PRESSED)
			{
				var keyCode:int = int(data);
				
				if(keyCode == KeyType.BACK)
				{
					// TODO 点击了推出按钮
					return;
				}
				
				if(pDown.isAuto())
				{
					GameRequest.ins().gameManual();
					pDown.setAuto(false);
					info.showAuto(pDown.dir(), false);
				}
				
				switch(keyCode)
				{
					case KeyType.UP:
					case KeyType.LEFT:
						pDown.changeSelectCard(GameDir.LEFT);
						break;
					case KeyType.DOWN:
					case KeyType.RIGHT:
						pDown.changeSelectCard(GameDir.RIGHT);
						break;
					case KeyType.CONFIRM:
						if(pDown.inTurn())
						{
							var mj:Mahjong = pDown.getSelectedCard();
							if(null != mj)
							{
								GameRequest.ins().gameAction(PlayerAction.CHU, mj.card());
								pDown.setSelectCard(-1);
								GameScene.cur.glowSameCardOnTable(-1);
							}
						}
						break;
					// default:
					// GameRequest.ins().enterHall();
					// break;
				}
			}
		}
		
		/**
		 * 显示打牌相关的叫的信息
		 */
		public function showChuInfo( chuVO:ChuVO):void
		{
			if(null == chuVO)
			{
				// TODO 关闭叫牌信息显示
			}
			else
			{
				// TODO 打开叫牌信息显示
			}
		}
		
		/**
		 * 将桌面上显示的所有和指定牌相同的值得牌发光
		 * 
		 * @param card
		 */
		public function glowSameCardOnTable( card:int):void
		{
			pDown.resetCardsState(CardPlace.ON_TABLE);
			pUp.resetCardsState(CardPlace.ON_TABLE);
			pLeft.resetCardsState(CardPlace.ON_TABLE);
			pRight.resetCardsState(CardPlace.ON_TABLE);
			
			if(card != -1)
			{
				pDown.changeCardsState(CardPlace.ON_TABLE, card, MahjongState.NORMAL, MahjongState.GLOW);
				pUp.changeCardsState(CardPlace.ON_TABLE, card, MahjongState.NORMAL, MahjongState.GLOW);
				pLeft.changeCardsState(CardPlace.ON_TABLE, card, MahjongState.NORMAL, MahjongState.GLOW);
				pRight.changeCardsState(CardPlace.ON_TABLE, card, MahjongState.NORMAL, MahjongState.GLOW);
			}
			
			setLastChu(lastChu);
		}
		
		/**
		 * 最后打出的牌
		 * 
		 * @param mj
		 */
		public function setLastChu( mj:Mahjong):void
		{
			if(null == mj)
			{
				return;
			}
			
			if(lastChu != null)
			{
				lastChu.setState(MahjongState.NORMAL);
			}
			mj.setState(MahjongState.LAST_CHU);
			lastChu = mj;
		}
	}
}