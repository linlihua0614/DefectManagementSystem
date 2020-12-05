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
    window.location.href="${pageContext.request.contextPath}/view/userAdd.jsp";
  }
</script>
</head>
<body>
<div class="div">
  <form id="form1" action="${pageContext.request.contextPath}/user/list" method="post" >
    <input type="hidden" id="pageNum" name="pageNum" value="${requestScope.page.pageNum}"/>
    <table>
      <tr>
        <td><span class="span">用户名:</span></td>
        <td><input id="userName" type="text" name="userName" value="${userName}" class="input"/></td>

        <td><span class="span">角色:</span></td>
        <td>
          <select id="role" name="role" class="select">
          <option value="-1">请选择</option>
            <option value="2" <c:if test="${'2' eq role}">selected</c:if>>缺陷发现人员</option>
            <option value="3" <c:if test="${'3' eq role}">selected</c:if>>缺陷确认人员</option>
            <option value="1" <c:if test="${'1' eq role}">selected</c:if>>缺陷解决人员</option>
            <option value="9" <c:if test="${'9' eq role}">selected</c:if>>数据分析人员</option>
            <option value="0" <c:if test="${'0' eq role}">selected</c:if>>管理员</option>
          </select>
        </td>
        <td><span class="span">启用标识:</span></td>
        <td>
          <select id="useAble" name="useAble" class="select">
          <option value="-1">请选择</option>
          <option value="0" <c:if test="${'0' eq useAble}">selected</c:if>>停用</option>
          <option value="1" <c:if test="${'1' eq useAble}">selected</c:if>>启用</option>
          </select>
        </td>
      </tr>
      <tr>


        <td colspan="6" align="right">
          <input type="button"  value="查询" onclick="search();"  class="button"/>
          <input type="button"  value="添加" onclick="initAdd();" class="button"/>
        </td>
      </tr>


    </table>

  </form>
</div>
<table class="data1">
  <tr>
    <th>用户名</th>
    <th>密码</th>
    <th>角色</th>
    <th>创建人</th>
    <th>创建时间</th>
    <th>更改人</th>
    <th>更改时间</th>
    <th>启用标识</th>
    <th>操作</th>
  </tr>
  <c:forEach items="${page.list}" var="p">
    <tr>
      <td>${p.userName}</td>
      <td>${p.passWord}</td>
      <td>${p.roleStr}</td>
      <td>${p.createUser}</td>
      <td><fmt:formatDate value="${p.createTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
      <td>${p.updateUser}</td>
      <td><fmt:formatDate value="${p.updateTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>

      <td>${p.useAbleStr}</td>
      <td>
        <a href="${pageContext.request.contextPath}/user/initUpdate?userName=${p.userName}">修改</a>
      </td>
    </tr>
  </c:forEach>
</table>
<%@ include file="page.jsp" %>
</body>
</html>
