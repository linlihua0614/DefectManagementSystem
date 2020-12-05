<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<frameset rows="15%,*,5%" border="1"  framespacing="1" bordercolor="#FFFFFF">
  <frame name="top" scrolling="no" frameborder="0" noresize="noresize" src="/view/top.jsp" /><--拥有15%的高度-->
  <frameset cols="160,*" border="0"><--拥有80%的高度-->
    <frame name="left" scrolling="no" frameborder="0" noresize="noresize" src="/view/left.jsp"><--拥有25%的宽度-->
    <frame name="right" scrolling="auto" frameborder="0" noresize="noresize" src="/view/comment.jsp"><--拥有75%的宽度-->
  </frameset>
  <frame name="bottom" scrolling="no" frameborder="0" noresize="noresize" src="/view/bottom.jsp" /><--拥有5%的高度-->
</frameset>
<noframes>
  <body>
  </body>
</noframes>
</html>
