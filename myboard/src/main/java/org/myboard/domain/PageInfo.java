package org.myboard.domain;

import javax.servlet.http.HttpServletRequest;

public class PageInfo {
	/* 한페이지에 보여줄 게시물 개수 */
	private static final int LIST_SIZE = 12;
	
	/* 페이지 네비게이트 개수 (페이지 번호 출력 개수) */
	private static final int PAGE_NAVIGATE_SIZE = 10;
	
	/* 디폴트값 */
	private static final int DEFAULT_PAGE_NUM = 1;

	private int totalPageNum;
	private int currentPageNum;
	private int startPageNum;
	private int endPageNum;
	private int listStartNum;

	public PageInfo() {
	}

	/* PageInFo 객체 생성과 동시에 분석과 처리*/
	public PageInfo(HttpServletRequest request, int totalListCnt) {
		/* 페이지번호 요청 분석, null 일경우 1로 초기화 */
		this.currentPageNum = nullToDefault(request, "page", DEFAULT_PAGE_NUM);

		/* 총게시물을 리스트사이즈와 나눈후 나머지가 있으면 총페이지+1 대입, 없으면 그대로나누기후 총페이지 대입 */
		if (totalListCnt % LIST_SIZE == 0) {
			totalPageNum = (totalListCnt / LIST_SIZE);
		} else {
			totalPageNum = (totalListCnt / LIST_SIZE) + 1;
		}
		/* 요청페이지 오류를 잡고, 리스트사이즈 크기만큼 잘라 쿼리를 날려서 리스트를 불러오게 해주는 로직 */
		if (currentPageNum <= DEFAULT_PAGE_NUM) {
			listStartNum = 0;
		} else {
			listStartNum = (currentPageNum * LIST_SIZE) - LIST_SIZE;
		}
	}

	/* JSP로 뿌려주는 페이징 폼 */
	public String getNavigator() {
		StringBuffer sb = new StringBuffer();

		/* 페이징 시작과 끝을 구하는 계산식  */
		this.startPageNum = ((currentPageNum - 1) / PAGE_NAVIGATE_SIZE) * PAGE_NAVIGATE_SIZE + 1;
		this.endPageNum = ((currentPageNum - 1) / PAGE_NAVIGATE_SIZE) * PAGE_NAVIGATE_SIZE + PAGE_NAVIGATE_SIZE;
		
		/* 페이징 시작과 끝을 구한후 계산 오류를 잡는 로직  */
		if (endPageNum > totalPageNum) {
			endPageNum = totalPageNum;
		} else if (startPageNum <= 0) {
			startPageNum = DEFAULT_PAGE_NUM;
		}

		/* 요청페이지가 1 이상일경우 (처음으로, 이전)  출력  */
		if (currentPageNum > 1) {
			int prev = currentPageNum - 1;
			sb.append("<a href='/list?page=" + 1 + "' class='btn btn-default'>" + "처음으로" + "</a>");
			sb.append("<a href='/list?page=" + prev + "' class='btn btn-default'>" + "이전" + "</a>");
		}

		/* 계산된 시작번호와 끝번호를 반복문으로 뿌려주는 로직 */
		for (int i = startPageNum; i <= endPageNum; i++) {
			if (i != currentPageNum) {
				sb.append("<a href='/list?page=" + i + "' class='btn btn-default'>" + i + "</a>");
			} else {
				sb.append("<a style='color: red; font-weight: bold;' class='btn btn-default'>" + i + "</a>");
			}
		}

		/* 현재 페이지가 총 페이지보다 이하일경우 (다음, 끝으로) 출력  */
		if (totalPageNum > currentPageNum) {
			int next = currentPageNum + 1;
			sb.append("<a href='/list?page=" + next + "' class='btn btn-default'>" + "다음" + "</a>");
			sb.append("<a href='/list?page=" + totalPageNum + "' class='btn btn-default'>" + "끝으로" + "</a>");
		}
		return sb.toString();
	}

	/* 요청이 null 일경우 디폴트값으로 초기화시켜주는 로직 */
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
