<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>	
<html>
<html>
<body>
	<form action="${ctx}/user/login" method="post">
		<h2>Tomcat 集群测试项目！！</h2>
		<p />
		用户名<input id="user_name"></input> <br /> 密码<input id="password"></input>
		<br> <input type="submit" value="登录"></input>
	</form>
</body>
</html>
