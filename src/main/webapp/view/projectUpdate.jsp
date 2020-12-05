<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/addpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/check.js"></script>
  <script>
    function updateProj() {
      var projName = $("#projName").val();
      if(is_empty(projName)){
        alert("项目名称不能为空！");
        return;
      }
      if(!is_allow_length(projName,50)){
        alert("项目名称不能超过50个字符！");
        return;
      }
      var projNum = $("#projNum").val();
      if(!is_empty(projNum)){
        if(!is_allow_length(projNum,50)){
          alert("项目不能不能超过50个字符！");
          return;
        }
      }

      var manager = $("#manager").val();
      if(!is_empty(manager)){
        if(!is_allow_length(manager,15)){
          alert("项目负责人不能超过15个字符！");
          return;
        }
      }

      var remark = $("#remark").val();
      if(!is_empty(remark)){
        if(!is_allow_length(remark,100)){
          alert("备注不能超过100个字符！");
          return;
        }
      }
      $("#form1").submit();
    }
  </script>
</head>
<body>
<div class="div">
  <form id="form1" action="${pageContext.request.contextPath}/project/update" method="post">
    <input id="id"  type="hidden" name="id" value="${proj.id}" class="input"/>
    <table>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>项目名:</label></td>
        <td><input id="projName" type="text" name="projName" value="${proj.projName}" class="input"/></td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label">项目编号:</label></td>
        <td><input id="projNum" type="text" name="projNum" value="${proj.projNum}"  class="input"/></td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label">项目负责人:</label></td>
        <td><input id="manager" type="text" name="manager" value="${proj.manager}"  class="input"/></td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>完结标识:</label></td>
        <td>
          <select id="isEnd" name="isEnd" class="select">
            <option value="0" <c:if test="${'0' eq proj.isEnd}">selected</c:if>>未完结</option>
            <option value="1" <c:if test="${'1' eq proj.isEnd}">selected</c:if>>已完结</option>
            <option value="2" <c:if test="${'2' eq proj.isEnd}">selected</c:if>>暂停</option>
          </select>
        </td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td><label class="label">备注:</label></td>
        <td><textarea id="remark" name="remark"  class="textarea">${proj.remark}</textarea></td>
      </tr>
      <tr style="line-height: 9px;height: 9px;"></tr>
      <tr>
        <td colspan="2" align="center"  valign="middle">
          <input type="button"  onclick="updateProj();"  value="提交" class="button"/></td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
