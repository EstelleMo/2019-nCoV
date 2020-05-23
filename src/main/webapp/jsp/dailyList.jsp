<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>客户列表</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/style.css"
	type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css"
	type=text/css rel=stylesheet>
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="./js/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="./slick/slick.min.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>

<SCRIPT language=javascript>
	function to_page(page) {
		if (page) {
			$("#page").val(page);
		}
		document.customerForm.submit();

	}
</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>

	<font style="color: white; size: 10"> <b>健康打卡记录</b>
	</font>


	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/user/dailyList"
		method=post>

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="./images/new_019.jpg" border=0></TD>
					<TD width="100%" background="./images/new_020.jpg" height=20></TD>
					<TD width=15><IMG src="./images/new_021.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=./images/new_022.jpg><IMG
						src="./images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR>
													<TD>按时间查询：</TD>
													<TD><INPUT type="date" id=sChannel2
														style="WIDTH: 80px" maxLength=50 name="subDate"
														value="subDate"></TD>

													<TD><INPUT class=button id=sButton2 type=submit
														value=" 筛选 " name=sButton2></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<TR>
									<TD>
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD>所属学院</TD>
													<TD>学生姓名</TD>
													<TD>填报日期</TD>
													<TD>操作</TD>
												</TR>
												<c:forEach items="${dailyList }" var="item">
													<TR
														style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD>${item.college }</TD>
														<TD>${item.name }</TD>
														<TD id="tdd">${item.subDate }</TD>
														<TD><a
															href="${pageContext.request.contextPath }/user/updateList ">修改</a>
															/ <a id="checkDetail" onclick="checkDetail(this)"> 查看
														</a></TD>
													</TR>

												</c:forEach>

											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<TR>
									<TD><SPAN id=pagelink> </SPAN></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="./images/new_023.jpg"><IMG
						src="./images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="./images/new_024.jpg" border=0></TD>
					<TD align=middle width="100%" background="./images/new_025.jpg"
						height=15></TD>
					<TD width=15><IMG src="./images/new_026.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
<script type="text/javascript">
	checkDetail.onclick = function checkDetail(val) {

		var subDate = document.getElementById('tdd').innerHTML;
		console.log(subDate);
		$
				.ajax({
					type : "get",
					url : "${pageContext.request.contextPath }/checkList",
					data : {
						subDate : subDate
					},
					success : function(data) {
						alert("跳转成功")
						window.location.href = "http://localhost:8080/2019-nCoV/dailyHistory";
					}

				});
	}
</script>


</HTML>
