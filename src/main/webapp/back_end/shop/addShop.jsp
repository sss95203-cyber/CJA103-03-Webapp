<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>

<%
// 取得 Servlet 傳回來的 VO 物件（當輸入格式錯誤時，用來保留使用者剛才輸入的內容）
ProTypeVO proTypeVO = (ProTypeVO) request.getAttribute("proTypeVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>二手商城_商品類別新增</title>

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

h5 {
	color: gray;
	display: inline;
}

table {
	width: 500px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 5px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>二手商城_商品類別新增</h3></td>
			<td>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back_end/shop/select_page.jsp">
						<img src="<%=request.getContextPath()%>/resources/images/back.png"
						width="100" height="100" border="0">回首頁
					</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤訊息列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/proType/proType.do" name="form1">
		<table>
			<tr>
				<td><h5>下方請輸入要新增內容</h5></td>
				<tr>
				<td>商品類別名稱:</td>
				<td><input type="TEXT" name="proTypeName"
					value="<%=(proTypeVO == null) ? "" : proTypeVO.getProTypeName()%>"
					size="45" /></td>
			</tr>
		</table>

		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>

</body>
</html>