<%@ page import="dao.ItemsDAO" %>
<%@ page import="entity.Items" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: cjx
  Date: 2017/8/8
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详细信息</title>
    <style type="text/css">
        #sub, #add{
            cursor: pointer;
        }
    </style>


    <%--下面两个是js弹窗插件--%>
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>

    <script type="text/javascript">
        <%--购买数量文本框数量减一函数--%>
        function sub() {
            var num = document.getElementById("purchaseNo").value;
            if(num >= 1){
                document.getElementById("purchaseNo").value = -- num;
            }
        }

        <%--购买数量文本框数量加一函数--%>
        function add() {
            var num = document.getElementById("purchaseNo").value;
            if(num <= 98){
                document.getElementById("purchaseNo").value = ++ num;
            }
        }

        <%--检查购买数量文本框数量是否大于99，如果是，置为99;小于0则置为0--%>
        function numCheck() {
            var num = document.getElementById("purchaseNo").value;
            if(num > 99){
                document.getElementById("purchaseNo").value = 99;
            }else if(num < 0){
                document.getElementById("purchaseNo").value = 0;
            }
        }


        function selflog_show(id) {
            var num = document.getElementById("purchaseNo").value;

            <%--window.location.href = "<%= request.getContextPath()%>/servlet/CartServlet?id="+id+'&num='+num+'&action=add';--%>
            <%--使用js弹窗插件传递参数    TODO 弹窗有 问题--%>
            J.dialog.get({id: 'jAddToCart',title: '加入购物成功',width: 400,height:200,
                content:'成功加入购购物车',
                link: '<%= request.getContextPath()%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add',
                cover:true});
        }
    </script>

</head>
<body>

    <h1>商品详情</h1>
    <a href="index.jsp">首页</a>>>商品详情
    <%
        ItemsDAO itemsDAO = new ItemsDAO();
        Items items = itemsDAO.getItemsById(Integer.parseInt(request.getParameter("id")));
    %>
    <table>
        <tr>
            <td><img src="images/<%= items.getItem_url()%>" width="200" height="160"></td>
        </tr>
        <tr>
            <td><%= items.getItem_name()%></td>
        </tr>
        <tr>
            <td>价格：<%= items.getItem_price()%></td>
        </tr>
        <tr>
            <td>产地：<%= items.getItem_place()%></td>
        </tr>
        <tr>
            <td>购买数量：<span id="sub" onclick="sub();">-</span>
                <input id="purchaseNo" name="purchaseNo" value="1" size="1" onblur="numCheck();">
                <span id="add" onclick="add();">+</span>
            </td>
        </tr>
    </table>

    <div>

        <a href="javascript:selflog_show(<%= items.getItem_id()%>)"><img src="images/in_cart.png"></a>
        <a href="<%= request.getContextPath()%>/servlet/CartServlet?action=show"><img src="images/view_cart.jpg"></a>
    </div>

    <%
        String viewlist = "";
        Cookie[] cookies = request.getCookies();
        if(cookies != null && cookies.length > 0){
            for(Cookie c : cookies) {

                if (c.getName().equals("ViewList")) {
                    viewlist = c.getValue();
//                    out.print(viewlist);
                }
            }
        }

        viewlist += items.getItem_id() + ",";

        //历史浏览记录大于20就清零
        String[] strings = viewlist.split(",");
        if(strings.length >=20){
            viewlist = "";
        }

        Cookie cookie = new Cookie("ViewList",viewlist);
        response.addCookie(cookie);
    %>

    <hr>
    <h2>看过的商品</h2>
    <table>

    <%
        ArrayList<Items> arrayList = itemsDAO.getViewList(viewlist);

        if(arrayList == null){
            out.print("无浏览记录");
        }else {

            for (Items i : arrayList){

    %>

        <tr>
            <td><img src="images/<%= i.getItem_url()%>" width="100" height="80"></td>
        </tr>
        <tr>
            <td><%= i.getItem_name()%></td>
        </tr>
        <tr>
            <td>价格：<%= i.getItem_price()%></td>
        </tr>
        <tr>
            <td>产地：<%= i.getItem_place()%></td>
        </tr>

    <%
            }
        }
    %>

    </table>

</body>
</html>
