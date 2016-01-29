package ui
{
	import flash.sampler.getSize;
	
	import starling.text.TextField;
	
	public class UIText extends UIObject
	{
		
		private var _tf:TextField;
		
		public function UIText()
		{
			_tf = new TextField(100,22, '');
			addChild(_tf);
		}
		
		/*public function getMaxLength():int
		{
			return _tf.maxLength();
		}
		
		public void setMaxLength(int length)
		{
			_tf.setMaxLength(length);
		}*/
		
		public function getText():String
		{
			return _tf.text;
		}
		
		public function setText(text:String):void
		{
			if(null != text)
				_tf.text = text;
		}
		
		public function setColor(color:uint):void
		{
			_tf.color = color;
		}
		
		public function isBold():Boolean
		{
			return _tf.bold;
		}
		
		public function setBold( v:Boolean):void
		{
			_tf.bold = v;
		}
		
		public function isItalic():Boolean
		{
			return _tf.italic;
		}
		
		public function setItalic(v:Boolean):void
		{
			_tf.italic = v;
		}
		
		public function isUnderlined():Boolean
		{
			return _tf.underline;
		}
		
		public function setUnderlined(v:Boolean):void
		{
			_tf.underline = v;
		}
		
		public function getSize():int
		{
			return _tf.fontSize;
		}
		
		public function setSize(size:int):void
		{
			_tf.fontSize = size;
		}
		
		public function setAnchor(anchor:int):void
		{
//			_tf.setAnchor(anchor);
//			_tf.an
		}
		
		public function setTrans(value:int):void
		{
			super.setTrans(value);
			
//			_tf.setTrans(value);
			_tf.rotation = value;
		}
		
		public function setLineGap( value:int):void
		{
//			_tf.setLinegap(value);
//			_tf.
		}
		
		override public function initWithJsonObject(data:Object):void
		{
			try
			{
				var color:Object = data["CColor"];
				var r:int = color["R"]!=undefined ? color["R"] : 255;
				var g:int = color["G"]!=undefined ? color["G"] : 255;
				var b:int = color["B"]!=undefined ? color["B"] : 255;
				var colorCode:int = r << 16 | g << 8 | b;
				setColor(colorCode);
				setText(data["LabelText"]);
//				setName(data["Name"]);
				this.name = data["Name"];
				autoSetPosition(data);
			}
			catch(e:*)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}
		
		override public function onDispose():void
		{
			_tf = null;
			super.onDispose();
		}
	}
}