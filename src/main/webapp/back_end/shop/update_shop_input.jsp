<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>

<% 
   // 從 ProTypeServlet 取得存入 req 的 proTypeVO 物件
   ProTypeVO proTypeVO = (ProTypeVO) request.getAttribute("proTypeVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>商品類別修改 - update_shop_input.jsp</title>

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
    width: 450px;
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
    <tr><td>
         <h3>商品類別修改 - update_shop_input.jsp</h3>
         <h4><a href="<%=request.getContextPath()%>/back_end/shop/select_page.jsp">
             <img src=<%=request.getContextPath()%>/resources/images/back.png" width="100" height="32" border="0">回首頁</a>
         </h4>
    </td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤訊息表列 --%>
<c:if test="${not empty errorMsgs}">
    <font style="color:red">請修正以下錯誤:</font>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/proType/proType.do" name="form1">
<table>
    <tr>
        <td>商品類別編號:<font color=red><b>*</b></font></td>
        <td><%=proTypeVO.getProTypeId()%></td>
    </tr>
    <tr>
        <td>商品類別名稱:</td>
        <td>
            <input type="TEXT" name="proTypeName" value="<%=proTypeVO.getProTypeName()%>" size="45"/>
        </td>
    </tr>
</table>

<br>
<%-- 送出修改時需要的隱藏參數 --%>
<input type="hidden" name="action" value="update">
<input type="hidden" name="proTypeId" value="<%=proTypeVO.getProTypeId()%>">
<input type="submit" value="送出修改">
</FORM>

</body>
</html>