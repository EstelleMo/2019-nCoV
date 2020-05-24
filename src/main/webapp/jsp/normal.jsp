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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/calendar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/magnific-popup.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/slick/slick-theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/menu.css">

</head>
<body>

	<font style="color: #003366" size="10"><b>基本信息</b></font>
	<hr color="lightgrey" />

	<form action="${pageContext.request.contextPath }/user/saveNormal">
		<div id="preload-01" style="color: black">
			<font style="color: darkgreen">1.您的姓名</font>

			<div style="margin-bottom: 10px">
				&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly"
					value="${student.name }" id="name">
			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">2.性别</font> <input type="radio"
					name="gender" id="gender"
					<c:if test="${student.gender== '男'}">checked="checked"</c:if>>男
				<input type="radio" name="gender" id="gender"
					<c:if test="${student.gender== '女'}">checked="checked"</c:if>>女
			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">3.班级</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" value="${student.classNo }"
						id="classNo" readonly="readonly">
				</div>

			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">4.学号</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" value="${student.no }" id="no"
						readonly="readonly">
				</div>
			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">5.学院</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly"
						id="college" value="${student.college }">
				</div>
			</div>

			<div style="margin-bottom: 10px">
				<font color="red">*</font> <font color="darkgreen">6.户籍</font>
				<c:if test="${!empty student.nativePlace }">
					<div id="nativePlace">
						<select class="select" id="province_code1" name="province_code1"
							οnchange="getCity()">
							<option value="">${student.nativeProvince }</option>
						</select> <select class="select" id="city_code1" name="city_code1"
							οnchange="getArea()">
							<option value="">${student.nativeCity }</option>
						</select> <select class="select" id="area_code1" name="area_code1">
							<option value="">${student.nativeArea }</option>
						</select>
					</div>
				</c:if>
				<c:if test="${empty student.nativePlace }">
					<div id="nativePlace">
						<select class="select" id="province_code1" name="province_code1"
							οnchange="getCity()">
							<option value="">请选择</option>
						</select> <select class="select" id="city_code1" name="city_code1"
							οnchange="getArea()">
							<option value="">请选择</option>
						</select> <select class="select" id="area_code1" name="area_code1">
							<option value="">请选择</option>
						</select>
					</div>
				</c:if>
			</div>

			<div style="margin-bottom: 10px">
				<font color="red">*</font> <font color="darkgreen">7.家庭住址</font>
				<c:if test="${!empty student.homeDetAdd }">
				<div class="" id="homeDetAdd">
					<select class="select" id="province_code2" name="province_code2"
						οnchange="getCity()">
						<option value="">${student.homeProvince }</option>
					</select> <select class="select" id="city_code2" name="city_code2"
						οnchange="getArea()">
						<option value="">${student.homeCity }</option>
					</select> <select class="select" id="area_code2" name="area_code2">
						<option value="">${student.homeArea}</option>
					</select> <input type="text" placeholder="请输入详细地址">
				</div>
				</c:if>
				<c:if test="${empty student.homeDetAdd }">
				<div class="" id="homeDetAdd">
					<select class="select" id="province_code2" name="province_code2"
						οnchange="getCity()">
						<option value="">请选择</option>
					</select> <select class="select" id="city_code2" name="city_code2"
						οnchange="getArea()">
						<option value="">请选择</option>
					</select> <select class="select" id="area_code2" name="area_code2">
						<option value="">请选择</option>
					</select> <input type="text" placeholder="请输入详细地址">
				</div>
				</c:if>
			</div>

			<div style="margin-bottom: 10px">
				<font color="red">* </font> <font color="darkgreen"> 8.联系电话 </font>
				<c:if test="${empty student.tel }">
					<div>
						&nbsp;&nbsp;&nbsp;<input type="text" id="tel" name="tel"
							placeholder="请输入您的联系方式">
					</div>
				</c:if>
				<c:if test="${!empty student.tel }">
					<div>
						&nbsp;&nbsp;&nbsp;<input type="text" id="tel" name="tel"
							value="${student.tel }">
					</div>
				</c:if>
			</div>


			<div style="margin-bottom: 10px">
				<font color="red">* </font> <font color="darkgreen"> 9.身份证 </font>
				<c:if test="${empty student.idcard }">
					<div id="idcard">
						&nbsp;&nbsp;&nbsp;<input type="text" id="idcard" name="idcard"
							placeholder="请输入您的身份证">
					</div>
				</c:if>
				<c:if test="${!empty student.idcard }">
					<div id="idcard">
						&nbsp;&nbsp;&nbsp;<input type="text" id="idcard" name="idcard"
							value="${student.idcard }">
					</div>
				</c:if>

			</div>
		</div>

		<input type="submit" style="color: darkgreen" value="提交">
	</form>

	<script rel="stylesheet"
		src="${pageContext.request.contextPath }/js/jquery.min2.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/slick/slick.min.js"></script>

	<script type="text/javascript">
		/*加载省下拉选*/
		$(function() {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/area/getProvince",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						$('#province_code1').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].regionName + "</option>");
						$('#province_code2').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].regionName + "</option>");
					}
				},
				error : function() {
					alert("加载省失败");
				}
			});
		});
		/*加载市下拉选*/
		province_code1.onchange = function getCity() {
			console.log("加载市")
			var id = $("#province_code1").val();
			$("#city_code1").empty();
			$("#area_code1").empty();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/area/getCity",
				data : {
					"id" : id
				},
				success : function(data) {
					$('#city_code1').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					$('#area_code1').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					for (var i = 0; i < data.length; i++) {
						$('#city_code1').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].regionName + "</option>");
					}
				},
				error : function() {
					alert("加载市失败");
				}
			});
		};
		province_code2.onchange = function getCity() {
			var id = $("#province_code2").val();
			$("#city_code2").empty();
			$("#area_code2").empty();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/area/getCity",
				data : {
					"id" : id
				},
				success : function(data) {
					$('#city_code2').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					$('#area_code2').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					for (var i = 0; i < data.length; i++) {
						$('#city_code2').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].regionName + "</option>");
					}
				},
				error : function() {
					alert("加载市失败");
				}
			});
		};
		/*加载地区下拉选*/
		city_code1.onchange = function getArea() {
			var id = $("#city_code1").val();
			$("#area_code1").empty();
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/area/getArea",
				data : {
					"id" : id
				},
				success : function(data) {
					$('#area_code1').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					for (var i = 0; i < data.length; i++) {
						$('#area_code1').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].regionName + "</option>");
					}
				},
				error : function() {
					alert("加载区失败");
				}
			});
			city_code2.onchange = function getArea() {
				var id = $("#city_code2").val();
				$("#area_code2").empty();
				$
						.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/area/getArea",
							data : {
								"id" : id
							},
							success : function(data) {
								$('#area_code2').append(
										"<option value='' selected='selected' >"
												+ '请选择' + "</option>");
								for (var i = 0; i < data.length; i++) {
									$('#area_code2').append(
											"<option value='" + data[i].id + "' >"
													+ data[i].regionName
													+ "</option>");
								}
							},
							error : function() {
								alert("加载区失败");
							}
						});
			}
		}
	</script>
</body>
</html>

