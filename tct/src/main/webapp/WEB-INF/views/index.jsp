<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Enumeration" %>
<%@ include file="./common/global.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>ClusterApp Test</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script src="${ctx}/assets/js/login/login.js"></script>
<link rel="stylesheet" href="${ctx}/assets/css/login/login.css">
<style type="text/css">

</style>
<body>
<h4 style="font-family: 'Microsoft YaHei'">这个是什么字体-Microsoft YaHei</h4>
<h4 style="font-family: 'hei'">这个是什么字体-黑体</h4>
<h4 style="font-family: 'KaiTi'">这个是什么字体-楷体</h4>
<h4 style="font-family: 'STFangsong'">这个是什么字体-仿宋</h4>
<img src="<c:url value="/assets/imgs/log.png" />"/>
<br/>
<%
    out.println("Server Info=" + request.getLocalAddr() + " : " + request.getLocalPort() + "<br>");
    out.println("Session ID=" + session.getId() + "<br>");
%>

<%
    String dataName = request.getParameter("dataName");
    if (dataName != null && dataName.length() > 0) {
        String dataValue = request.getParameter("dataValue");
        session.setAttribute(dataName, dataValue);
    }

    Enumeration e = session.getAttributeNames();
    while (e.hasMoreElements()) {
        String name = (String) e.nextElement();
        String value = session.getAttribute(name).toString();
        out.println(name + " = " + value + "<br>");
        System.out.println(name + " = " + value);
    }
%>

<form action="${ctx}/" method="POST">
    名称:<input type=text size=20 name="dataName"> <br/> 值:<input
        type=text size=20 name="dataValue"> <br/> <input
        type=submit text="提交">
</form>
</body>
</html>
