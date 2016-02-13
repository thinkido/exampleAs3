package game.view.window.rank
{
	import game.model.vo.RankItemVO;
	
	import starling.display.DisplayObject;
	import starling.textures.TextureAtlas;
	
	import ui.UIImageView;
	import ui.UILayer;
	import ui.UITextBMFont;
	
	public class RankLayerMediator
	{
	
		private var ITEM_LENGTH:int = 4;
	
		private var _layer:UILayer;
	
		private var _curPage:int;
	
		private var _totalPage:int;
	
		private var _totalLength:int;
	
		private var _lastPageOffset:int;
	
//		private UITextBMFont[][] _bfValueList;
		private var _bfValueList:Vector.<Vector>;
	
		private var _imgHead:Vector.<UIImageView>;
	
		private var _dataList:Vector.<RankItemVO>;
	
		private var _imgTopThree:Vector.<UIImageView>;
	
		private var _ssSmallHead:TextureAtlas ;
	
		public function RankLayerMediator( layer:UILayer,  ssSmallHead:TextureAtlas)
		{
			_layer = layer;
			_ssSmallHead = ssSmallHead;
			_bfValueList = new UITextBMFont[3][ITEM_LENGTH];
			_imgHead = new UIImageView[ITEM_LENGTH];
			_imgTopThree = new UIImageView[3];
			for(var i:int = 0; i < 3; i++)
			{
				_imgTopThree[i] = _layer.getChildByName("img_top_" + (i + 1)) as UIImageView;
				for(var j:int = 0; j < ITEM_LENGTH; j++)
				{
					_bfValueList[i][j] = _layer.getChildByName("bf_value_" + (i + 1) + "_" + (j + 1)) as UITextBMFont;
					_bfValueList[i][j].setAnchor(DisplayObject.ANCHOR_BOTTOM_LEFT);
				}
			}
			for(var i:int = 0; i < ITEM_LENGTH; i++)
			{
				_imgHead[i] = _layer.getChildByName("img_head_" + (i + 1)) as UIImageView;
			}
		}
	
		public function initData( dataList:Vector.<RankItemVO>):void
		{
			_dataList = dataList;
			_curPage = 0;
			_totalLength = dataList.length;
			_totalPage = Math.ceil(1.0 * _totalLength / ITEM_LENGTH);
			_lastPageOffset = _totalLength % ITEM_LENGTH;
			updateView();
		}
	
		public function goPre():Boolean
		{
			if(_curPage > 0)
			{
				_curPage--;
				updateView();
				return false;
			}
			else
				return true;
		}
	
		public function goNext():void
		{
			if(_curPage < _totalPage - 1)
			{
				_curPage++;
				updateView();
			}
		}
	
		public function setVisible( b:Boolean):void
		{
			_layer.setVisible(b);
		}
	
		private function updateView():void
		{
			var offset:int = _curPage * ITEM_LENGTH;
			if(_curPage == _totalPage - 1)
				offset -= _lastPageOffset;
			for(var i:int = 0; i < ITEM_LENGTH; i++)
			{
				var data:RankItemVO = _dataList[offset + i];
				_bfValueList[0][i].setText("" + data.rank);
				_bfValueList[1][i].setText(data.name);
				_bfValueList[2][i].setText(data.value);
				_imgHead[i].setTexture(_ssSmallHead.getTexture("head_" + data.portrait));
			}
			var isFirstPage:Boolean = _curPage == 0;
			for(var i:int = 0; i < 3; i++)
			{
				_imgTopThree[i].setVisible(isFirstPage);
				_bfValueList[0][i].setVisible(!isFirstPage);
			}
		}
	}
}
