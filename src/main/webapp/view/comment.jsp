<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/dealpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
</head>
<body>
<div class="div">
  <span>系统部分码值说明</span>
  <table class="data2">
    <tr>&nbsp;</tr>
    <tr>
      <td><label>缺陷类型:</label></td>
      <td><span>缺陷、优化、建议、需求</span></td>
    </tr>

    <tr>
      <td><label>严重性:</label></td>
      <td><span>非常严重、比较严重、一般、轻微</span></td>
    </tr>

    <tr>
      <td><label>优先级:</label></td>
      <td><span>立即解决、高优先级、正常处理、低优先级</span></td>
    </tr>

    <tr>
      <td><label>复现率:</label></td>
      <td><span>复现率 0%、5%、10%、15%、20%.....95%、100%
      </span></td>
    </tr>

    <tr>
      <td><label>缺陷状态:</label></td>
      <td>
        <span>
          新建：缺陷发现人员将缺陷录入系统后的状态。<br/>
          打开：缺陷发现人员将缺陷提交给确认人员后的状态。<br/>
          已指派：缺陷确认人员将缺陷指派给解决人员后的状态。<br/>
          已修复：缺陷解决人员修复缺陷后的状态。<br/>
          拒绝：缺陷确认人员或者缺陷解决人员不予解决后的状态。<br/>
          延期：缺陷确认人员将缺陷标识成延期后的状态。<br/>
          从新打开：缺陷发现人员从新打开缺陷后的状态。<br/>
          关闭：缺陷发现人员关闭缺陷后的状态。
        </span>
      </td>
    </tr>

    <tr>
      <td><label>所处项目状态:</label></td>
      <td>
        <span>
          本系统维护了软件生命周期内的所有缺陷，缺陷发现人员可以介入的环节包括：需求、设计、开发、测试、实施、维护。
        </span></td>
    </tr>
  </table>
</div>

</body>
</html>
