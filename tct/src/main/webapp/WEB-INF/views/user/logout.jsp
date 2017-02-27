<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<html>
<body>
	<form action="${ctx}/user/login" method="post">
		<h2>登录成功</h2>
		<p />
		<%
		    out.println("Server Info=" + request.getLocalAddr() + " : " + request.getLocalPort() + "<br>");
		    out.println("Session ID=" + session.getId() + "<br>");
		%>
	</form>
</body>
</html>
