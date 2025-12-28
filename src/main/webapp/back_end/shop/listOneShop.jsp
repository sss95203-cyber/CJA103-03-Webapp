<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.*"%>
<%-- 此頁練習採用 Script 的寫法取值 --%>

<%
// 從 ProTypeServlet.java 取得存入 req 的 proTypeVO 物件
ProTypeVO proTypeVO = (ProTypeVO) request.getAttribute("proTypeVO");
%>

<html>
<head>
<title>商品類別資料 - listOneShop.jsp</title>

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

	<h4>此頁採用 Script 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>商品類別資料 - listOneShop.jsp</h3>
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
		</tr>
		<tr>
			<td><%=proTypeVO.getProTypeId()%></td>
			<td><%=proTypeVO.getProTypeName()%></td>
		</tr>
	</table>

</body>
</html>