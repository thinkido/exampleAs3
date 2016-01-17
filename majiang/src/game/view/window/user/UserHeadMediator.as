package game.view.window.user
{
	import ui.UIImageView;
	import ui.UILayer;
	
	public class UserHeadMediator 
	{
		private var _layer:UILayer;
		
		private var _imgMaleHead:UIImageView;
		
		private var _imgFemaleHead:UIImageView;
		
		public function UserHeadMediator( layer:UILayer):void
		{
			_layer = layer;
			_imgMaleHead =  _layer.getChildByName("img_male_head") as UIImageView;
			_imgFemaleHead = _layer.getChildByName("img_female_head") as UIImageView;
		}
		
		public function setSex(sex:int):void {
			if (sex == 0) {
//				_imgMaleHead.setVisible(false);
//				_imgFemaleHead.setVisible(true);
				_imgMaleHead.visible = false;
				_imgFemaleHead.visible = true;
			} else {
//				_imgMaleHead.setVisible(true);
//				_imgFemaleHead.setVisible(false);
				_imgMaleHead.visible = true;
				_imgFemaleHead.visible = false;
			}
		}
		
		public function setVisible(b:Boolean):void {
			_layer.visible = b;
		}
		
		public function getVisible():Boolean {
			return _layer.visible;
		}
	}
}
