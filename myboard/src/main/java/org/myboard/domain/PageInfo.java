package org.myboard.domain;

import javax.servlet.http.HttpServletRequest;

public class PageInfo {
	/* ���������� ������ �Խù� ���� */
	private static final int LIST_SIZE = 12;
	
	/* ������ �׺����Ʈ ���� (������ ��ȣ ��� ����) */
	private static final int PAGE_NAVIGATE_SIZE = 10;
	
	/* ����Ʈ�� */
	private static final int DEFAULT_PAGE_NUM = 1;

	private int totalPageNum;
	private int currentPageNum;
	private int startPageNum;
	private int endPageNum;
	private int listStartNum;

	public PageInfo() {
	}

	/* PageInFo ��ü ������ ���ÿ� �м��� ó��*/
	public PageInfo(HttpServletRequest request, int totalListCnt) {
		/* ��������ȣ ��û �м�, null �ϰ�� 1�� �ʱ�ȭ */
		this.currentPageNum = nullToDefault(request, "page", DEFAULT_PAGE_NUM);

		/* �ѰԽù��� ����Ʈ������� ������ �������� ������ ��������+1 ����, ������ �״�γ������� �������� ���� */
		if (totalListCnt % LIST_SIZE == 0) {
			totalPageNum = (totalListCnt / LIST_SIZE);
		} else {
			totalPageNum = (totalListCnt / LIST_SIZE) + 1;
		}
		/* ��û������ ������ ���, ����Ʈ������ ũ�⸸ŭ �߶� ������ ������ ����Ʈ�� �ҷ����� ���ִ� ���� */
		if (currentPageNum <= DEFAULT_PAGE_NUM) {
			listStartNum = 0;
		} else {
			listStartNum = (currentPageNum * LIST_SIZE) - LIST_SIZE;
		}
	}

	/* JSP�� �ѷ��ִ� ����¡ �� */
	public String getNavigator() {
		StringBuffer sb = new StringBuffer();

		/* ����¡ ���۰� ���� ���ϴ� ����  */
		this.startPageNum = ((currentPageNum - 1) / PAGE_NAVIGATE_SIZE) * PAGE_NAVIGATE_SIZE + 1;
		this.endPageNum = ((currentPageNum - 1) / PAGE_NAVIGATE_SIZE) * PAGE_NAVIGATE_SIZE + PAGE_NAVIGATE_SIZE;
		
		/* ����¡ ���۰� ���� ������ ��� ������ ��� ����  */
		if (endPageNum > totalPageNum) {
			endPageNum = totalPageNum;
		} else if (startPageNum <= 0) {
			startPageNum = DEFAULT_PAGE_NUM;
		}

		/* ��û�������� 1 �̻��ϰ�� (ó������, ����)  ���  */
		if (currentPageNum > 1) {
			int prev = currentPageNum - 1;
			sb.append("<a href='/list?page=" + 1 + "' class='btn btn-default'>" + "ó������" + "</a>");
			sb.append("<a href='/list?page=" + prev + "' class='btn btn-default'>" + "����" + "</a>");
		}

		/* ���� ���۹�ȣ�� ����ȣ�� �ݺ������� �ѷ��ִ� ���� */
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i != currentPageNum) {
				sb.append("<a href='/list?page=" + i + "' class='btn btn-default'>" + i + "</a>");
			} else {
				sb.append("<a style='color: red; font-weight: bold;' class='btn btn-default'>" + i + "</a>");
			}
		}

		/* ���� �������� �� ���������� �����ϰ�� (����, ������) ���  */
		if (totalPageNum > currentPageNum) {
			int next = currentPageNum + 1;
			sb.append("<a href='/list?page=" + next + "' class='btn btn-default'>" + "����" + "</a>");
			sb.append("<a href='/list?page=" + totalPageNum + "' class='btn btn-default'>" + "������" + "</a>");
		}
		return sb.toString();
	}

	/* ��û�� null �ϰ�� ����Ʈ������ �ʱ�ȭ�����ִ� ���� */
	private int nullToDefault(HttpServletRequest request, String key, int defaultValue) {
		return request.getParameter(key) != null ? Integer.parseInt(request.getParameter(key)) : defaultValue;
	}

	/* GETTER SETTER */
	public int getListsize() {
		return LIST_SIZE;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public int getListStartNum() {
		return listStartNum;
	}

}
