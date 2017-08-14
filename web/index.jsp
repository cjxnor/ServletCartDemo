<%@ page import="dao.ItemsDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Items" %><%--
  Created by IntelliJ IDEA.
  User: cjx
  Date: 2017/8/5
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <style>
          dl{
              float: left;
          }
      </style>

    <title>商品展示</title>
  </head>
  <body>
    <h1>商品展示</h1>
    <hr>

    <table>
      <tr>
          <%------需要把mysql-connector-java-5.1.7-bin.jar拷贝到tomcat下lib目录-----%>
        <td>
            <%

                ItemsDAO itemsDAO = new ItemsDAO();
                ArrayList<Items> itemslist = itemsDAO.getAllItems();

                for(Items i : itemslist){

            %>

            <dl>
                <dt><a href="detail.jsp?id=<%= i.getItem_id()%>"><img src="images/<%= i.getItem_url()%>" width="120" height="90"></a></dt>
                <dd><%= i.getItem_name()%></dd>
                <dd>价格：<%= i.getItem_price()%>&nbsp;&nbsp;产地：<%= i.getItem_place()%></dd>
            </dl>

            <%
                }
            %>

        </td>
      </tr>
    </table>


  </body>
</html>
