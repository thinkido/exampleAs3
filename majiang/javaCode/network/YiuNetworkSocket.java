
package network;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.microedition.io.Connector;
import javax.microedition.io.StreamConnection;

import net.jarlehansen.protobuf.javame.ByteString;
import protocol.protocol;
import framework.time.ITickListener;
import framework.time.TickItem;
import game.model.vo.IpAddressVO;

/**
 * @author jmulro
 */
public class YiuNetworkSocket implements ITickListener
{

	private static boolean Log = true;

	private static final int MAX_BUFFER_LENGTH = 10240;

	private static final int STAGE_RECEIVE_LENGTH = 1;

	private static final int STAGE_RECEIVE_CONTENT = 2;

	private static final int LENGTH_SIZE = 4;

	private String mSocketName;

	private StreamConnection mSocket;

	private InputStream mIn;

	private OutputStream mOut;

	private int mCurrentStage;

	private int mContentNeedLength;

	private byte[] mBuffer = new byte[MAX_BUFFER_LENGTH];

	private byte[] mLengthBuffer = new byte[4];

	private int mBufferCursor = 0;

	protected YiuNetworkStatusListener _statusListener = null;

	public YiuNetworkSocket()
	{
		// Nothing
	}

	public YiuNetworkSocket(IpAddressVO vo)
	{
		mSocketName = vo.toSocketAddress();
	}

	public void reconnect()
	{
		connect();
	}

	public void connect()
	{
		if(mSocketName == null || mSocketName.length() == 0)
			return;

		try
		{
			if(Log)
				System.out.println("Socket Connect: " + mSocketName);
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
		catch(Exception ex)
		{
			if(_statusListener != null)
			{
				_statusListener.onNetworkStatusNotify(this, "connect-failed");
			}

			System.out.println(ex.getMessage());
		}

		if(_statusListener != null)
		{
			_statusListener.onNetworkStatusNotify(this, "connected");
		}

	}

	public void connect(IpAddressVO vo)
	{
		mSocketName = vo.toSocketAddress();
		connect();
	}

	public void setStatusListener(YiuNetworkStatusListener listener)
	{
		_statusListener = listener;
	}

	public void close()
	{
		try
		{
			if(Log)
				System.out.println("Socket Closed: " + mSocketName);
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
		catch(Exception ex)
		{
			if(_statusListener != null)
			{
				_statusListener.onNetworkStatusNotify(this, "close-failed");
			}
		}
	}

	public boolean isConnected()
	{
		return(mSocket != null);
	}

	public void sendProtobuf(String strName, byte[] content)
	{
		try
		{
			System.out.println("sent:" + strName);
			ProtocolList.ProtocolNode node = ProtocolList.getNode(strName);
			if(node == null)
			{
				System.out.print("No-Protocol: " + strName);
				return;
			}

			protocol proto = protocol.newBuilder().setId(node.mId).setContent(ByteString.copyFrom(content)).build();
			send(proto.toByteArray());
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

	public void sendProtobuf(int iProtoId, byte[] content)
	{
		try
		{
			protocol proto = protocol.newBuilder().setId(iProtoId).setContent(ByteString.copyFrom(content)).build();
			send(proto.toByteArray());
		}
		catch(Exception ex)
		{

		}
	}

	public void send(byte[] data)
	{
		if(mSocket == null || mOut == null)
		{
			connect();
			return;
		}

		try
		{
			int length = data.length;
			mLengthBuffer[3] = (byte)(length & 0xff);
			mLengthBuffer[2] = (byte)((length >> 8) & 0xff);
			mLengthBuffer[1] = (byte)((length >> 16) & 0xff);
			mLengthBuffer[0] = (byte)((length >> 24) & 0xff);

			mOut.write(mLengthBuffer, 0, 4);
			mOut.write(data);
			mOut.flush();
			if(Log)
				System.out.println("Packet Sent");
		}
		catch(IOException io)
		{
			if(_statusListener != null)
			{
				_statusListener.onNetworkStatusNotify(this, "send-failed");
			}

			System.out.println("SOCKET IO WRITE FAILED");
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}

	public void send(String packet)
	{
		if(mSocket == null || mOut == null)
		{
			connect();
			return;
		}

		try
		{
			int length = packet.length();
			mLengthBuffer[3] = (byte)(length & 0xff);
			mLengthBuffer[2] = (byte)((length >> 8) & 0xff);
			mLengthBuffer[1] = (byte)((length >> 16) & 0xff);
			mLengthBuffer[0] = (byte)((length >> 24) & 0xff);

			mOut.write(mLengthBuffer, 0, 4);
			mOut.write(packet.getBytes());
			mOut.flush();
			if(Log)
				System.out.println("Packet Sent");
		}
		catch(IOException io)
		{
			if(_statusListener != null)
			{
				_statusListener.onNetworkStatusNotify(this, "send-failed");
			}

			System.out.println("SOCKET IO WRITE FAILED");
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}

	public void onTick(TickItem tickItem)
	{
		receive();
	}

	public void receive()
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
						int count = mIn.read(mBuffer, mBufferCursor, LENGTH_SIZE - mBufferCursor);

						if(count != -1)
						{
							mBufferCursor += count;
						}
						else
						{
							System.out.println("fuck failed receive length");
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
						int count = mIn.read(mBuffer, mBufferCursor, mContentNeedLength - mBufferCursor);

						if(count != -1)
						{
							mBufferCursor += count;
						}
						else
						{
							System.out.println("fuck failed receive content");
						}
					}
				}
			}
		}
		catch(IOException ex)
		{
			if(_statusListener != null)
			{
				_statusListener.onNetworkStatusNotify(this, "receive-failed");
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
}
