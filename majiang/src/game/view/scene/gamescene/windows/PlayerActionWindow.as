package game.view.scene.gamescene.windows
{
	import game.control.WindowManager;
	import game.view.scene.gamescene.elements.ChiPreviewUI;
	
	import starling.display.Button;
	
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
			for(var index:int = 0; index < actions.length; ++index)
			{
				var act:scgame_show_actions = actions[index] as scgame_show_actions;
				var btn:Button = null;
				if(act.getId() == PlayerAction.AN_GANG || act.getId() == PlayerAction.MING_GANG)
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
					_btn2Act.put(btn, act);
				}
				else if(act.getId() == PlayerAction.PENG)
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
					_btn2Act.put(btn, act);
				}
				else if(act.getId() == PlayerAction.HU)
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
					_btn2Act.put(btn, act);
				}
				else if(act.getId() == PlayerAction.GUO)
				{
					btn = createBtnGuo();
					_btns.insertElementAt(btn, 0);
					_btn2Act.put(btn, act);
				}
				else if(act.getId() == PlayerAction.CHI_LEFT || act.getId() == PlayerAction.CHI_MIDDLE || act.getId() == PlayerAction.CHI_RIGHT)
				{
					var card:int = int(act.getTile_seq().elementAt(0));
					btn = createBtnChi(act.getId(), card);
					_btns.addElement(btn);
					_btn2Act.put(btn, act);
				}
				
//				System.out.println(act.toString());
				trace(act.toString());
			}


			
			var btnChiX:int = 587;
			var btnNormalX:int = 587;
			for(var i:int = 0; i < _btns.length; i++)
			{
				var btn:Button = _btns[i] as Button;
				this.addChild(btn);
				var pre:Button = null;
				var next:Button = null;
				if(i != 0)
				{
					pre = _btns[i - 1] as Button;
				}
				if(i != _btns.length - 1)
				{
					next = _btns[i + 1] as Button;
				}
				
				btn.setNeighbors(null, null, next, pre);
				
				scgame_show_actions act = (scgame_show_actions)_btn2Act.get(btn);
				if(act.getId() == PlayerAction.CHI_LEFT || act.getId() == PlayerAction.CHI_MIDDLE || act.getId() == PlayerAction.CHI_RIGHT)
				{
					var y:int = 170;
					var gap:int = 60;
//					btn.setPosition(btnChiX - btn.width, y);
					btn.x = btnChiX - btn.width;
					btnChiX -= (gap + btn.width);
					
					var card:int = int(act.getTile_seq().elementAt(0));
					var cp:ChiPreviewUI = new ChiPreviewUI(card, act.getId());
//					cp.setPosition(btn.getX() + 75, btn.getY() + 35);
					cp.x = btn.x + 75;
					cp.y = btn.y + 35;
					this.addChild(cp);
				}
				else
				{
					var y:int = 300;
					var gap:int = 20;
//					btn.setPosition(btnNormalX - btn.getWidth(), y);
					btn.x = btnNormalX - btn.width;
					btnNormalX -= gap + btn.width;
				}
			}
			
			switchFocus(_btns[1] as Button);
		}


		
		private function  createBtnGuo():Button
		{
			return new UIButton("action_guo_normal_png", "action_guo_selected_png", "action_guo_normal_png");
		}
		
		private function createBtnGang():Button
		{
			return new UIButton("action_gang_normal_png", "action_gang_selected_png", "action_gang_normal_png");
		}
		
		private function createBtnHu():Button
		{
			return new UIButton("action_hu_normal_png", "action_hu_selected_png", "action_hu_normal_png");
		}
		
		private function createBtnPeng():Button
		{
			return new UIButton("action_peng_normal_png", "action_peng_selected_png", "action_peng_normal_png");
		}
		
		private function createBtnChi(actId:int, card:int):Button
		{
			return new UIButton("action_chi_normal_png", "action_chi_selected_png", "action_chi_normal_png");
		}
		
		override protected function initUI():void
		{
			
		}
		
		override public function onEnter():void
		{
			show();
		}
		
		override public function onLeave():void
		{
			Res.actively.release("action_guo_normal_png");
		}
		
		override public function onConfirm( target:UIObject):void
		{
			var action:scgame_show_actions = _btn2Act.get(target) as scgame_show_actions;
			var id:int = action.getId();
			trace("玩家选择了操作：" + id);
			var typeOrId:int = 0;
			if(id == PlayerAction.MING_GANG || id == PlayerAction.AN_GANG)
			{
				typeOrId = ((Integer)action.getTile_seq().elementAt(0)).intValue();
			}
			GameRequest.ins().gameAction(id, typeOrId);
			WindowManager.getInstance().closeWindow(this);
		}
	}
}