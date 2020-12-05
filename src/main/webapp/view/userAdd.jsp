<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/addpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/check.js"></script>
  <script>
    function addUser() {
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
  <form id="form1" action="${pageContext.request.contextPath}/user/add" method="post">

    <table>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>用户名:</label></td>
        <td><input id="userName" type="text" name="userName" class="input"/></td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>密码:</label></td>
        <td><input id="passWord" type="text" name="passWord" value="123" class="input"/></td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>角色:</label></td>
        <td>
          <select id="role" name="role" class="select">
            <option value="2">缺陷发现人员</option>
            <option value="3">缺陷确认人员</option>
            <option value="1">缺陷解决人员</option>
            <option value="9">数据分析人员</option>
            <option value="0">管理员</option>
          </select>
        </td>
    </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>启用标识:</label></td>
        <td>
          <select id="useAble" name="useAble" class="select">
          <option value="0">停用</option>
          <option value="1" selected>启用</option>
          </select>
        </td>
     </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td colspan="2" align="center"  valign="middle">
          <input type="button"  onclick="addUser();"  value="提交" class="button"/>
        </td>
      </tr>
    </table>

  </form>
</div>
</body>
</html>
