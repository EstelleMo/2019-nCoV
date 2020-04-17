<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${student.name }欢迎您！</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet" href="../Css/calendar.css">

<link rel="stylesheet" href="../Css/fontawesome-all.min.css">
<link rel="stylesheet" href="../Css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../Css/magnific-popup.css" />
<link rel="stylesheet" type="text/css" href="../slick/slick.css" />
<link rel="stylesheet" type="text/css" href="../slick/slick-theme.css" />
<link rel="stylesheet" href="../Css/menu.css">

</head>
<header class="tou" style="background-color: lightblue">
	<div class="zerogrid">
		<div class="row">
			<div class="col05" style="padding-left: 200px;">
				<div id="logo">
					<a href="${pageContext.request.contextPath }/test"><img
						src="./img/logo.png" /></a>
				</div>
			</div>
			<div class="col06 offset05">
				<div style="padding-top: 2px">
					<ul>
						<c:if test="${!empty student } ">
							<ul style="padding-left: 650px; font-size: 15px;">
								<li style="display: inline"><font size="3"
									style="color: darkgreen">欢迎您</font></li>
								<li style="display: inline; margin-left: 1rem"><font
									size="3" style="color: darkgreen">${student.name}</font></li>
							</ul>
						</c:if>
						<c:if test="${empty student} ">
							<ul style="padding-left: 650px; font-size: 15px;">
								<li style="display: inline"><a
									style="color: darkgreen; size: 3;"> 请登录 </a></li>
							</ul>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
<nav class="hang" style="height: 41px" float="right"></nav>

<%
	int i = 0;
%>
<body>

	<!-- Loader -->
	<!-- <div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div> -->
	<form action="${pageContext.request.contextPath }/user/saveNormal">
		<div id="preload-01" style="color: black">

			基本信息
			<hr color="lightgrey" />
			<font style="color: darkgreen">1.您的姓名</font>
			<div style="margin-bottom: 10px">
				&nbsp;&nbsp;&nbsp;<input type="text" placeholder="${student.name }">
			</div>

			<div style="margin-bottom: 10px">
				<font color="darkgreen">2.班级</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text"
						placeholder="${student.classNo }">
				</div>

			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">3.学号</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" placeholder="${student.no }">
				</div>
			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">4.学院</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly"
						placeholder="${student.college }">
				</div>
			</div>


			<div style="margin-bottom: 10px">
				<font color="red">*</font> <font color="darkgreen">5.户籍</font>
				<div id="nativePlace">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><select class="select" id="province_code"
							name="province_code" οnchange="getCity()">
								<option value="">请选择</option>
						</select> <select class="select" id="city_code" name="city_code"
							οnchange="getArea()">
								<option value="">请选择</option>
						</select> <select class="select" id="area_code" name="area_code">
								<option value="">请选择</option>
						</select></td>
					</tr>
				</div>
			</div>

			<div style="margin-bottom: 10px">
				<font color="red">*</font> <font color="darkgreen">6.家庭住址</font>
				<div class="" id="homeDetAdd">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;</td>
						<td><select class="select" id="province_code"
							name="province_code" οnchange="getCity()">
								<option value="">请选择</option>
						</select> <select class="select" id="city_code" name="city_code"
							οnchange="getArea()">
								<option value="">请选择</option>
						</select> <select class="select" id="area_code" name="area_code">
								<option value="">请选择</option>
						</select></td>

					</tr>
					<input type="text" placeholder="请输入详细地址">
				</div>
			</div>

			<div style="margin-bottom: 10px">
				<font color="red">* </font> <font color="darkgreen"> 7.联系电话 </font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" id="tel"
						placeholder="请输入您的联系方式">
				</div>
			</div>


			<div style="margin-bottom: 10px">
				<font color="red">* </font> <font color="darkgreen"> 8.身份证 </font>
				<div id="idcard">
					&nbsp;&nbsp;&nbsp;<input type="text" id="idcard"
						placeholder="请输入您的身份证">
				</div>
			</div>



		</div>
	</form>


	<div id="preload-02"></div>
	<div id="preload-03"></div>
	<div id="preload-04"></div>

	<script type="text/javascript" src="./Js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./Js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="./Js/jquery.backstretch.min.js"></script>
	<script type="text/javascript" src="./slick/slick.min.js"></script>
	<!-- Slick Carousel -->

	<script type="text/javascript">
		/*加载省下拉选*/
		$(function() {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/area/getProvince",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						$('#province_code').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].aName + "</option>");
					}
				}/* ,
				error : function() {
					alert("加载省失败");
				} */
			});
		});
		/*加载市下拉选*/
		function getCity() {
			var id = $("#province_code").val();
			$("#city_code").empty();
			$("#area_code").empty();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/area/getCity",
				data : {
					"id" : id
				},
				success : function(data) {
					$('#city_code').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					$('#area_code').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					for (var i = 0; i < data.length; i++) {
						$('#city_code').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].aName + "</option>");
					}
				}/* ,
				error : function() {
					alert("加载市失败"); */
				}
			});
		};
		/*加载地区下拉选*/
		function getArea() {
			var id = $("#city_code").val();
			$("#area_code").empty();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/area/getArea",
				data : {
					"id" : id
				},
				success : function(data) {
					$('#area_code').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					for (var i = 0; i < data.length; i++) {
						$('#area_code').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].aName + "</option>");
					}
				}/* ,
				error : function() {
					alert("加载区失败");
				} */
			});
		}
	</script>
</body>
</html>

