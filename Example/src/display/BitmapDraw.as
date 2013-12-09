package display
{
	import com.thinkido.example.Application;
	import com.thinkido.framework.common.utils.ZMath;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	
	public class BitmapDraw extends Application
	{
		[Embed(source="../asset/display/fireball.png")]
		private var FireFl:Class ;
		
		public function BitmapDraw()
		{
			
		}

		protected override function initApp():void
		{
			var p1:Point = null;
			var p2:Point = null;
			var p3:Point = null;
			var p4:Point = null;
			var bdWidth:int = NaN;
			var bdHeight:int = NaN;
			var matrix:Matrix = null;
			var apd:Object = {tx:24,ty:109,sx:59,sy:0,width:56,height:123};
			var _currentRotation:int = 60 ;
			var _drawSourceBitmapData:BitmapData;
			var _rotationDrawSourceBitmapData:BitmapData;
			var avatarImg:BitmapData = Bitmap(new FireFl()).bitmapData;
			var bm:Bitmap = new Bitmap();
			
			var _oldData:Object = {};
			p1 = ZMath.getRotPoint(new Point(0, 0), new Point(apd.tx, apd.ty), _currentRotation);
			p2 = ZMath.getRotPoint(new Point(apd.width, 0), new Point(apd.tx, apd.ty), _currentRotation);
			p3 = ZMath.getRotPoint(new Point(apd.width, apd.height), new Point(apd.tx, apd.ty), _currentRotation);
			p4 = ZMath.getRotPoint(new Point(0, apd.height), new Point(apd.tx, apd.ty), _currentRotation);
			bdWidth = Math.max(Math.abs(p3.x - p1.x), Math.abs(p4.x - p2.x));
			bdHeight = Math.max(Math.abs(p3.y - p1.y), Math.abs(p4.y - p2.y));
			_oldData.oldOffsetX = Math.min(p1.x, p2.x, p3.x, p4.x);
			_oldData.oldOffsetY = Math.min(p1.y, p2.y, p3.y, p4.y);
			matrix = new Matrix();
			
			//matrix.translate(-apd.sx - apd.tx, -apd.sy - apd.ty);
			matrix.rotate(_currentRotation * Math.PI / 180);
			//matrix.translate(apd.sx + apd.tx, apd.sy + apd.ty);
			
			var tempPoint:Point = ZMath.getRotPoint(new Point(apd.width / 2, apd.height / 2), new Point(0,0), _currentRotation);
			matrix.translate(apd.width / 2 - tempPoint.x, apd.height / 2 - tempPoint.y);
			//matrix.translate(apd.width / 2-_oldData.oldOffsetX, apd.width / 2-_oldData.oldOffsetY);
			
			var tempShape:Shape = new Shape();
			tempShape.graphics.beginFill(0,0.3);
			tempShape.graphics.drawRect(0,0,bdWidth,bdHeight);
			tempShape.graphics.endFill();
			tempShape.graphics.beginFill(0xff0000,0.3);
			tempShape.graphics.drawRect(0,0,avatarImg.width, avatarImg.height);
			tempShape.graphics.endFill();
			_drawSourceBitmapData = new BitmapData(apd.width, apd.height, true, 0);
			_rotationDrawSourceBitmapData = new BitmapData(apd.width, apd.height, true, 0);
			_drawSourceBitmapData.draw(tempShape);
			_rotationDrawSourceBitmapData.copyPixels(avatarImg, new Rectangle(apd.sx, apd.sy, apd.width, apd.height), new Point(0,0), null, null, true);
			//_drawSourceBitmapData.draw(_rotationDrawSourceBitmapData, matrix  );
			_drawSourceBitmapData.draw(_rotationDrawSourceBitmapData, matrix  );
			bm.bitmapData = _drawSourceBitmapData ;
			addChild(bm);
			bm.x = 100 ;
			bm.y = 100 ;
		}


	}
}