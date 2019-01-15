package com.bjsxt.school.util;

import java.util.List;

public class PageBean<T> {
	private int size = 5;// 每页显示记录 //ok
	private int index = 1;// 当前页号 ok
	private int totalPageCount = 1;// 总页数 ok
	private int totalCount = 0;// 记录总数 ok

	private int[] numbers;// 展示页数集合 ok
	protected List<T> list;// 要显示到页面的数据集 ok

	/**
	 * 得到开始记录
	 * 
	 * @return
	 */
	public int getStartRow() {

		return (index - 1) * size;
	}

	/**
	 * 得到结束记录
	 * 
	 * @return
	 */
	public int getEndRow() {

		return index * size;
	}

	/**
	 * @return Returns the size.
	 */
	public int getSize() {
		return size;
	}

	/**
	 * @param size
	 *            The size to set.
	 */
	public void setSize(int size) {
		if (size > 0) {
			this.size = size;
		}
	}

	/**
	 * @return Returns the currentPageNo.
	 */
	public int getIndex() {
		if (totalPageCount == 0) {

			return 0;
		}

		return index;
	}

	/**
	 * @param currentPageNo
	 *            The currentPageNo to set.
	 */
	public void setIndex(int index) {
		if (index > 0) {
			this.index = index;
		}
	}

	/**
	 * @return Returns the totalCount.
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @param totalCount
	 *            The totalCount to set.
	 */
	public void setTotalCount(int totalCount) {
		if (totalCount >= 0) {
			this.totalCount = totalCount;
			setTotalPageCountByRs();// 根据总记录数计算总页�?
		}
	}

	public int getTotalPageCount() {
		return this.totalPageCount;
	}

	/**
	 * 根据总记录数计算总页�? 5 20 4 23 5
	 */
	private void setTotalPageCountByRs() {
		if (this.size > 0 && this.totalCount > 0
				&& this.totalCount % this.size == 0) {
			this.totalPageCount = this.totalCount / this.size;
		} else if (this.size > 0 && this.totalCount > 0
				&& this.totalCount % this.size > 0) {
			this.totalPageCount = (this.totalCount / this.size) + 1;
		} else {
			this.totalPageCount = 0;
		}
		setNumbers(totalPageCount);// 获取展示页数集合
	}

	public int[] getNumbers() {
		return numbers;
	}

	/**
	 * 设置显示页数集合
	 * 
	 * 默认显示10个页码 41 42 43 44 [45 ] 46 47 48 49 50
	 * 
	 * 
	 * @param totalPageCount
	 */
	public void setNumbers(int totalPageCount) {
		if (totalPageCount > 0) {
			// !.当前数组的长度
			int[] numbers = new int[totalPageCount > 10 ? 10 : totalPageCount];// 页面要显示的页数集合
			int k = 0;
			for (int i = 0; i < totalPageCount; i++) {
				// 保证当前页为集合的中�?
				if ((i >= index - (numbers.length / 2 + 1) || i >= totalPageCount - numbers.length)
						&& k < numbers.length) {
					numbers[k] = i + 1;
					k++;
				} else if (k >= numbers.length) {
					break;
				}
			}

			this.numbers = numbers;
		}

	}

	public void setNumbers(int[] numbers) {
		this.numbers = numbers;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}
