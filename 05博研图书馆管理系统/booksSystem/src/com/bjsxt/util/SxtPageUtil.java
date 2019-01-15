package com.bjsxt.util;

import java.io.Serializable;
import java.util.List;

/**
 * 封装分页对象
 * @author Administrator
 *
 */
public class SxtPageUtil<E> implements Serializable {

	private static final long serialVersionUID = 1L;

	//当前页码数
	private int num;
	//每页显示的数量
	private int size;
	//总记录数
	private int total;
	//总页码数
	private int count;
	//本次查询从多少开始
	private int start;
	//每页页码开始数
	private int everyBegin;
	//每页页码结束数
	private int everyEnd;
	//每页显示的总页码数
	private int everyCount;
	//是否有上一页
	private boolean hasPrevious;
	//首页
	private int first;
	//上一页
	private int previous;
	//是否有下一页
	private boolean hasNext;
	//下一页
	private int next;
	//尾页
	private int last;
	//本次查询的结果
	private List<E> list;

	/**
	 * 创建分页对象
	 * @param numString
	 * @param sizeString
	 * @param total
	 */
	public SxtPageUtil(String numString, String sizeString, int total) {
		//当前页码数
		this.num = numString == null ? 1 : Integer.parseInt(numString);
		//每页显示的数量
		this.size = sizeString == null ? 10 : Integer.parseInt(sizeString);
		//总记录数
		this.total = total;
		//总页码数
		this.count = (int) Math.ceil((this.total * 1.0 / this.size));
		//判断当前页码数是否大于总页码数
		if (this.num > this.count && this.count > 0) {
			this.num = this.count;
		}
		//本次查询从多少开始
		this.start = (this.num - 1) * this.size;
		//每页显示的总页码数
		this.everyCount = 10;
		//每页页码开始数
		this.everyBegin = (this.num - this.everyCount / 2) < 1 ? 1 : (this.num - this.everyCount / 2);
		//每页页码结束数
		this.everyEnd = (this.num + this.everyCount / 2 - 1) >= this.count ? this.count : (this.num + this.everyCount / 2 - 1);
		//是否有上一页
		if (this.num > 1) {
			this.hasPrevious = true;
			//首页
			this.first = 1;
			//上一页
			this.previous = this.num - 1;
		}
		//是否有下一页
		if (this.num < this.count) {
			this.hasNext = true;
			//下一页
			this.next = this.num + 1;
			//尾页
			this.last = this.count;
		}
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEveryBegin() {
		return everyBegin;
	}

	public void setEveryBegin(int everyBegin) {
		this.everyBegin = everyBegin;
	}

	public int getEveryEnd() {
		return everyEnd;
	}

	public void setEveryEnd(int everyEnd) {
		this.everyEnd = everyEnd;
	}

	public int getEveryCount() {
		return everyCount;
	}

	public void setEveryCount(int everyCount) {
		this.everyCount = everyCount;
	}

	public boolean isHasPrevious() {
		return hasPrevious;
	}

	public void setHasPrevious(boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getPrevious() {
		return previous;
	}

	public void setPrevious(int previous) {
		this.previous = previous;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "SxtPageUtil [num=" + num + ", size=" + size + ", total=" + total + ", count=" + count + ", start=" + start + ", everyBegin=" + everyBegin + ", everyEnd=" + everyEnd + ", everyCount=" + everyCount + ", hasPrevious=" + hasPrevious + ", first=" + first + ", previous=" + previous + ", hasNext=" + hasNext + ", next=" + next + ", last=" + last + ", list=" + list + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + count;
		result = prime * result + everyBegin;
		result = prime * result + everyCount;
		result = prime * result + everyEnd;
		result = prime * result + first;
		result = prime * result + (hasNext ? 1231 : 1237);
		result = prime * result + (hasPrevious ? 1231 : 1237);
		result = prime * result + last;
		result = prime * result + ((list == null) ? 0 : list.hashCode());
		result = prime * result + next;
		result = prime * result + num;
		result = prime * result + previous;
		result = prime * result + size;
		result = prime * result + start;
		result = prime * result + total;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SxtPageUtil other = (SxtPageUtil) obj;
		if (count != other.count)
			return false;
		if (everyBegin != other.everyBegin)
			return false;
		if (everyCount != other.everyCount)
			return false;
		if (everyEnd != other.everyEnd)
			return false;
		if (first != other.first)
			return false;
		if (hasNext != other.hasNext)
			return false;
		if (hasPrevious != other.hasPrevious)
			return false;
		if (last != other.last)
			return false;
		if (list == null) {
			if (other.list != null)
				return false;
		} else if (!list.equals(other.list))
			return false;
		if (next != other.next)
			return false;
		if (num != other.num)
			return false;
		if (previous != other.previous)
			return false;
		if (size != other.size)
			return false;
		if (start != other.start)
			return false;
		if (total != other.total)
			return false;
		return true;
	}

}
