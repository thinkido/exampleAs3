package jing.pai.model
{
	
	
	/**
	 * 牌队列
	 * 
	 * @author Jing
	 */
	public class CardVector
	{
		
		private var _vec:Array = null;
		
		public function CardVector_A(cards:Array = null ):void
		{
			_vec = [];
			cards = cards || [] ;
			for(var i:int= 0; i < cards.length; i++)
			{
				add(cards[i]);
			}
		}
		
		/**
		 * 在尾部加入一张牌
		 * 
		 * @param card
		 */
		public function add(card:int):void{
			//		_vec.addElement(toInteger(card));
			_vec.push(card);
		}
		
		/**
		 * 在尾部加入一堆牌
		 * 
		 * @param cards
		 */
		public function add_2(cards:Array):void{
			for(var i:int= 0; i < cards.length; i++)
			{
				//			_vec.addElement(toInteger(cards[i]));
				_vec.push(cards[i]);
			}
		}
		
		/**
		 * 在指定位置加入一张牌
		 * 
		 * @param card
		 * @param index
		 */
		public function addAt(card:int, index:int):void{
			_vec.splice( card , 0 , index );
//			_vec.insertElementAt(toInteger(card), index);
		}
		
		/**
		 * 移除一张指定位置的牌
		 * 
		 * @param index
		 */
		public function removeAt(index:int):void{
			_vec.splice( index ,1 );
//			_vec.removeElementAt(index);
		}
		
		/**
		 * 得到指定位置的牌
		 * 
		 * @param index
		 * @return
		 */
		public function getAt(index:int):int{
			//		return toInt(Integer(_vec.elementAt(index)));
			return _vec[index];
		}
		
		/**
		 * 移除一张卡牌
		 * 
		 * @param card
		 */
		public function removeCard(card:int):int{
			var count:int= this.count();
			for(var i:int= 0; i < count; i++)
			{
				if(card == getAt(i))
				{
					removeAt(i);
					return i;
				}
			}
			return -1;
		}
		
		/**
		 * 移除卡牌组
		 * 
		 * @param cards
		 */
		public function removeCards(cards:Array):void{
			for(var i:int= 0; i < cards.length; i++)
			{
				removeCard(cards[i]);
			}
		}
		
		/**
		 * 得到所有卡牌的数组
		 * 
		 * @return
		 */
		public function getCards():Array
		{
			var cards:Array= [];
			for(var i:int= 0; i < cards.length; i++)
			{
				cards[i] = getAt(i);
			}
			return cards;
		}
		
		/**
		 * 是否有指定的牌
		 * 
		 * @param card
		 * @return
		 */
		public function hasCard(card:int):Boolean{
			return _vec.contains(toInteger(card));
		}
		
		/**
		 *指定卡牌的持有数
		 * 
		 * @param card
		 * @return
		 */
		public function hasCardCount(card:int):int{
			var count:int= 0;
			for(var i:int= 0; i < count(); i++)
			{
				if(card == getAt(i))
				{
					count++;
				}
			}
			return count;
		}
		
		/**
		 * 从指定索引（包含）开始寻找卡牌
		 * 
		 * @param card
		 * @param startIndex
		 * @return
		 */
		public function findCard(card:int, startIndex:int):int{
			var count:int= this.count();
			for(var i:int= startIndex; i < count; i++)
			{
				if(card == getAt(i))
				{
					return i;
				}
			}
			return -1;
		}
		
		/**
		 * 卡牌的数量
		 * 
		 * @return
		 */
		public function count():int{
			return _vec.length ;
		}
		
		/**
		 * 对牌进行一次排序,从左至右依次是1到9万，1到9筒，1到9条
		 */
		public function sort():void{
			var size:int= count();
			var newVec:CardVector= new CardVector();
			for(var i:int= 0; i < size; i++)
			{
				var card:int= getAt(i);
				var j:int= 0;
				for(j = 0; j < newVec.count(); j++)
				{
					var tempCard:int= newVec.getAt(j);
					if(card < tempCard)
					{
						break;
					}
				}
				newVec.addAt(card, j);
			}
			
			_vec = newVec._vec;
		}
		
		/**
		 * 复制
		 * 
		 * @return
		 */
		public function clone():CardVector{
			//		return new CardVector_A(this.getCards());
			var vec:CardVector = new CardVector;
			vec.CardVector_A(this.getCards());
			return vec;
		}
		
		private function toInteger(card:int):int{
			return card;
		}
		
		private function toInt(obj:int):int{
			return obj;
		}
		
		public function toString():String{
			var str:String= "";
			for(var i:int= 0; i < count(); i++)
			{
				str += _vec[i].toString() + ",";
			}
			return str;
		}
	}
}