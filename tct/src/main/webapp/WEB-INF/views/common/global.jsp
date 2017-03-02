<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<script src="<%=request.getContextPath()%>/assets/js/lib/jquery-3.1.1/jquery-3.1.1.min.js"></script>

<script src="<%=request.getContextPath()%>/assets/js/lib/bootstrap-3.3.7/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/lib/notification-logger/notification-logger.min.js"></script>

<link href="<%=request.getContextPath()%>/assets/css/lib/bootstrap-3.3.7/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/css/lib/font-awesome/font-awesome.min.css" rel="stylesheet">
<script>
    var contextPath = "<%=request.getContextPath()%>";
</script>