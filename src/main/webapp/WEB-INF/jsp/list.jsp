<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>客户列表</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/Css/Style.css"
	type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/Css/Manage.css"
	type=text/css rel=stylesheet>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Js/jquery-1.11.0.min.js"></script>
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

	<font color="darkblue" size="5">
	<b>健康打卡记录</b>
	</font>


	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/user/dailyList"
		method=post>

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="./Images/new_019.jpg" border=0></TD>
					<TD width="100%" background="./Images/new_020.jpg" height=20></TD>
					<TD width=15><IMG src="./Images/new_021.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=./Images/new_022.jpg><IMG
						src="./Images/new_022.jpg" border=0></TD>
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
													<TD>填报日期</TD>
													<TD>填报状态</TD>
													<TD>操作</TD>
													<!-- <TD>所属行业</TD>
													<TD>电话</TD>
													<TD>手机</TD>
													<TD>操作</TD> -->
												</TR>
												<c:forEach items="${list }" var="list">
													<TR
														style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD>${list.subDate }</TD>
														<TD>${list.msgState }</TD>
														<TD><a
															href="${pageContext.request.contextPath }/user/updateList ">修改</a>
															/ <a href="${pageContext.request.contextPath }/checkList">
																查看 </a></TD>
													</TR>



												</c:forEach>



												<c:forEach items="${pageBean.list }" var="student">
													<TR
														style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD>${student.name }</TD>
														<TD>${customer.cust_level.dict_item_name }</TD>
														<TD>${customer.cust_source.dict_item_name }</TD>
														<TD>${customer.cust_industry.dict_item_name }</TD>
														<TD>${customer.cust_phone }</TD>
														<TD>${customer.cust_mobile }</TD>
														<TD><a
															href="${pageContext.request.contextPath }/user/updateList">修改</a>
															<%-- &nbsp;&nbsp; <a
															href="${pageContext.request.contextPath }/customerServlet?method=delete&cust_id=${customer.cust_id}">删除</a> --%>
														</TD>
													</TR>

												</c:forEach>

											</TBODY>
										</TABLE>
									</TD>
								</TR>

								<TR>
									<TD><SPAN id=pagelink> <%-- <DIV
												style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B>${pageBean.totalCount}</B>]条记录,[<B>${pageBean.totalPage}</B>]页
												,每页显示 <select name="pageSize">

													<option value="3">3</option>
													<option value="5">5</option>
												</select> 条 [<A href="javascript:to_page(${PageBean.currentPage-1})">前一页</A>]
												<B>${pageBean.currentPage}</B> [<A
													href="javascript:to_page(${PageBean.currentPage+1})">后一页</A>]
												到 <input type="text" size="3" id="page" name="page"
													value="${pageBean.currentPage }" /> 页 <input type="button"
													value="Go" onclick="to_page()" />
											</DIV> --%>
									</SPAN></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="./Images/new_023.jpg"><IMG
						src="./Images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="./Images/new_024.jpg" border=0></TD>
					<TD align=middle width="100%" background="./Images/new_025.jpg"
						height=15></TD>
					<TD width=15><IMG src="./Images/new_026.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
