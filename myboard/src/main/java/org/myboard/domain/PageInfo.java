package org.myboard.domain;

import javax.servlet.http.HttpServletRequest;

public class PageInfo {
	/* ���������� ������ �Խù� ���� */
	private static final int LIST_SIZE = 10;

	/* ������ �׺����Ʈ ���� (������ ��ȣ ��� ����) */
	private static final int PAGE_NAVIGATE_SIZE = 10;

	/* ����Ʈ�� */
	private static final int DEFAULT_PAGE_NUM = 1;

	private int totalPageNum;
	private int currentPageNum;
	private int startPageNum;
	private int endPageNum;
	private int listStartNum;
	private String link;

	public PageInfo() {
	}

	/* PageInFo ��ü ������ ���ÿ� �м��� ó�� */
	public PageInfo(HttpServletRequest request, int totalListCnt) {
		
		/*��û���� url�� �����ϴ� ����*/
		this.link = request.getRequestURL().toString();
		
		/* ��������ȣ ��û �м�, null �ϰ�� 1�� �ʱ�ȭ */
		this.currentPageNum = nullToDefault(request, "page", DEFAULT_PAGE_NUM);

		/* �ѰԽù��� ����Ʈ������� ������ �������� ������ ��������+1 ����, ������ �״�γ������� �������� ���� */
		if (totalListCnt % LIST_SIZE == 0) {
			totalPageNum = (totalListCnt / LIST_SIZE);
		} else {
			totalPageNum = (totalListCnt / LIST_SIZE) + 1;
		}

		/* GET��� ��������û ������ ���, ����Ʈ������ ũ�⸸ŭ �߶� ������ ������ ����Ʈ�� �ҷ����� ���ִ� ���� */
		if (currentPageNum <= 0 || currentPageNum > totalPageNum) {
			this.currentPageNum = DEFAULT_PAGE_NUM;
			this.listStartNum = 0;
		} else {
			this.listStartNum = (currentPageNum * LIST_SIZE) - LIST_SIZE;
		}
	}

	/* JSP�� �ѷ��ִ� ����¡ �� */
	public String getNavigator() {
		StringBuffer sb = new StringBuffer();

		/* ����¡ ���۰� ���� ���ϴ� ���� */
		this.startPageNum = ((currentPageNum - 1) / PAGE_NAVIGATE_SIZE ) * PAGE_NAVIGATE_SIZE + 1;
		this.endPageNum = ((currentPageNum - 1) / PAGE_NAVIGATE_SIZE ) * PAGE_NAVIGATE_SIZE + PAGE_NAVIGATE_SIZE;

		/* ����¡ ���۰� ���� ������ ��� ������ ��� ���� */
		if (endPageNum > totalPageNum) {
			endPageNum = totalPageNum;
		} else if (startPageNum <= 0) {
			startPageNum = DEFAULT_PAGE_NUM;
		}
		
		/*������ �̵�ó���� �ϴ� javascript �κ�*/
		  sb.append("<script language='javascript'>")
			.append("function goPage(pageNo){")
			.append("document.getElementById('searchForm').action=\"" + this.link + "?page=\" + pageNo;")
			.append("document.getElementById('searchForm').submit();")
			.append("}")
			.append("</script>");
		  
		  /*��Ʈ��Ʈ�� ���������̼� ����*/
		  sb.append("<ul class='pagination'>");
		
		/* ��û�������� 1 �̻��ϰ�� (ó������, ����) ��� */
		if (currentPageNum > 1) {
			int prev = currentPageNum - 1;
			sb.append("<li><a href='javascript:goPage(" + 1 + ");'>" + "<<<" + "</a></li>")
			  .append("<li><a href='javascript:goPage(" + prev + ");'>" + "<" + "</a></li>");
		}

		/* ���� ���۹�ȣ�� ����ȣ�� �ݺ������� �ѷ��ִ� ���� */
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i != currentPageNum) {
				sb.append("<li><a href='javascript:goPage(" + i + ");'>" + i + "</a></li>");
			} else {
				sb.append("<li class='active'><a>" + i + "</a></li>");
			}
		}

		/* ���� �������� �� ���������� �����ϰ�� (����, ������) ��� */
		if (totalPageNum > currentPageNum) {
			int next = currentPageNum + 1;
			sb.append("<li><a href='javascript:goPage(" + next + ");'>" + ">" + "</a></li>")
			  .append("<li><a href='javascript:goPage(" + totalPageNum + ");'>" + ">>>" + "</a></li>");
		}
		
		/*��Ʈ��Ʈ�� ���������̼� ��*/
		sb.append("</ul>");
		
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
