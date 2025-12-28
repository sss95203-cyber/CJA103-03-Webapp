<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>二手商品類別管理: Home</title>

<style>
table#table-1 {
	width: 500px;
	background-color: lightyellow;
	margin: 40px auto;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

.container {
	width: 500px;
	margin: 40px auto;
	font-family: "Segoe UI", "Microsoft JhengHei", sans-serif;
	background: #lightblue;
}

.card {
	background: #lightblue;
	padding: 20px 30px;
	margin-bottom: 25px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>二手商品類別管理: Home</h3>
				<h4>( Shop Manager )</h4></td>
		</tr>
	</table>

	<div class="container">
		<div class="card">
			<h3>資料查詢:</h3>

			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>

			<ul>
				<%-- 1. 查詢全部 --%>
				<li><a
					href='<%=request.getContextPath()%>/back_end/shop/listAllShop.jsp'>列出所有商品類別</a><br>
					<br></li>

				<%-- 2. 手動輸入 ID 查詢 --%>
				<li>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/proType/proType.do">
						<b>輸入商品類別編號 (如 1):</b> <input type="text" name="proTypeId">
						<input type="hidden" name="action" value="getOne_For_Display">
						<input type="submit" value="送出">
					</FORM>
				</li>

				<%-- 實例化 Service 供下拉選單使用 --%>
				<jsp:useBean id="proTypeSvc" scope="page"
					class="com.shop.model.ProTypeService" />

				<%-- 3. 下拉選單選擇 ID --%>
				<li>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/proType/proType.do">
						<b>選擇商品類別編號:</b> <select size="1" name="proTypeId">
							<c:forEach var="proTypeVO" items="${proTypeSvc.all}">
								<option value="${proTypeVO.proTypeId}">${proTypeVO.proTypeId}
							</c:forEach>
						</select> <input type="hidden" name="action" value="getOne_For_Display">
						<input type="submit" value="送出">
					</FORM>
				</li>

				<%-- 4. 下拉選單選擇名稱 --%>
				<li>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/proType/proType.do">
						<b>選擇商品類別名稱:</b> <select size="1" name="proTypeId">
							<c:forEach var="proTypeVO" items="${proTypeSvc.all}">
								<option value="${proTypeVO.proTypeId}">${proTypeVO.proTypeName}
							</c:forEach>
						</select> <input type="hidden" name="action" value="getOne_For_Display">
						<input type="submit" value="送出">
					</FORM>
				</li>
			</ul>
		</div>

		<h3>類別管理</h3>

		<ul>
			<li><a href='addShop.jsp'>新增商品類別</a></li>
		</ul>
	</div>
</body>
</html>