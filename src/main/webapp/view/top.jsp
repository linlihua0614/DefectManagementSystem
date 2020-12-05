<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>

</head>
<body bgcolor="#00BFFF">
  <div style="text-align:center;color:black;font-size:36px">软件缺陷跟踪管理系统</div>
  <div style="text-align:right;color:black;font-size:12px"><span>欢迎：${sessionScope.USER_SESSION.userName}&nbsp;|&nbsp;</span> <span><a target="right" href="${pageContext.request.contextPath}/view/resetPwd.jsp">修改密码</a></span>&nbsp;|&nbsp;<span><a target="right" href="${pageContext.request.contextPath}/user/logout">退出</a></span></div>
</body>
