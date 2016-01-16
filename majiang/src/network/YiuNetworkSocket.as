package network
{
	
	import flash.events.IOErrorEvent;
	import flash.system.System;
	
	import framework.time.ITickListener;
	import framework.time.TickItem;
	
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
	
		private var mIn:InputStream;
	
		private var mOut:OutputStream;
	
		private var mCurrentStage:int;
	
		private var mContentNeedLength:int;
	
		private var mBuffer:byte[] = new byte[MAX_BUFFER_LENGTH];
	
		private var  mLengthBuffer:byte[] = new byte[4];
	
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
			if(mSocketName == null || mSocketName.length() == 0)
				return;
	
			try
			{
				if(Log)
				{
//					System.out.println("Socket Connect: " + mSocketName);
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
	
				mSocket = (StreamConnection)Connector.open(mSocketName, Connector.READ_WRITE);
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
	
//				System.out.println(ex.getMessage());
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
//					System.out.println("Socket Closed: " + mSocketName);
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
	
		public function sendProtobuf(strName:String, content:Object/*byte[]*/ ):void
		{
			try
			{
//				System.out.println("sent:" + strName);
				trace("sent:" + strName);
				var node:ProtocolNode = ProtocolList.getNodeStr(strName);
				if(node == null)
				{
//					System.out.print("No-Protocol: " + strName);
					trace("No-Protocol: " + strName);
					return;
				}
	
				var proto:protocol = protocol.newBuilder().setId(node.mId).setContent(ByteString.copyFrom(content)).build();
				send(proto.toByteArray());
			}
			catch( ex:Error)
			{
				ex.printStackTrace();
			}
		}
	
		public function sendProtobuf_a(iProtoId:int, content:*/*byte[]*/):void
		{
			try
			{
				var proto:protocol = protocol.newBuilder().setId(iProtoId).setContent(ByteString.copyFrom(content)).build();
				send(proto.toByteArray());
			}
			catch( ex:Error)
			{
	
			}
		}

	
		public function send( data:*/*byte[]*/):void
		{
			if(mSocket == null || mOut == null)
			{
				connect();
				return;
			}
	
			try
			{
				var length:int = data.length;
				mLengthBuffer[3] = (byte)(length & 0xff);
				mLengthBuffer[2] = (byte)((length >> 8) & 0xff);
				mLengthBuffer[1] = (byte)((length >> 16) & 0xff);
				mLengthBuffer[0] = (byte)((length >> 24) & 0xff);
	
				mOut.write(mLengthBuffer, 0, 4);
				mOut.write(data);
				mOut.flush();
				if(Log)
				{
//					System.out.println("Packet Sent");
					trace("Packet Sent");
				}
			}
			catch(io:IOErrorEvent)
			{
				if(_statusListener != null)
				{
					_statusListener.onNetworkStatusNotify(this, "send-failed");
				}
	
//				System.out.println("SOCKET IO WRITE FAILED");
				trace("SOCKET IO WRITE FAILED");
			}
			catch(ex:Error)
			{
//				System.out.println(ex.getMessage());
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
				var length:int = packet.length();
				mLengthBuffer[3] = (byte)(length & 0xff);
				mLengthBuffer[2] = (byte)((length >> 8) & 0xff);
				mLengthBuffer[1] = (byte)((length >> 16) & 0xff);
				mLengthBuffer[0] = (byte)((length >> 24) & 0xff);
	
				mOut.write(mLengthBuffer, 0, 4);
				mOut.write(packet.getBytes());
				mOut.flush();
				if(Log)
//					System.out.println("Packet Sent");
					trace("Packet Sent");
			}
			catch( io:Error)
			{
				if(_statusListener != null)
				{
					_statusListener.onNetworkStatusNotify(this, "send-failed");
				}
	
//				System.out.println("SOCKET IO WRITE FAILED");
				trace("SOCKET IO WRITE FAILED");
			}
			catch( ex:Error)
			{
//				System.out.println(ex.getMessage());
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
						// System.out.println( "Need Length: " +
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
//								System.out.println("fuck failed receive length");
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
//								System.out.println("fuck failed receive content");
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
//				System.out.println(ex.getMessage());
				trace(ex.message);
			}
		}
	}
}