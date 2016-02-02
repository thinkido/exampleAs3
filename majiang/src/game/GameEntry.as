package game
{
	import framework.resources.Res;
	
	import game.model.Global;
	
	import jing.GDC;
	import jing.configs.CardLayout;
	import jing.configs.Config;
	
	import starling.display.Sprite;
	
	public class GameEntry extends Sprite
	{
		
		public function GameEntry()
		{
			
		}
		
		protected function initInfo():void
		{
			if(Global.account == null)
			{
				Global.account = "zhidaGame";
				Global.adAccount = Global.account;
			}
			Global.resUrl = "http://182.140.237.55/res_i";
			Res.localRes.init("/res.json");
			Res.actively = Res.localRes;
			// Res.httpRes.init("/res.json", Global.resUrl);
			// Res.actively = Res.httpRes;
			
			Global.cfg = new Config("config_json");
			Global.cl = new CardLayout();
		}
		
		protected function addedToStage():void
		{
			Global.setRoot(this);
			initInfo();
			Global.init();
		}
	}
}
