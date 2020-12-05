<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
  p{
    vertical-align: text-top;
    padding: 1px 15px 2px 1px;
    font-size: 12px;
  }

</style>
<script type="text/javascript" src="/js/jquery.js"></script>
<script>
  function setPageNum(pageNum) {
    $("#pageNum").val(pageNum);
    search();
  }
</script>
</head>
<body style="text-align:center">
<p>
<a href="#" onclick="setPageNum(1)">首页</a>
<%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
<c:if test="${requestScope.page.pageNum ==1}">
  <a href="#" onclick="setPageNum(${requestScope.page.pageNum+1})">下一页</a>
</c:if>

<%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
<c:if test="${requestScope.page.pageNum > 1 && requestScope.page.pageNum < requestScope.page.totalPage}">
  <a href="#" onclick="setPageNum(${requestScope.page.pageNum-1})">上一页</a>
  <a href="#" onclick="setPageNum(${requestScope.page.pageNum+1})">下一页</a>
</c:if>

<%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
<c:if test="${requestScope.page.pageNum == requestScope.page.totalPage}">
  <a href="#" onclick="setPageNum(${requestScope.page.pageNum-1})">上一页</a>
</c:if>
<%--尾页 --%>
<a href="#" onclick="setPageNum(${requestScope.page.totalPage})">尾页</a>
&nbsp;&nbsp;&nbsp;第${requestScope.page.pageNum}页/共${requestScope.page.totalPage }页&nbsp;&nbsp;&nbsp;共${requestScope.page.totalNum}条
</p>
</body>
</html>
