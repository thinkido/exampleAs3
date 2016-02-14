package game.view.scene.gamescene.windows
{
		import framework.resources.Res;
		
		import game.view.scene.gamescene.GameScene;
		
		import jing.consts.CardPlace;
		import jing.consts.GameDir;
		import jing.game.view.Mahjong;
		import jing.game.vo.GameEndTypeVO;
		import jing.game.vo.GameEndVO;
		
		import managers.ResManager;
		
		import starling.display.Image;
		import starling.text.BitmapFont;
		import starling.text.TextField;
		import starling.textures.Texture;
		import starling.textures.TextureAtlas;
		
		import ui.UIButton;
		import ui.UIImageView;
		import ui.UIObject;
		import ui.UITextBMFont;
		import ui.UIWindow;
		
		public class GameEndWindow extends UIWindow
		{
			
			private var _btnHall:UIButton = null;
			
			private var _btnReady:UIButton = null;
			
			private var _gameResult:UIImageView = null;
			
			private var _scoreType:UIImageView = null;
			
			private var  _txtMoney:UITextBMFont = null;
			
			private var _vo:GameEndVO = null;
			
			private var _fntName:String = "" ;
			
			private var _huTypes:TextureAtlas = null;
			
			override public function initUI():void
			{
				_btnHall = getChildByName("btn_hall") as UIButton;
				_btnReady = getChildByName("btn_ready") as UIButton;
				_gameResult = getChildByName("game_result") as UIImageView;
				_scoreType = getChildByName("score_type") as UIImageView;
				_txtMoney = getChildByName("txt_money") as UITextBMFont;
				
				_btnHall.setNeighbors(null, null, _btnReady, _btnReady);
				_btnReady.setNeighbors(null, null, _btnHall, _btnHall);
				
				switchFocus(_btnReady);
			}
			
			override public function onEnter():void
			{
				_vo = _args as GameEndVO;
				_fntName = "gameend_txt_fnt" ;
				_huTypes = ResManager.getFile("hu_type_json" , Res.TYPE_TEXTUREATLAS ) as TextureAtlas ;
				update();
			}
			
			override public function onLeave():void
			{
				this.removeAllChildren();
				ResManager.release("gameend_txt_fnt");
				ResManager.release("hu_type_json");
			}
			
			private function update():void
			{
				if(0 == _vo.state)
				{
					_gameResult.setTexture_2("gameend_draw_png");
//					_scoreType.setVisible(false);
					_scoreType.visible = false;
				}
				else if(1 == _vo.state)
				{
					_gameResult.setTexture_2("gameend_win_png");
					_scoreType.setTexture_2("win_type_png");
					showTypes();
				}
				else if(2 == _vo.state)
				{
					_gameResult.setTexture_2("gameend_lose_png");
					_scoreType.setTexture_2("lose_type_png");
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
					
//					mj.setPosition(mjx, mjy);
					mj.x = mjx;
					mj.y = mjy;
					
					mjx += mj.width;
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
				bf = ResManager.getFile(_fntName , Res.TYPE_FONT ) as BitmapFont;
				TextField.registerBitmapFont( bf , _fntName );
				var txt:TextField = new TextField(100,22,'');
				txt.text = text ;
				txt.x = x ;
				txt.y = y ;
				txt.fontName = _fntName ;
				this.addChild(txt);
//				bf.setText(text);
//				bf.setPosition(x, y);
//				this.addChild(bf);
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
