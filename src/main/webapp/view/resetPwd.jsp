<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta charset="UTF-8">
  <title>FORM Text</title>
  <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/addpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/check.js"></script>
  <script>
    function resetPwd() {
      var oldPwd = $("#oldPwd").val();
      var newPwd = $("#newPwd").val();
      var newPwd1 = $("#newPwd1").val();
      if(is_empty(oldPwd)){
        alert("原密码不能为空！");
        return;
      }
      if(!is_allow_length(oldPwd,20)){
        alert("原密码不能超过20个字符！");
        return;
      }

      if(is_empty(newPwd)){
        alert("新密码不能为空！");
        return;
      }
      if(!is_allow_length(newPwd,20)){
        alert("新密码不能超过20个字符！");
        return;
      }

      if(is_empty(newPwd1)){
        alert("确认密码不能为空！");
        return;
      }
      if(!is_allow_length(newPwd1,20)){
        alert("确认密码不能超过20个字符！");
        return;
      }

      if($.trim(newPwd) != $.trim(newPwd1)){
        alert("新密码与确认密码不相等！");
        return;
      }

      $("#form1").submit();
    }
  </script>
</head>
<body>
<div class="div">
  <form id="form1" action="${pageContext.request.contextPath}/user/resetPwd" method="post">
    <table>
      <tr height="9px;" align="center">
        <td colspan="2">
          <c:if test="${resetFail eq 0}"><span style="font-size: 12px;color: red;">修改成功，请重新登录！</span></c:if>
          <c:if test="${resetFail eq 1}"><span style="font-size: 12px;color: red;">原密码不正确！</span></c:if>
          <c:if test="${resetFail eq 2}"><span style="font-size: 12px;color: red;">新密码与确认密码不相等！</span></c:if>
        </td>
      </tr>
      <tr>
        <td><label class="label">原密码:</label></td>
        <td><input id="oldPwd" type="text" name="oldPwd" class="input"/></td>
      </tr>
      <tr>
        <td><label class="label">新密码:</label></td>
        <td><input id="newPwd" type="text" name="newPwd" class="input"/></td>
      </tr>
      <tr>
        <td><label class="label">确认密码:</label></td>
        <td><input id="newPwd1" type="text" name="newPwd1" class="input"/></td>
      </tr>

      <tr><td colspan="2" align="center"  valign="middle">
        <input type="button" style="width:50px;" onclick="resetPwd();"  value="提交" class="button" />
      </td></tr>

    </table>

  </form>
</div>
</body>
</html>
