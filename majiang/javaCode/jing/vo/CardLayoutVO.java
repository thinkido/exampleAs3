
package jing.vo;

import framework.geom.Point;

/**
 * ���Ʋ��ֵ�VO
 * 
 * @author Jing
 */
public class CardLayoutVO
{

	/**
	 * ʹ�õ�����ͼƬǰ׺
	 */
	public String cardPrefix = null;

	/**
	 * ���X
	 */
	public int startX = 0;

	/**
	 * ���Y
	 */
	public int startY = 0;

	/**
	 * ����
	 */
	public String dir = null;

	/**
	 * ������֮��ļ��
	 */
	public int gap = 0;

	/**
	 * �����齫֮��ļ��
	 */
	public int combinGap = 0;
	
	/**
	 * ����еĸܣ������Ǹ���Y��ƫ��
	 */
	public int combinGangOffY = 0;

	/**
	 * ���е�������ֵ
	 */
	public int warpCount = 999;

	/**
	 * ���к��ƫ��������
	 */
	public Point warp = null;
}
