<%@ page import="dao.ItemsDAO" %>
<%@ page import="entity.Items" %><%--
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

            <%--使用js弹窗插件传递参数    TODO 弹窗有问题--%>
            J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400,
                link: '<%= request.getContextPath()%>/servlet/CartServlet?id=\'+id+\'&num=\'+num+\'&action=add',
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
        <a href="javascript:selflog_show(<%= items.getItem_id()%>)"><img src="images/buy_now.png"></a>
    </div>

</body>
</html>
