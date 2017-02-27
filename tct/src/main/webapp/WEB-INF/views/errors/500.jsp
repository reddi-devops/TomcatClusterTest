<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
</head>
<body>
	<h1>错误500展示</h1>

	<ul>
		<li>Exception: <c:out
				value="${requestScope['javax.servlet.error.exception']}" /></li>
		<li>Exception type: <c:out
				value="${requestScope['javax.servlet.error.exception_type']}" /></li>
		<li>Exception message: <c:out
				value="${requestScope['javax.servlet.error.message']}" /></li>
		<li>Request URI: <c:out
				value="${requestScope['javax.servlet.error.request_uri']}" /></li>
		<li>Servlet name: <c:out
				value="${requestScope['javax.servlet.error.servlet_name']}" /></li>
		<li>Status code: <c:out
				value="${requestScope['javax.servlet.error.status_code']}" /></li>
	</ul>

</body>
</html>