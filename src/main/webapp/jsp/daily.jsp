<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
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
	href="${pageContext.request.contextPath }/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/magnific-popup.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/slick/slick-theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/menu.css">

<style typte="text/css">
#tt: {
	COLOR: #003366;
	FONT-FAMILY: Verdana
}
</style>

</head>



<body>
	<div>
		<font style="color: #003366" size="10"><b>${student.name }的健康打卡</b></font>
	</div>
	<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(d);
	%>
	<br>
	<b id="tt" style="color: #003366" size="5">当前时间：</b>
	<div id="time1" style="color: #003366" size="5">
		<script type="text/javascript">
				
				setInterval("document.getElementById('time1').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
				</script>
	</div>
	<table id='mycalendar' class='calendar'></table>
	<script type="text/javascript">
	$('#mydatepicker').dcalendarpicker(); //初始化日期选择器
	$('#mycalendar').dcalendar(); //初始化日历      
	$('#mydatepicker').dcalendarpicker({format: 'yyyy-mm-dd'});                   
	$('#mydatepicker').dcalendarpicker({format: 'yyyy-mm-dd'});
	</script>

	<div style="margin-bottom: 10px; margin-top: 10px">

		<c:if test="${!empty fpageBean }">
			<c:forEach items="${fpageBean.list }" var="family">
				<form style="float: left;"
					action="${pageContext.request.contextPath }/showFamily">
					<input type="submit" width="100" value="${family.name }" border="0"
						style="background: url('./images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
				</form>
			</c:forEach>
		</c:if>

		<form style="float: left;"
			action="${pageContext.request.contextPath }/addFamily">
			<input type="submit" width="100" value="添加家庭成员" border="0"
				style="background: url('./images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
		</form>
	</div>
	<br>
	<br>
	<hr color="lightgrey" />
	<form action="${pageContext.request.contextPath }/user/saveDaily">
		<div id="preload-01" style="color: black">

			<font color="red">*</font> <font id="healtycode"
				style="color: darkgreen"><b>1.健康码</b></font>
			<div style="margin-bottom: 10px">
				<input type="radio" name="healthyCode" value="红码">红码<br>
				<input type="radio" name="healthyCode" value="黄码">黄码 <br>
				<input type="radio" name="healthyCode" value="绿码">绿码
			</div>

			<div style="margin-bottom: 10px">
				<font color="red">*</font> <font id="tt" style="color: darkgreen"><b>2.今日体温</b></font>
				<div>
					<font color="darkgreen">上午体温</font>&nbsp;&nbsp;&nbsp;<input
						type="text" id="amTw" style="width: 50px">℃
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="darkgreen">下午体温</font>&nbsp;&nbsp;&nbsp;<input
						type="text" id="pmTw" style="width: 50px">℃
				</div>
			</div>

			<div style="margin-bottom: 10px">
				<font color="red">*</font> <font id="tt" color="darkgreen"><b>3.当前所在地</b></font>
				<div id="currAdd">
					<select class="select" id="province_code" name="province_code"
						οnchange="getCity()">
						<option value="">请选择</option>
					</select> <select class="select" id="city_code" name="city_code"
						οnchange="getArea()">
						<option value="">请选择</option>
					</select> <select class="select" id="area_code" name="area_code">
						<option value="">请选择</option>
					</select>
					<textarea rows="1" cols="" placeholder="请输入详细地址"></textarea>
				</div>
			</div>
		</div>
		<div style="margin-bottom: 10px">
			<font color="red">*</font> <font id="tt" color="darkgreen"><b>4.填报当日是否在校</b></font>
			<div>
				<input type="radio" name="isInSch" value="是">是 <input
					type="radio" name="isInSch" value="否">否
			</div>
		</div>
		<div style="margin-bottom: 30px">
			<font color="red">*</font> <font color="darkgreen"
				style="margin-bottom: 10px"><b>5.目前健康状况</b></font>
			<div>
				<input type="radio" name="healthyStu" value="健康">健康 <br>
				<input type="radio" name="healthyStu" value="感冒">感冒<br>
				<input type="radio" name="healthyStu" value="咳嗽">咳嗽<br>
				<input type="radio" name="healthyStu" value="乏力">乏力<br>
				<input type="radio" name="healthyStu" value="呼吸困难">呼吸困难<br>
				<input type="radio" name="healthyStu" value="腹泻">腹泻<br>
				其他
				<textarea rows="1" cols=""></textarea>

			</div>
		</div>

		<div style="margin-bottom: 10px">
			<font color="red">*</font> <font color="darkgreen"><b>6.是否咳嗽、发烧</b></font>
			&nbsp;&nbsp;&nbsp;
			<div class="" id="isIll">
				<input type="radio" name="isIll" value="咳嗽">咳嗽<br> <input
					type="radio" name="isIll" value="发烧">发烧<br> <input
					type="radio" name="isIll" value="咳嗽或发烧">咳嗽或发烧 <br>其他症状：
				<textarea name="otherIll" rows="" cols=""></textarea>
			</div>
		</div>

		<div style="margin-bottom: 10px">
			<font color="red">* </font> <font color="darkgreen"> <b>7.是否新冠肺炎确诊病例</b>
			</font>
			<div>
				&nbsp;&nbsp;&nbsp;<input type="radio" id="isNcov" name="isNcov"
					value="是">是 <input type="radio" id="isNcov" name="isNcov"
					value="否">否
			</div>
		</div>

		<div style="margin-bottom: 10px">
			<font color="red">* </font> <font color="darkgreen"> <b>8.是否感染新冠肺炎后已治愈
			</b></font> &nbsp;&nbsp;&nbsp;
			<div>
				<input type="radio" id="isCure" name="isCure" value="是">是<br>
				<input type="radio" id="isCure" name="isCure" value="否">否
			</div>
		</div>

		<div style="margin-bottom: 10px">
			<font color="red">* </font> <font color="darkgreen"> <b>9.是否新冠肺炎疑似病例</b>
			</font> &nbsp;&nbsp;&nbsp;
			<div id="idcard">
				<input type="radio" id="isAspect" name="isAspect" value="是">是<br>
				<input type="radio" name="isAspect" value="否">否
			</div>
		</div>
		<div style="margin-bottom: 10px">
			<font color="darkgreen"><b>10.今日的公共交通出行情况</b></font>
			<div id="idcard">
				&nbsp;&nbsp;&nbsp;
				<textarea name="todayTool" id="todayTriffTools" rows="" cols=""></textarea>
			</div>
		</div>
		<div style="margin-bottom: 10px">
			<font color="darkgreen"><b>11.近14日的公共交通工具</b></font>
			<div id="idcard">
				&nbsp;&nbsp;&nbsp;
				<textarea rows="" cols="" name="twoWeeksTriffTool"
					id="twoWeeksTriffTool"></textarea>
			</div>
		</div>
		<input type="submit" value="提交" style="color: darkgreen; size: 5">
	</form>


	<div id="preload-02"></div>
	<div id="preload-03"></div>
	<div id="preload-04"></div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.backstretch.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/slick/slick.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dcalendar.picker.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dcalendar.picker.js"></script>


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
				} ,
				error : function() {
					alert("加载省失败");
				} 
			});
		});
		/*加载市下拉选*/
	province_code.onchange=	function getCity() {
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
										+ data[i].regionName + "</option>");
					}
				} ,
				error : function() {
					alert("加载市失败");
				}
			});
		};
		/*加载地区下拉选*/
		city_code.onchange=function getArea() {
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

