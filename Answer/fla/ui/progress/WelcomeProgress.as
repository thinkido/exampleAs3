package ui.progress
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.greensock.TweenLite;
	
	public class WelcomeProgress extends Sprite
	{

		public static const CARTOON_END:String = "Welcome_cartoon_end" ;
				
		public function WelcomeProgress()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		private function addedToStageHandler(event : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			this.stage.addEventListener(Event.RESIZE,welcomeResize);
			welcomeResize();
		}

		
		public function start( duration:int = 2, out:int = 1 ):void{
			this.stage.removeEventListener(Event.RESIZE,welcomeResize);
			bar.width = 0 ;
			TweenLite.to(bar,duration,{width:stage.stageWidth,onComplete:hidebar});
			TweenLite.to(up,out,{y:up.y-bar.y,delay:duration});
			TweenLite.to(down,out,{y:stage.stageHeight,delay:duration,onComplete:dispatchEnd});
			//TweenLite.to(bar,out,{alpha:0,delay:duration,overwrite:3});
			TweenLite.to(thinkidoLab,out,{alpha:0,delay:duration});
			function hidebar():void
			{
				bar.visible = false ;
			}
			
		}
		
		private	function dispatchEnd():void
		{
			this.dispatchEvent( new Event(CARTOON_END));
		}

		private function welcomeResize(evt:Event = null):void
		{
			//up.width  == 2112
			down.x = up.x = (this.stage.stageWidth - 2112)/2 ;
			thinkidoLab.x = (this.stage.stageWidth - thinkidoLab.width)/2 ;
			thinkidoLab.y = (this.stage.stageHeight - thinkidoLab.height)/2 ;
			bar.y = (this.stage.stageHeight - bar.height )/2 << 0;
			bar.x = 0 ;
			down.y = bar.y + 20 ;
			up.y = bar.y - up.height ;
			
			up.graphics.clear() ;
			up.graphics.beginFill(0);
			up.graphics.drawRect(0,-stage.stageHeight/2,stage.stageWidth,stage.stageHeight/2);
			up.graphics.endFill();
			down.graphics.clear() ;
			down.graphics.beginFill(0);
			down.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight/2);
			down.graphics.endFill();
		}
	}
}