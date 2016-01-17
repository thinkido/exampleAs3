package game.view.scene.gamescene.windows
{
		import framework.resources.FontSheet;
		import framework.resources.Res;
		import framework.resources.SpriteSheet;
		import framework.views.Bitmap;
		import framework.views.BitmapFont;
		
		import game.view.scene.gamescene.GameScene;
		
		import jing.consts.CardPlace;
		import jing.consts.GameDir;
		import jing.game.view.Mahjong;
		import jing.game.vo.GameEndTypeVO;
		import jing.game.vo.GameEndVO;
		
		import starling.display.Button;
		import starling.display.Image;
		import starling.textures.Texture;
		
		import ui.UIButton;
		import ui.UIImageView;
		import ui.UIObject;
		import ui.UITextBMFont;
		import ui.UIWindow;
		
		public class GameEndWindow extends UIWindow
		{
			
			private var _btnHall:Button = null;
			
			private var _btnReady:Button = null;
			
			private var _gameResult:UIImageView = null;
			
			private var _scoreType:UIImageView = null;
			
			private var  _txtMoney:UITextBMFont = null;
			
			private var _vo:GameEndVO = null;
			
			private var _fnt:FontSheet = null;
			
			private var _huTypes:SpriteSheet = null;
			
			protected function initUI():void
			{
				_btnHall = getChildByName("btn_hall") as Button;
				_btnReady = getChildByName("btn_ready") as Button;
				_gameResult = getChildByName("game_result") as UIImageView;
				_scoreType = getChildByName("score_type") as UIImageView;
				_txtMoney = getChildByName("txt_money") as UITextBMFont;
				
				_btnHall.setNeighbors(null, null, _btnReady, _btnReady);
				_btnReady.setNeighbors(null, null, _btnHall, _btnHall);
				
				switchFocus(_btnReady);
			}
			
			public function onEnter():void
			{
				_vo = _args as GameEndVO;
				_fnt = Res.actively.getFontSheet("gameend_txt_fnt");
				_huTypes = Res.actively.getSheet("hu_type_json");
				update();
			}
			
			override public function onLeave():void
			{
				this.removeAllChildren();
				Res.actively.release("gameend_txt_fnt");
				Res.actively.release("hu_type_json");
			}
			
			private function update():void
			{
				if(0 == _vo.state)
				{
					_gameResult.setTexture("gameend_draw_png");
//					_scoreType.setVisible(false);
					_scoreType.visible = false;
				}
				else if(1 == _vo.state)
				{
					_gameResult.setTexture("gameend_win_png");
					_scoreType.setTexture("win_type_png");
					showTypes();
				}
				else if(2 == _vo.state)
				{
					_gameResult.setTexture("gameend_lose_png");
					_scoreType.setTexture("lose_type_png");
					showTypes();
				}
				
				showCards();
				_txtMoney.setText("" + _vo.totalScoreChange);
			}
			
			private function showCards():void
			{
				if(null == _vo.cards)
				{
					return;
				}
				
				var mjx:int = 130;
				var mjy:int = 94;
				for(var i:int = 0; i < _vo.cards.length; i++)
				{
					var card:int = _vo.cards[i];
					var mj:Mahjong = new Mahjong(card, GameDir.DOWN, CardPlace.ON_TABLE);
					this.addChild(mj);
					
					if(i == _vo.cards.length - 1 && _vo.state == 1)
					{
						mjx += 20;
					}
					
					mj.setPosition(mjx, mjy);
					
					mjx += mj.getWidth();
				}
			}
			
			private function showTypes():void
			{
				var x:int = 160;
				var y:int = 175;
				var gap:int = 5;
				if(_vo.state == 2)
				{
					var vo:GameEndTypeVO = _vo.huTypeVec.elementAt(0) as GameEndTypeVO;
					y = y + createBitmapFont("TO:" + vo.id.toUpperCase(), x, y) + gap;
				}
				
				for(var i:int = 0; i < _vo.huTypeVec.size(); i++)
				{
					var vo:GameEndTypeVO = _vo.huTypeVec.elementAt(i) as GameEndTypeVO;
					
					var t:Texture= _huTypes.getTexture("" + vo.type);
					
					if(t != null)
					{
						var bmd:Image = new Image(t);
//						bmd.setPosition(x, y);
						bmd.x  = x;
						bmd.y = y;
						this.addChild(bmd);
						
						var sFan:String = null;
						if(vo.fan < 10)
						{
							sFan = "0" + vo.fan + "番";
						}
						else
						{
							sFan = vo.fan + "番";
						}
						var th:int = createBitmapFont(sFan, x + 150, y);
						
						y = y + th + gap;
					}
				}
			}
			
			private function createBitmapFont( text:String, x:int, y:int):int
			{
				var bf:BitmapFont = null;
				bf = new BitmapFont(_fnt);
				bf.setText(text);
				bf.setPosition(x, y);
				this.addChild(bf);
				return 22;
			}
			
			override public function onConfirm(target:UIObject):void
			{
				if(target == _btnHall)
				{
					trace("返回大厅");
					GameScene.cur.switchToHall();
				}
				else if(target == _btnReady)
				{
					trace("再来一局");
					GameScene.cur.readyGame();
				}
			}
			
		}
}
