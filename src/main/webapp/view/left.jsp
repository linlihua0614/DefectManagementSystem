<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
  <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/leftpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript">
    $(".leftsidebar_box dt").css({"background-color":"#00BFFF"});
    $(".leftsidebar_box dt img").attr("src","/img/left/select_xl01.png");
    $(function(){
      $(".leftsidebar_box dd").hide();
      $(".leftsidebar_box dt").click(function(){
        $(".leftsidebar_box dt").css({"background-color":"#00BFFF"})
        $(this).css({"background-color": "#87CEEB"});
        $(this).parent().find('dd').removeClass("menu_chioce");
        $(".leftsidebar_box dt img").attr("src","/img/left/select_xl01.png");
        $(this).parent().find('img').attr("src","/img/left/select_xl.png");
        $(".menu_chioce").slideUp();
        $(this).parent().find('dd').slideToggle();
        $(this).parent().find('dd').addClass("menu_chioce");
      });
    })
  </script>
</head>

<body id="bg">
<div class="container">

  <div class="leftsidebar_box">

    <c:if test="${sessionScope.USER_SESSION.role eq 0}">
      <dl class="custom">
        <a target="right" href="${pageContext.request.contextPath}/user/list"><dt>用户管理<img src="/img/left/select_xl01.png"></dt></a>
      </dl>
    </c:if>

    <c:if test="${sessionScope.USER_SESSION.role eq 0}">
      <dl class="app">
        <a target="right" href="${pageContext.request.contextPath}/project/list"><dt>项目管理<img src="/img/left/select_xl01.png"></dt></a>
      </dl>
    </c:if>

    <dl class="channel">
      <a target="right" href="${pageContext.request.contextPath}/defect/list"><dt>缺陷管理<img src="/img/left/select_xl01.png"></dt></a>
    </dl>

  <c:if test="${sessionScope.USER_SESSION.role eq 0 || sessionScope.USER_SESSION.role eq 3 || sessionScope.USER_SESSION.role eq 9}">
    <dl class="statistics">
      <a target="right" href="${pageContext.request.contextPath}/statis/getSeriousnessInit"><dt>严重性统计<img src="/img/left/select_xl01.png"></dt></a>
    </dl>
    <dl class="statistics">
      <a target="right" href="${pageContext.request.contextPath}/statis/getPriorityInit"><dt>优先级统计<img src="/img/left/select_xl01.png"></dt></a>
    </dl>
  </c:if>

  </div>

</div>
</body>
</html>
