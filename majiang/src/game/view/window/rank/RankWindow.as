package game.view.window.rank
{
	import game.control.WindowManager;
	import game.model.Global;
	import game.model.vo.RankItemVO;
	import game.util.CommonUtil;
	
	import network.YiuNetworkHandlerMgr;
	import network.YiuNetworkListener;
	
	import starling.display.Button;
	
	import ui.UIImageView;
	import ui.UILayer;
	import ui.UIObject;
	import ui.UIWindow;
	
	public class RankWindow extends UIWindow implements YiuNetworkListener
	{
	
		private var TAB_LENGTH:int = 3;
	
		private var _curTab:int;
	
		private var _btnTabList:Vector.<Button>;
	
		private var _mediatorList:Vector.<RankLayerMediator>;
	
		private var _btnClose:Button;
	
		private var _imgHead:UIImageView;
	
		private var _bfName:UITextBMFont;
	
		private var _bfLevel:UITextBMFont;
	
		private var _bfRank:UITextBMFont;
	
		private var _bfGold:UITextBMFont;
	
		private var _myRankList:Vector.<int> = new Vector.<int>;
	
		override public function onEnter():void
		{
			YiuNetworkHandlerMgr.subscribe(this);
	
			_bfName.setText(Global.userDataVO.name);
			_bfGold.setText(CommonUtil.formatGold(Global.userDataVO.gold));
			_bfLevel.setText(Global.userDataVO.level.toString());
			_bfRank.setText("0");
			_imgHead.setTexture(Global.getMyHeadTexture());
			try
			{
				Global.socketHall.sendProtobuf("cs_rank_list", cs_rank_list.newBuilder().setNoop(1).build().toByteArray());
			}
			catch(e:Error)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}
	
		override public function onLeave():void
		{
			YiuNetworkHandlerMgr.unSubscribe(this);
		}
	
		override public function onConfirm( target:UIObject):void
		{
			if(target == _btnClose)
			{
				WindowManager.getInstance().closeCurWindow();
			}
		}
	
		public function updateTab():void
		{
			for(var i:int= 0; i < TAB_LENGTH; i++)
			{
				var isCur:Boolean = i == _curTab;
				if(isCur)
					switchFocus(_btnTabList[i]);
				_mediatorList[i].setVisible(isCur);
			}

			if(_myRankList[_curTab] == 0)
				_bfRank.setText("--");
			else
				_bfRank.setText("" + _myRankList[_curTab]);
		}
	
		public function onMove( dir:int):void
		{
			if(_selected == _btnClose)
			{
				if(dir == DIR_DOWN)
				{
					switchFocus(_btnTabList[_curTab]);
				}
			}
			else
			{
				if(dir == DIR_DOWN)
					_mediatorList[_curTab].goNext();
				else if(dir == DIR_UP && _mediatorList[_curTab].goPre())
				{
					switchFocus(_btnClose);
				}
				else if(dir == DIR_LEFT)
				{
					_curTab--;
					if(_curTab < 0)
						_curTab += TAB_LENGTH;
					updateTab();
				}
				else if(dir == DIR_RIGHT)
				{
					_curTab++;
					if(_curTab >= TAB_LENGTH)
						_curTab -= TAB_LENGTH;
					updateTab();
				}
			}
		}
	
		public function initUI():void
		{
			_btnTabList = new Vector.<Button>;
			_mediatorList = new Vector.<RankLayerMediator>;
			var ssSmallHead:SpriteSheet = getSheet("small_head_json");
			for(var i:int = 0; i < TAB_LENGTH; i++)
			{
				_btnTabList[i] = getChildByName("btn_tab_" + (i + 1)) as Button;
				_mediatorList[i] = new RankLayerMediator(getChildByName("layer_tab_" + (i + 1)) as UILayer, ssSmallHead);
			}
			_btnClose = getChildByName("btn_close") as Button;
			_imgHead = getChildByName("img_head") as UIImageView;
			_bfName = getChildByName("bf_name") as UITextBMFont;
			_bfName.setAnchor(ANCHOR_BOTTOM_LEFT);
			_bfLevel = getChildByName("bf_level") as UITextBMFont;
			_bfLevel.setAnchor(ANCHOR_BOTTOM_LEFT);
			_bfRank = getChildByName("bf_rank") as UITextBMFont;
			_bfRank.setAnchor(ANCHOR_BOTTOM_LEFT);
			_bfGold = getChildByName("bf_gold") as UITextBMFont;
			_bfGold.setAnchor(ANCHOR_BOTTOM_LEFT);
		}
	
		/** ��Ϣ���ؼ��� */
		public function onNetworkEvent( name:String,  content:ByteString):Boolean
		{
			try
			{
				if(name == "sc_rank_list")
				{
					var msg:sc_rank_list = sc_rank_list.parseFrom(content.toByteArray());
					var datalist:Array = msg.getCoinData();
					var len:int = datalist.length;
					var goldData:Vector.<RankItemVO> = new Vector.<RankItemVO>;
					for(var i:int = 0; i < len; i++)
					{
						goldData[i] = new RankItemVO(datalist[i] as t_rank_data);
						goldData[i].value = CommonUtil.formatGold(Integer.valueOf(goldData[i].value).longValue());
					}
					_mediatorList[0].initData(goldData);
					datalist = msg.getExpData();
					len = datalist.length;
					var levelData:Vector.<RankItemVO> = new Vector.<RankItemVO>;
					for(var i:int = 0; i < len; i++)
					{
						levelData[i] = new RankItemVO(datalist[i] as t_rank_data);
					}
					_mediatorList[1].initData(levelData);
					datalist = msg.getWinData();
					len = datalist.length;
					var winData:Vector.<RankItemVO> = new Vector.<RankItemVO>;
					for(var i:int = 0; i < len; i++)
					{
						winData[i] = new RankItemVO(datalist[i] as t_rank_data);
					}
					_mediatorList[2].initData(winData);
					_myRankList[0] = 0;
					_myRankList[1] = 0;
					_myRankList[2] = 0;
	//				_myRankList[0] = msg.getMyCoin();
	//				_myRankList[1] = msg.getMyLevel();
	//				_myRankList[2] = msg.getMyWin();
					updateTab();
				}
			}
			catch( ex:Error)
			{
				ex.printStackTrace();
			}
			return false;
		}
	
		override public function onDispose():void
		{
			super.onDispose();
			_btnTabList = null;
			_mediatorList = null;
			_btnClose = null;
			_imgHead = null;
			_bfName = null;
			_bfLevel = null;
			_bfRank = null;
			_bfGold = null;
		}
	}
}
