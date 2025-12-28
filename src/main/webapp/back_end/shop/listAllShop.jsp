<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>
<%-- 此頁採用 EL 的寫法取值 --%>

<%
ProTypeService proTypeSvc = new ProTypeService();
List<ProTypeVO> list = proTypeSvc.getAll();
pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有商品類別資料 - listAllShop.jsp</title>

<style>
table#table-1 {
	background-color: lightyellow;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}

table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<h4>此頁採用 EL 寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>所有商品類別資料 - listAllShop.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back_end/shop/select_page.jsp">
						<img
						src="<%=request.getContextPath()%>/resources/images/back.png"
						width="100" height="32" border="0">回首頁
					</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>商品類別編號</th>
			<th>商品類別名稱</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>

		<%-- 如果您有 page1.file 分頁檔，請保留；若無則可移除 --%>
		<%@ include file="page1.file"%>

		<c:forEach var="proTypeVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${proTypeVO.proTypeId}</td>
				<td>${proTypeVO.proTypeName}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/proType/proType.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="proTypeId" value="${proTypeVO.proTypeId}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/proType/proType.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="proTypeId" value="${proTypeVO.proTypeId}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>

	<%-- 如果有 page2.file 分頁檔請保留 --%>
	<%@ include file="page2.file"%>

</body>
</html>