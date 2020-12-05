<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/listpage.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script>
  function search() {
    $("#form1").submit();
  }
  function initAdd(){
    //跳转到修改页面
    window.location.href="${pageContext.request.contextPath}/defect/initAdd";
  }
</script>
</head>
<body>
<div class="div">
  <form id="form1" action="${pageContext.request.contextPath}/defect/list" method="post" >
    <input type="hidden" id="pageNum" name="pageNum" value="${requestScope.page.pageNum}"/>
    <table>
      <tr>
        <td><span class="span">项目名称:</span></td>
        <td><input id="projName" type="text" name="projName" value="${projName}" class="input" style="width: 150px;"/></td>
        <td><span class="span">缺陷类型 :</span></td>
        <td>
          <select id="type" name="type"  class="select" style="width: 150px;">
            <option value="-1">请选择</option>
            <option value="1" <c:if test="${'1' eq type}">selected</c:if>>缺陷</option>
            <option value="2" <c:if test="${'2' eq type}">selected</c:if>>优化</option>
            <option value="3" <c:if test="${'3' eq type}">selected</c:if>>建议</option>
            <option value="4" <c:if test="${'4' eq type}">selected</c:if>>需求</option>
          </select>
        </td>
        <td><span class="span">缺陷状态 :</span></td>
        <td>
          <select id="state" name="state" class="select" style="width: 150px;">
            <option value="-1">请选择</option>
            <option value="new" <c:if test="${'new' eq state}">selected</c:if>>新建</option>
            <option value="open" <c:if test="${'open' eq state}">selected</c:if>>打开</option>
            <option value="assigned" <c:if test="${'assigned' eq state}">selected</c:if>>已指派</option>
            <option value="fixed" <c:if test="${'fixed' eq state}">selected</c:if>>已修复</option>
            <option value="rejectd" <c:if test="${'rejectd' eq state}">selected</c:if>>拒绝</option>
            <option value="deferred" <c:if test="${'deferred' eq state}">selected</c:if>>延期</option>
            <option value="reopen" <c:if test="${'reopen' eq state}">selected</c:if>>重新打开</option>
            <option value="closed" <c:if test="${'closed' eq state}">selected</c:if>>关闭</option>
          </select>
        </td>
        <td><span class="span">缺陷发现人员 :</span></td>
        <td><input id="tester" type="text" name="tester" value="${tester}" class="input" style="width: 150px;"/></td>
      </tr>

      <tr>
        <td><span class="span">严重性 :</span></td>
        <td>
          <select id="seriousness" name="seriousness" class="select" style="width: 150px;">
            <option value="-1">请选择</option>
            <option value="1" <c:if test="${'1' eq seriousness}">selected</c:if>>非常严重</option>
            <option value="2" <c:if test="${'2' eq seriousness}">selected</c:if>>比较严重</option>
            <option value="3" <c:if test="${'3' eq seriousness}">selected</c:if>>一般</option>
            <option value="4" <c:if test="${'4' eq seriousness}">selected</c:if>>轻微</option>
          </select>
        </td>
        <td><span class="span">优先级 :</span></td>
        <td>
          <select id="priority" name="priority" class="select" style="width: 150px;">
            <option value="-1">请选择</option>
            <option value="1" <c:if test="${'1' eq priority}">selected</c:if>>立即解决</option>
            <option value="2" <c:if test="${'2' eq priority}">selected</c:if>>高优先级</option>
            <option value="3" <c:if test="${'3' eq priority}">selected</c:if>>正常处理</option>
            <option value="4" <c:if test="${'4' eq priority}">selected</c:if>>低优先级</option>
          </select>
        </td>
        <td><span class="span">复现率:</span></td>
        <td>
          <select id="recurrenceRate" name="recurrenceRate" class="select" style="width: 150px;">
            <option value="-1">请选择</option>
            <option value="0" <c:if test="${'0' eq recurrenceRate}">selected</c:if>>0%</option>
            <option value="5" <c:if test="${'5' eq recurrenceRate}">selected</c:if>>5%</option>
            <option value="10" <c:if test="${'10' eq recurrenceRate}">selected</c:if>>10%</option>
            <option value="15" <c:if test="${'15' eq recurrenceRate}">selected</c:if>>15%</option>
            <option value="20" <c:if test="${'20' eq recurrenceRate}">selected</c:if>>20%</option>
            <option value="25" <c:if test="${'25' eq recurrenceRate}">selected</c:if>>25%</option>
            <option value="30" <c:if test="${'30' eq recurrenceRate}">selected</c:if>>30%</option>
            <option value="35" <c:if test="${'35' eq recurrenceRate}">selected</c:if>>35%</option>
            <option value="40" <c:if test="${'40' eq recurrenceRate}">selected</c:if>>40%</option>
            <option value="45" <c:if test="${'45' eq recurrenceRate}">selected</c:if>>45%</option>
            <option value="50" <c:if test="${'50' eq recurrenceRate}">selected</c:if>>50%</option>
            <option value="55" <c:if test="${'55' eq recurrenceRate}">selected</c:if>>55%</option>
            <option value="60" <c:if test="${'60' eq recurrenceRate}">selected</c:if>>60%</option>
            <option value="65" <c:if test="${'65' eq recurrenceRate}">selected</c:if>>65%</option>
            <option value="70" <c:if test="${'70' eq recurrenceRate}">selected</c:if>>70%</option>
            <option value="75" <c:if test="${'75' eq recurrenceRate}">selected</c:if>>75%</option>
            <option value="80" <c:if test="${'80' eq recurrenceRate}">selected</c:if>>80%</option>
            <option value="85" <c:if test="${'85' eq recurrenceRate}">selected</c:if>>85%</option>
            <option value="90" <c:if test="${'90' eq recurrenceRate}">selected</c:if>>90%</option>
            <option value="95" <c:if test="${'95' eq recurrenceRate}">selected</c:if>>95%</option>
            <option value="100" <c:if test="${'100' eq recurrenceRate}">selected</c:if>>100%</option>
          </select>
        </td>
        <td><span class="span">当前处理人 :</span></td>
        <td><input id="handler" type="text" name="handler" value="${handler}" class="input" style="width: 150px;"/></td>
      </tr>

      <tr>
        <td><span class="span">开始时间:</span></td>
        <td>
          <input type="text" style="width: 150px;" name="startTime" id="startTime"
                 onFocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd'})     "
                 value="${startTime}"/>
        </td>
        <td><span class="span">结束时间:</span></td>
        <td><input type="text" style="width: 150px;" name="endTime" id="endTime"
                   onFocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd'})"
                   value="${endTime}"/>
        </td>
        <td colspan="4" align="right">
          <input type="button"  value="查询" onclick="search();"  class="button"/>
          <c:if test="${sessionScope.USER_SESSION.role eq 2}">
            <input type="button"  value="添加" onclick="initAdd();" class="button"/>
          </c:if>
        </td>
      </tr>
    </table>

  </form>
</div>
<table class="data1">
  <tr>
    <th>项目名称</th>
    <th>所处项目阶段</th>
    <th>模块</th>
    <th>缺陷类型</th>
    <th>严重性</th>
    <th>优先级</th>
    <th>复现率</th>
    <th>缺陷状态</th>
    <th>缺陷发现人员</th>
    <th>当前处理人</th>
    <th>创建时间</th>
    <th>操作</th>
  </tr>
  <c:forEach items="${page.list}" var="p">
    <tr>
      <td>${p.projName}</td>
      <td>${p.atProjStateStr}</td>
      <td>${p.module}</td>
      <td>${p.typeStr}</td>
      <td>${p.seriousnessStr}</td>
      <td>${p.priorityStr}</td>
      <td>${p.recurrenceRateStr}</td>
      <td>${p.stateStr}</td>
      <td>${p.tester}</td>
      <td>${p.handler}</td>
      <td><fmt:formatDate value="${p.createTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
      <td>
          <%--缺陷状态：new：新建、open：打开、assigned：已指派、fixed：已修复、rejectd:拒绝、deferred:延期、reopen：从新打开、closed：关闭--%>

        <c:if test="${loginUserName eq p.handler && 'new' eq p.state}">
          <a href="${pageContext.request.contextPath}/defect/initUpdate?id=${p.id}">修改</a>
          <a href="${pageContext.request.contextPath}/defect/delete?id=${p.id}">删除</a>
        </c:if>
        <c:if test="${loginUserName eq p.handler && 'new' ne p.state && 'closed' ne p.state}">
          <a href="${pageContext.request.contextPath}/defect/initDeal?id=${p.id}">处理</a>
        </c:if>
        <c:if test="${'new' ne p.state}">
          <a href="${pageContext.request.contextPath}/defect/initView?id=${p.id}">查看</a>
        </c:if>

      </td>
    </tr>
  </c:forEach>
</table>
<%@ include file="page.jsp" %>
</body>
</html>
