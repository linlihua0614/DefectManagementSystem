<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/listpage.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script>
  function search() {
    $("#form1").submit();
  }
  function initAdd(){
    //跳转到修改页面
    window.location.href="${pageContext.request.contextPath}/view/projectAdd.jsp";
  }
</script>
</head>
<body>
<div class="div">
  <form id="form1" action="${pageContext.request.contextPath}/project/list" method="post" >
    <input type="hidden" id="pageNum" name="pageNum" value="${requestScope.page.pageNum}"/>
    <table>
      <tr>
        <td><span class="span">项目名:</span></td>
        <td><input id="projName" type="text" name="projName" value="${projName}" class="input"/></td>

        <td><span class="span">完结标识:</span></td>
        <td>
          <select id="isEnd" name="isEnd" class="select">
          <option value="-1">请选择</option>
          <option value="0" <c:if test="${'0' eq isEnd}">selected</c:if>>未完结</option>
          <option value="1" <c:if test="${'1' eq isEnd}">selected</c:if>>已完结</option>
          <option value="2" <c:if test="${'2' eq isEnd}">selected</c:if>>暂停</option>
          </select>
        </td>
      </tr>
      <tr>


        <td colspan="4" align="right">
          <input type="button"  value="查询" onclick="search();"  class="button"/>
          <input type="button"  value="添加" onclick="initAdd();" class="button"/>
        </td>
      </tr>


    </table>

  </form>
</div>
<table class="data1">
  <tr>
    <th>项目名</th>
    <th>项目编号</th>
    <th>项目负责人</th>
    <th>创建人</th>
    <th>创建时间</th>
    <th>更改人</th>
    <th>更改时间</th>
    <th>完结标识</th>
    <th>操作</th>
  </tr>
  <c:forEach items="${page.list}" var="p">
    <tr>
      <td>${p.projName}</td>
      <td>${p.projNum}</td>
      <td>${p.manager}</td>
      <td>${p.createUser}</td>
      <td><fmt:formatDate value="${p.createTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
      <td>${p.updateUser}</td>
      <td><fmt:formatDate value="${p.updateTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
      <td>${p.isEndStr}</td>
      <td>
        <a href="${pageContext.request.contextPath}/project/initUpdate?id=${p.id}">修改</a>
      </td>
    </tr>
  </c:forEach>
</table>
<%@ include file="page.jsp" %>
</body>
</html>
