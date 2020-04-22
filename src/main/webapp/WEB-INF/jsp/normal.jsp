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
				<input type="radio" name="sex" id="gender"
					<c:if test="${student.gender== '女'}">checked="checked"</c:if>>女
			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">3.班级</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" value="${student.classNo }"
					id="classNo"	readonly="readonly">
				</div>

			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">4.学号</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" value="${student.no }"
					 id="no"	readonly="readonly">
				</div>
			</div>
			<div style="margin-bottom: 10px">
				<font color="darkgreen">5.学院</font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly"
					id="college"	value="${student.college }">
				</div>
			</div>


			<div style="margin-bottom: 10px">
				<font color="red">*</font> <font color="darkgreen">6.户籍</font>
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
				<font color="red">*</font> <font color="darkgreen">7.家庭住址</font>
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
				<font color="red">* </font> <font color="darkgreen"> 8.联系电话 </font>
				<div>
					&nbsp;&nbsp;&nbsp;<input type="text" id="tel"
						placeholder="请输入您的联系方式">
				</div>
			</div>


			<div style="margin-bottom: 10px">
				<font color="red">* </font> <font color="darkgreen"> 9.身份证 </font>
				<div id="idcard">
					&nbsp;&nbsp;&nbsp;<input type="text" id="idcard"
						placeholder="请输入您的身份证">
				</div>
			</div>
		</div>
		
		<input type="submit" style="color: darkgreen" value="提交">
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
										+ data[i].regionName + "</option>");
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
								"<option value='" + data[i].id +"' >"
										+ data[i].regionName + "</option>");
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
										+ data[i].regionName + "</option>");
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

