package     
{   
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import framework.views.Stage;
	
	import starling.core.Starling;
	
	[SWF(width="1280", height="752", frameRate="60", backgroundColor="#002143")]   
	public class StartupMain extends Sprite   
	{   
		private var mStarling:Starling;   
		
		public function StartupMain()   
		{   
			// stats class for fps               addChild ( new Stats() );   
			
			stage.align = StageAlign.TOP_LEFT;   
			stage.scaleMode = StageScaleMode.NO_SCALE;   
			
			// create our Starling instance   
			mStarling = new Starling(Stage, stage);   
			
			// set anti-aliasing (higher the better quality but slower performance)   
			mStarling.antiAliasing = 1;   
			
			// start it!   
			mStarling.start();   
		}   
	}   
} 