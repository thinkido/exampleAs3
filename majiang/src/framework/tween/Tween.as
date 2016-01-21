package framework.tween
{
import framework.consts.EventType;
import framework.events.EventDispatcher;
import framework.events.IEventListener;
import framework.views.DisplayObject;
import framework.views.Stage;

/**
 * »º¶¯
 * @author Jing
 *
 */
public class Tween extends EventDispatcher implements IEventListener
{
	private var _binded:DisplayObject= null;
	public function binded():DisplayObject{
		return _binded;
	}
	private var _startX:int= 0;
	private var _startY:int= 0;
	private var _endX:int= 0;
	private var _endY:int= 0;
	private var _startTime:Number= 0;
	private var _endTime:Number= 0;
	private var _duration:Number= 0;
	private var _distanceX:int= 0;
	private var _distanceY:int= 0;
	
	/**
	 * »º¶¯¶¯»­Àà
	 * @param binded
	 */
	protected function Tween(binded:DisplayObject, delay:Number, duration:Number, targetX:int, targetY:int)
	{
		_binded = binded;
		_startX = _binded.getX();
		_startY = _binded.getY();
		_endX = targetX;
		_endY = targetY;
		_distanceX = _endX - _startX;
		_distanceY = _endY - _startY;
		_startTime = Stage.current.now() + delay;
		_duration = duration;
		_endTime = _startTime + duration;
		
		Stage.current.notice.addEventListener(EventType.EVENT_STAGE_ENTER_FRAME, this);
	}
	
	/**
	 * »º¶¯µ½Ŀ±êλÖÃ
	 * @param obj
	 * @param targetX
	 * @param targetY
	 */
	static public function toPosition(obj:DisplayObject, delay:Number, duration:Number, targetX:int, targetY:int):Tween{
		return new Tween(obj, delay, duration, targetX, targetY);
	}
	
//	public Tween toPosition(long delay, long duration, int targetX, int targetY)
//	{
//		delay = delay + (_endTime - Stage.current.now());
//		return new Tween(_binded, delay, duration, targetY, targetY);
//	}
	
	public function destroy():void{
		destroy(false);
	}
	
	public function destroy(complete:Boolean):void{
		if(true == complete)
		{
			_binded.setPosition(_endX, _endY);
		}
		Stage.current.notice.removeEventListener(EventType.EVENT_STAGE_ENTER_FRAME, this);
	}

	public function onReciveEvent(type:uint, dispatcher:EventDispatcher, data:Object):void{		
		var now:Number= Stage.current.now();
		if(now <= _startTime)
		{
			return;
		}		

		if(now >= _endTime)
		{
			//Òƶ¯½áÊø			
			destroy(true);	
			this.dispatchEvent(EventType.EVENT_TWEEN_COMPLETE);
			return;
		}
		
		var k:Number= double((now - _startTime) )/ _duration;
		var tempX:int= int((k * _distanceX));
		var tempY:int= int((k * _distanceY));
		_binded.setPosition(_startX + tempX, _startY + tempY);
	}
}
}