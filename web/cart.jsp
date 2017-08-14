<%@ page import="java.util.Calendar" %>
<%@ page import="entity.Cart" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="entity.Items" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: cjx
  Date: 2017/8/13
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的购物车</title>
</head>
<body>
    <h1>购物车详情</h1><hr>
    <a href="<%= request.getContextPath()%>/index.jsp">首页</a>>>商品详情

    <table>

    <%
//        获取购物车信息
        Cart mycart = (Cart) request.getSession().getAttribute("usercart");

        HashMap<Items,Integer> mygoods = mycart.getGoods();



        if(mycart != null){

            /**
             * 遍历mygoods实现获得其商品信息
             */
            Iterator iterator = mygoods.entrySet().iterator();
            while (iterator.hasNext()){

                Map.Entry entry = (Map.Entry) iterator.next();
                Items items = (Items) entry.getKey();

                int number = (int) entry.getValue();

    %>

        <tr>

            <td>
                <dl>
                    <dt><img src="<%= request.getContextPath()%>/images/<%=items.getItem_url()%>" width="120" height="90"></dt>
                    <dd><%= items.getItem_name()%></dd>
                </dl>
            </td>
            <td>单价：<%= items.getItem_price()%>，数量：<%= number%></td>
            <td>总价：<%= items.getItem_price() * number%></td>
            <td><a href="<%= request.getContextPath()%>/servlet/CartServlet?id=<%= items.getItem_id()%>&action=remove">删除</a></td>
        </tr>

    <%
            }
        }

    %>
    <tr>
        <td>总金额：<%= mycart.getTotalPrice()%>元</td>
    </tr>
    </table>
</body>
</html>
