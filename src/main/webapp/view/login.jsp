<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <style type="text/css">
    *all{
      margin: 0;
      padding: 0;
    }
    div.inner,table{
      position:absolute;
    }
    body{
      background-color:#00BFFF;
      background-size:100%;
    }
    .outer{
      height: 100%;
    }
    .inner{
      border: 5px solid rgba(255,255,255,1);
      border-radius: 20px;
      background-color:#FFFFFF;
      width: 370px;
      height: 330px;
      top: 36%;
      left: 66%;
      transform: translate(-50%,-50%);
      box-shadow:11px 11px 11px rgba(50,50,50,1);	///边框阴影
    }
    .table{
      top: 7%;
      left: 12%;
    //border: solid;
      width: 260px;
      height: 190px;
      border-spacing:7px;
    }
    .under{
      position: fixed;
      left: 0px;
      bottom: 30px;
      width: 100%;
      text-align:center;
      font-size: 15px;
    }

    .TEXT{
      height:72%;
      width: 200px;
    }
  </style>

  <script>
    function check(){

      var form1 = document.getElementById("form1");
      form1.submit();
    }

  </script>

</head>
<body>
<div class="outer">
  <div class="inner">
    <form  id="form1" action="/user/login" method="post">
    <table class="table">
      <caption> <h2>软件缺陷跟踪管理系统</h2> </caption>

      <tr height="9px;">

        <td colspan="2">
          <c:if test="${loginFailCode eq 1}"><span style="font-size: 12px;color: red;">用户名或密码不能为空！</span></c:if>
          <c:if test="${loginFailCode eq 2}"><span style="font-size: 12px;color: red;">用户不存在或已停用！</span></c:if>
          <c:if test="${loginFailCode eq 3}"><span style="font-size: 12px;color: red;">密码不正确！</span></c:if>
        </td>
      </tr>
      <tr height="30px">
        <td><big><b>账&nbsp;&nbsp;号</b></big></td>
        <td><input type="text" name="userName" id="userName" class="TEXT"/> </td>
      </tr>
      <tr height="30px">
        <td><big><b>密&nbsp;&nbsp;码</b></big></td>
        <td><input type="password" name="passWord" id="passWord"  class="TEXT"/> </td>
      </tr>
      <tr height="30px">
        <td colspan="2" align="right">
          <input class="TEXT"type='button' onclick = 'check()' value="            登陆系统              "/>
        </td>
      </tr>
    </table>
    </form>
  </div>
  <div class="under"><span>请使用Google Chrome浏览器,其他浏览器可能会出现功能异常现象。</span></div>
</div>
</body>
</html>
