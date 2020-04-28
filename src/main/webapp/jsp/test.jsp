<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${!empty student }"><title>${student.name } 欢迎您！</title></c:if>
<c:if test="${empty student }"><title>新冠肺炎疫情防控系统欢迎您！</title></c:if>
</head>

<FRAMESET frameSpacing=0 rows=80,* frameBorder=0>
	<FRAME name=top src="${pageContext.request.contextPath }/top" frameBorder=0 noResize scrolling=no>
	<FRAMESET frameSpacing=0 frameBorder=0 cols=220,*>
		<FRAME name=menu src="${pageContext.request.contextPath }/menu" frameBorder=0 noResize>
		<FRAME name=main src="${pageContext.request.contextPath }/welcome" frameBorder=0>
	</FRAMESET>
	<NOFRAMES>
		<p>This page requires frames, but your browser does not support
			them.</p>
	</NOFRAMES>
</FRAMESET>


<body>

</body>
</html>