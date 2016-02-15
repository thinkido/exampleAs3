package game.view.scene.gamescene.windows
{
	import game.constant.WindowType;
	import game.control.WindowManager;
	import game.view.scene.gamescene.GameScene;
	import game.view.scene.gamescene.elements.ChiPreviewUI;
	
	import jing.consts.PlayerAction;
	import jing.game.net.GameRequest;
	
	import managers.ResManager;
	
	import protocol.gameserver.scgame_show_actions;
		
	import ui.UIButton;
	import ui.UIObject;
	import ui.UIWindow;
	
	/**
	 * 游戏动作
	 * 
	 * @author Jing
	 */
	public class PlayerActionWindow extends UIWindow
	{
		
		static private var _ins:PlayerActionWindow = null;
		
		static public function show(actions:Array):void
		{
			close();
			if(GameScene.cur.pDown.isAuto() == false && actions != null && actions.length >= 2)
			{
				WindowManager.getInstance().openWindow(WindowType.WINDOW_PLAYER_ACTION, actions);
			}
		}
		
		static public function close():void
		{
			if(_ins != null)
			{
				WindowManager.getInstance().closeWindow(_ins);
			}
		}
		
		private var _btns:Array = null;
		
		private var _btn2Act:Object = null;
		
		public function PlayerActionWindow()
		{
			_ins = this;
			_btns = [];
			_btn2Act = {};
		}
		
		private function show():void
		{
			var actions:Array = _args as Array;
			var btn:UIButton = null;
			var card:int ;
			for(var index:int = 0; index < actions.length; ++index)
			{
				var act:scgame_show_actions = actions[index] as scgame_show_actions;
				if(act.id == PlayerAction.AN_GANG || act.id == PlayerAction.MING_GANG)
				{
					btn = createBtnGang();
					if(_btns.length > 3)
					{
						_btns.insertElementAt(btn, 2);
					}
					else
					{
						_btns.addElement(btn);
					}
					_btn2Act[btn] = act;
				}
				else if(act.id == PlayerAction.PENG)
				{
					btn = createBtnPeng();
					if(_btns.size() > 2)
					{
						_btns.insertElementAt(btn, 1);
					}
					else
					{
						_btns.addElement(btn);
					}
					_btn2Act[btn] = act;
				}
				else if(act.id == PlayerAction.HU)
				{
					btn = createBtnHu();
					if(_btns.size() > 4)
					{
						_btns.insertElementAt(btn, 3);
					}
					else
					{
						_btns.addElement(btn);
					}
					_btn2Act[btn] = act;
				}
				else if(act.id == PlayerAction.GUO)
				{
					btn = createBtnGuo();
					_btns.insertElementAt(btn, 0);
					_btn2Act[btn] = act;
				}
				else if(act.id == PlayerAction.CHI_LEFT || act.id == PlayerAction.CHI_MIDDLE || act.id == PlayerAction.CHI_RIGHT)
				{
					card = int(act.tileSeq[0]);
					btn = createBtnChi(act.id, card);
					_btns.addElement(btn);
					_btn2Act[btn] = act;
				}
				
//				trace(act.toString());
				trace(act.toString());
			}


			
			var btnChiX:int = 587;
			var btnNormalX:int = 587;
			for(var i:int = 0; i < _btns.length; i++)
			{
				btn = _btns[i] as UIButton;
				this.addChild(btn);
				var pre:UIButton = null;
				var next:UIButton = null;
				if(i != 0)
				{
					pre = _btns[i - 1] as UIButton;
				}
				if(i != _btns.length - 1)
				{
					next = _btns[i + 1] as UIButton;
				}
				
				btn.setNeighbors(null, null, next, pre);
				
				act = _btn2Act[btn] as scgame_show_actions;
				var y:int;
				var gap:int;
				if(act.id == PlayerAction.CHI_LEFT || act.id == PlayerAction.CHI_MIDDLE || act.id == PlayerAction.CHI_RIGHT)
				{
					y = 170;
					gap = 60;
//					btn.setPosition(btnChiX - btn.width, y);
					btn.x = btnChiX - btn.width;
					btn.y = y ;
					btnChiX -= (gap + btn.width);
					
					card = int(act.tileSeq[0] );
					var cp:ChiPreviewUI = new ChiPreviewUI(card, act.id);
//					cp.setPosition(btn.getX() + 75, btn.getY() + 35);
					cp.x = btn.x + 75;
					cp.y = btn.y + 35;
					this.addChild(cp);
				}
				else
				{
					y = 300;
					gap = 20;
//					btn.setPosition(btnNormalX - btn.getWidth(), y);
					btn.x = btnNormalX - btn.width;
					btn.y = y ;
					btnNormalX -= gap + btn.width;
				}
			}
			
			switchFocus(_btns[1] as UIButton);
		}


		
		private function  createBtnGuo():UIButton
		{
			return new UIButton("action_guo_normal_png", "action_guo_selected_png", "action_guo_normal_png");
		}
		
		private function createBtnGang():UIButton
		{
			return new UIButton("action_gang_normal_png", "action_gang_selected_png", "action_gang_normal_png");
		}
		
		private function createBtnHu():UIButton
		{
			return new UIButton("action_hu_normal_png", "action_hu_selected_png", "action_hu_normal_png");
		}
		
		private function createBtnPeng():UIButton
		{
			return new UIButton("action_peng_normal_png", "action_peng_selected_png", "action_peng_normal_png");
		}
		
		private function createBtnChi(actId:int, card:int):UIButton
		{
			return new UIButton("action_chi_normal_png", "action_chi_selected_png", "action_chi_normal_png");
		}
		
		override public function initUI():void
		{
			
		}
		
		override public function onEnter():void
		{
			show();
		}
		
		override public function onLeave():void
		{
			ResManager.release("action_guo_normal_png");
		}
		
		override public function onConfirm( target:UIObject):void
		{
			var action:scgame_show_actions = _btn2Act[target] as scgame_show_actions;
			var id:int = action.id;
			trace("玩家选择了操作：" + id);
			var typeOrId:int = 0;
			if(id == PlayerAction.MING_GANG || id == PlayerAction.AN_GANG)
			{
				typeOrId = int(action.tileSeq[0]) ;
			}
			GameRequest.ins().gameAction(id, typeOrId);
			WindowManager.getInstance().closeWindow(this);
		}
	}
}