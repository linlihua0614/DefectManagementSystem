<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/addpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/check.js"></script>
  <script>
    function updateUser() {
      var userName = $("#userName").val();
      if(is_empty(userName)){
        alert("用户名不能为空！");
        return;
      }
      if(!is_allow_username(userName)){
        alert("用户名只能包含字符和数字！");
        return;
      }
      if(!is_allow_length(userName,15)){
        alert("用户名不能超过15个字符！");
        return;
      }

      var passWord = $("#passWord").val();
      if(is_empty(passWord)){
        alert("密码不能为空！");
        return;
      }
      if(!is_allow_length(passWord,20)){
        alert("密码不能超过20个字符！");
        return;
      }

      $("#form1").submit();
    }
  </script>
</head>
<body>
<div class="div">
  <form id="form1" action="${pageContext.request.contextPath}/user/update" method="post">
    <input id="userName"  type="hidden" name="userName" value="${user.userName}" class="input"/>
    <table>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>用户名:</label></td>
        <td><label style="display: inline-block;width: 150px;text-align: left;font-size: 12px;">${user.userName}</label>
        </td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>密码:</label></td>
        <td><input id="passWord" type="text" name="passWord" value="${user.passWord}" class="input"/></td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>角色:</label></td>
        <td>
          <select  id="role" name="role" class="select">
            <option value="2" <c:if test="${'2' eq user.role}">selected</c:if>>缺陷发现人员</option>
            <option value="3" <c:if test="${'3' eq user.role}">selected</c:if>>缺陷确认人员</option>
            <option value="1" <c:if test="${'1' eq user.role}">selected</c:if>>缺陷解决人员</option>
            <option value="9" <c:if test="${'9' eq user.role}">selected</c:if>>数据分析人员</option>
            <option value="0" <c:if test="${'0' eq user.role}">selected</c:if>>管理员</option>
          </select>
        </td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>启用标识:</label></td>
        <td>
          <select id="useAble" name="useAble" class="select">
          <option value="0" <c:if test="${'0' eq user.useAble}">selected</c:if>>停用</option>
          <option value="1" <c:if test="${'1' eq user.useAble}">selected</c:if>>启用</option>
          </select>
        </td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td colspan="2" align="center"  valign="middle">
          <input type="button"  onclick="updateUser();"  value="提交" class="button"/></td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
