package org.graz.domain;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

public class PageInformation implements Serializable {
   private static final long serialVersionUID = -169259303150430220L;

   private static final int PAGE_CURRENT_NO = 1;
   private static final int PAGE_ITEM_COUNT = 10;
   private static final int PAGE_BLOCK_COUNT = 10;

   private String linkUrl;
   private int pageNo;
   private int pageItemCount;
   private int totalItemCount;
   private int itemStartNo;
   private int itemEndNo;

   public PageInformation(HttpServletRequest request, int totalItemCount) {
      this.linkUrl = getUrl(request);
      this.pageNo = nullToDefault(request, "pageNo", PAGE_CURRENT_NO);
      this.pageItemCount = nullToDefault(request, "pageItemCount", PAGE_ITEM_COUNT);
      this.totalItemCount = totalItemCount;

      int totalPageCount = this.totalItemCount / PAGE_ITEM_COUNT;
      if (this.totalItemCount % PAGE_ITEM_COUNT > 0) {
         totalPageCount++;
      }

      int pageItemCount = this.pageItemCount;
      int pageNo = this.pageNo;
      if (pageNo > totalPageCount) {
         pageNo = totalPageCount;
      }

      int startItemNo = 1;
      if (this.pageNo > 0) {
         startItemNo = (pageNo - 1) * pageItemCount + 1;
      }

      int itemEndNo = PAGE_ITEM_COUNT;
      if (this.pageNo > 0) {
         if (pageNo > totalPageCount) {
            itemEndNo = (pageNo - 1) * PAGE_ITEM_COUNT + this.totalItemCount % PAGE_ITEM_COUNT;
         } else {
            itemEndNo = pageNo *  PAGE_ITEM_COUNT;
         }
      }

      this.pageNo = pageNo;
      this.pageItemCount = pageItemCount;
      this.itemStartNo = startItemNo;
      this.itemEndNo = itemEndNo;
   }

   public String getNavigator() {
      if (this.pageNo <= 0 || this.pageItemCount <= 0 || PAGE_ITEM_COUNT <= 0) {
         return "";
      }

      int totalPageCount = this.totalItemCount / this.pageItemCount;
      if (this.totalItemCount % this.pageItemCount > 0) {
         totalPageCount++;
      }
      if (totalPageCount <= 0) {
         totalPageCount = 1;
      }

      int currentPageNo = this.pageNo / PAGE_BLOCK_COUNT;
      if (this.pageNo % PAGE_BLOCK_COUNT > 0) {
         currentPageNo++;
      }

      int lastPageNo = totalPageCount / PAGE_BLOCK_COUNT;
      if (totalPageCount % PAGE_BLOCK_COUNT > 0) {
         lastPageNo++;
      }

      int startPageNo = (currentPageNo - 1) * PAGE_BLOCK_COUNT + 1;
      int endPageNo = (currentPageNo - 1) * PAGE_BLOCK_COUNT + PAGE_BLOCK_COUNT;
      if (endPageNo > totalPageCount) {
         endPageNo = totalPageCount;
      }

      StringBuffer navigator = new StringBuffer();
      navigator.append("<script language='javascript'>").append("\n")
            .append("    function goPage(pageNo) {").append("\n")
            .append("        document.getElementById('form_search').action=\"" + this.linkUrl + "?pageNo=\" + pageNo;").append("\n")
            .append("        document.getElementById('form_search').submit();").append("\n")
            .append("    }").append("\n")
            .append("</script>").append("\n")
            .append("<div style='text-align: center;'>").append("\n");
      
      if (startPageNo > PAGE_BLOCK_COUNT) {
         navigator.append("<a href=\"").append("javascript:goPage(1);")
               .append("\">").append("처음").append("</a>").append("\n");
      }

      if (this.pageNo > 1) {
         navigator.append("<a href=\"")
               .append("javascript:goPage(" + (this.pageNo - 1) + ");")
               .append("\">").append("이전").append("</a>").append("\n");
      }

      if (startPageNo > PAGE_BLOCK_COUNT) {
         navigator.append("<a href=\"");

         int previous = this.pageNo - PAGE_BLOCK_COUNT;
         
         if (previous <= 0) {
            previous = 1;
         }

         navigator.append("javascript:goPage(" + previous + ");")
                  .append("\">").append("...").append("</a>").append("\n");
      }

      for (int i = startPageNo; i <= endPageNo; i++) {
         if (i != this.pageNo) {
            navigator.append("<a href=\"")
                  	 .append("javascript:goPage(" + i + ");")
                     .append("\">").append(i).append("</a>").append("\n");
         } else {
            navigator.append("<a href=\'' style='color: red; font-weight: bold;'>"+ i + "</a>");
         }
         if (i < endPageNo) {
        	 navigator.append(" | ");
         }
      }
      navigator.append("\n");

      if (currentPageNo < lastPageNo) {
         navigator.append("<a href=\"");

         int next = this.pageNo + PAGE_BLOCK_COUNT;
         if (next > totalPageCount) {
            next = totalPageCount;
         }

         navigator.append("javascript:goPage(" + next + ");")
               .append("\">").append("...").append("</a>&nbsp;").append("\n");
      }

      if (this.pageNo < totalPageCount) {
         navigator.append("<a href=\"")
               .append("javascript:goPage(" + (this.pageNo + 1) + ");")
               .append("\">").append("다음").append("</a>&nbsp;").append("\n");
      }

      if (currentPageNo < lastPageNo) {
         navigator.append("<a href=\"")
               .append("javascript:goPage(" + totalPageCount + ");")
               .append("\">").append("끝").append("</a>&nbsp;").append("\n");
      }
      
      navigator.append("</div>");

      return navigator.toString();
   }

   private String getUrl(HttpServletRequest request) {
      StringBuffer url = new StringBuffer(request.getRequestURL());
      return url.toString();
   }

   private int nullToDefault(HttpServletRequest request, String key, int defaultValue) {
      return request.getParameter(key) != null ? Integer.parseInt(request.getParameter(key)) : defaultValue;
   }

   public int getItemStartNo() {
      return itemStartNo;
   }

   public int getItemEndNo() {
      return itemEndNo;
   }

   public int getPageNo() {
      return pageNo;
   }

   public int getPageItemCount() {
      return pageItemCount;
   }
}