package network
{
	
	import flash.events.IOErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	import framework.time.ITickListener;
	import framework.time.TickItem;
	
	import game.model.vo.IpAddressVO;
	
	
	
	/**
	 * @author jmulro
	 */
	public class YiuNetworkSocket implements ITickListener
	{
	
		private static var Log:Boolean = true;
	
		private static var MAX_BUFFER_LENGTH:int = 10240;
	
		private static var STAGE_RECEIVE_LENGTH:int = 1;
	
		private static var STAGE_RECEIVE_CONTENT:int = 2;
	
		private static var LENGTH_SIZE:int = 4;
	
		private var mSocketName:String;
	
		private var mSocket:StreamConnection;
	
		private var mIn:Socket;
	
		private var mOut:Socket;
	
		private var mCurrentStage:int;
	
		private var mContentNeedLength:int;
	
		private var mBuffer:Vector.<int> = new Vector.<int>;
	
		private var  mLengthBuffer:Vector.<int> = new Vector.<int>;
	
		private var mBufferCursor:int = 0;
	
		protected var _statusListener:YiuNetworkStatusListener = null;
	
		public function YiuNetworkSocket()
		{
			// Nothing
		}
	
		public function YiuNetworkSocket_a( vo:IpAddressVO):void
		{
			mSocketName = vo.toSocketAddress();
		}
	
		public function reconnect():void
		{
			connect();
		}
	
		public function connect():void
		{
			if(mSocketName == null || mSocketName.length == 0)
				return;
	
			try
			{
				if(Log)
				{
//					trace("Socket Connect: " + mSocketName);
					trace("Socket Connect: " + mSocketName);
				}
				if(mIn != null)
				{
					mIn.close();
					mIn = null;
				}
				if(mOut != null)
				{
					mOut.close();
					mOut = null;
				}
				if(mSocket != null)
				{
					mSocket.close();
					mSocket = null;
				}
	
				mSocket = Connector.open(mSocketName, Connector.READ_WRITE) as StreamConnection;
				mOut = mSocket.openOutputStream();
				mIn = mSocket.openInputStream();
	
				mCurrentStage = STAGE_RECEIVE_LENGTH;
				mContentNeedLength = 0;
	
				mBufferCursor = 0;
			}
			catch(ex:Error)
			{
				if(_statusListener != null)
				{
					_statusListener.onNetworkStatusNotify(this, "connect-failed");
				}
	
//				trace(ex.getMessage());
				trace(ex.message);
			}
	
			if(_statusListener != null)
			{
				_statusListener.onNetworkStatusNotify(this, "connected");
			}
	
		}
	
		public function connect_a( vo:IpAddressVO ):void
		{
			mSocketName = vo.toSocketAddress();
			connect();
		}
	
		public function setStatusListener( listener:YiuNetworkStatusListener ):void
		{
			_statusListener = listener;
		}
	
		public function close():void
		{
			try
			{
				if(Log)
				{
//					trace("Socket Closed: " + mSocketName);
					trace("Socket Closed: " + mSocketName);
				}
				if(mIn != null)
				{
					mIn.close();
					mIn = null;
				}
				if(mOut != null)
				{
					mOut.close();
					mOut = null;
				}
				if(mSocket != null)
				{
					mSocket.close();
					mSocket = null;
				}
				mSocketName = null;
			}
			catch( err:Error)
			{
				if(_statusListener != null)
				{
					_statusListener.onNetworkStatusNotify(this, "close-failed");
				}
			}
		}
	
		public function isConnected():Boolean
		{
			return(mSocket != null);
		}
	
		public function sendProtobuf(strName:String, content:ByteArray):void
		{
			try{
				trace("sent:" + strName);
				var node:ProtocolNode = ProtocolList.getNodeStr(strName);
				if(node == null)
				{
					trace("No-Protocol: " + strName);
					return;
				}	
//				var proto:protocol = protocol.newBuilder().setId(node.mId).setContent( content ).build();
//				send(proto.toByteArray());
				
				send(content);
			}
			catch( e:Error)
			{
				e.printStackTrace();
			}
		}
	
		public function sendProtobufById(iProtoId:int, content:ByteArray/*byte[]*/):void
		{
			try
			{
//				var proto:protocol = protocol.newBuilder().setId(iProtoId).setContent( content ).build();
				
				send(proto.toByteArray());
			}
			catch( ex:Error)
			{
	
			}
		}

	
		public function send( data:ByteArray/*byte[]*/):void
		{
			if(mSocket == null || mOut == null)
			{
				connect();
				return;
			}
	
			try
			{
				var length:int = data.length;
				mLengthBuffer[3] = (length & 0xff);
				mLengthBuffer[2] = ((length >> 8) & 0xff);
				mLengthBuffer[1] = ((length >> 16) & 0xff);
				mLengthBuffer[0] = ((length >> 24) & 0xff);
	
				mOut.write(mLengthBuffer, 0, 4);
				mOut.write(data);
				mOut.flush();
				if(Log)
				{
//					trace("Packet Sent");
					trace("Packet Sent");
				}
			}
			catch(io:IOErrorEvent)
			{
				if(_statusListener != null)
				{
					_statusListener.onNetworkStatusNotify(this, "send-failed");
				}
	
//				trace("SOCKET IO WRITE FAILED");
				trace("SOCKET IO WRITE FAILED");
			}
			catch(ex:Error)
			{
//				trace(ex.getMessage());
				trace(ex.getMessage());
			}
		}

	
		public function send_a( packet:String):void
		{
			if(mSocket == null || mOut == null)
			{
				connect();
				return;
			}
	
			try
			{
				var length:int = packet.length;
				mLengthBuffer[3] = (length & 0xff);	// (byte)(length & 0xff);
				mLengthBuffer[2] = ((length >> 8) & 0xff);
				mLengthBuffer[1] = ((length >> 16) & 0xff);
				mLengthBuffer[0] = ((length >> 24) & 0xff);
	
				mOut.write(mLengthBuffer, 0, 4);
				mOut.write(packet.getBytes());
				mOut.flush();
				if(Log)
//					trace("Packet Sent");
					trace("Packet Sent");
			}
			catch( io:Error)
			{
				if(_statusListener != null)
				{
					_statusListener.onNetworkStatusNotify(this, "send-failed");
				}
	
//				trace("SOCKET IO WRITE FAILED");
				trace("SOCKET IO WRITE FAILED");
			}
			catch( ex:Error)
			{
//				trace(ex.getMessage());
				trace(ex.getMessage());
			}
		}

	
		public function onTick(tickItem:TickItem):void
		{
			receive();
		}

	
		public function receive():void
		{
			if(mSocket == null || mIn == null)
			{
				connect();
				return;
			}
	
			try
			{
				if(mCurrentStage == STAGE_RECEIVE_LENGTH)
				{
					if(mBufferCursor >= LENGTH_SIZE)
					{
						mContentNeedLength = ((mBuffer[0] & 0xff) << 24) + ((mBuffer[1] & 0xff) << 16) + ((mBuffer[2] & 0xff) << 8) + (mBuffer[3] & 0xff);
						// trace( "Need Length: " +
						// String.valueOf(mContentNeedLength) );
	
						if(mContentNeedLength > MAX_BUFFER_LENGTH)
							mContentNeedLength = MAX_BUFFER_LENGTH;
						if(mContentNeedLength < 0)
							mContentNeedLength = 0;
	
						mCurrentStage = STAGE_RECEIVE_CONTENT;
						mBufferCursor = 0;
					}
					else
					{
						if(mIn.available() >= (LENGTH_SIZE - mBufferCursor))
						{
							var count:int = mIn.read(mBuffer, mBufferCursor, LENGTH_SIZE - mBufferCursor);
	
							if(count != -1)
							{
								mBufferCursor += count;
							}
							else
							{
//								trace("fuck failed receive length");
								trace("fuck failed receive length");
							}
						}
					}
				}
	
				if(mCurrentStage == STAGE_RECEIVE_CONTENT)
				{
					if(mBufferCursor >= mContentNeedLength)
					{
						YiuNetworkProtobuf.processBytes(mBuffer, mBufferCursor);
	
						mCurrentStage = STAGE_RECEIVE_LENGTH;
						mBufferCursor = 0;
						mContentNeedLength = 0x7fffffff;
					}
					else
					{
						if(mIn.available() >= (mContentNeedLength - mBufferCursor))
						{
							var count:int = mIn.read(mBuffer, mBufferCursor, mContentNeedLength - mBufferCursor);
	
							if(count != -1)
							{
								mBufferCursor += count;
							}
							else
							{
//								trace("fuck failed receive content");
								trace("fuck failed receive content");
							}
						}
					}
				}
			}
			catch( ex:IOException)
			{
				if(_statusListener != null)
				{
					_statusListener.onNetworkStatusNotify(this, "receive-failed");
				}
			}
			catch(ex:Error)
			{
//				trace(ex.getMessage());
				trace(ex.message);
			}
		}
	}
}