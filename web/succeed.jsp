<%@ page import="java.util.Calendar" %>
<%@ page import="entity.Cart" %>
<%@ page import="dao.ItemsDAO" %>
<%@ page import="entity.Items" %><%--
  Created by IntelliJ IDEA.
  User: cjx
  Date: 2017/8/13
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品成功</title>
</head>
<body>
    <%
        ItemsDAO itemsDAO = new ItemsDAO();
        String id = request.getParameter("id");
        int num = Integer.parseInt(request.getParameter("num"));
        Items items = itemsDAO.getItemsById(Integer.parseInt(id));
    %>
    <h2>成功购买<%= items.getItem_name()%>,数量：<%= num%></h2>
</body>
</html>
