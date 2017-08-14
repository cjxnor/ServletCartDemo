package servlet;

import dao.ItemsDAO;
import entity.Cart;
import entity.Items;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class CartServlet extends HttpServlet {

    //需要进行的操作：增加，删除
    private String buyAction;

    ItemsDAO itemsDAO = new ItemsDAO();




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        buyAction = request.getParameter("action");

        if(buyAction != null){

            //将商品添加到购物车
            if(buyAction.equals("add")){

                if(addToCart(request,response)){
                    request.getRequestDispatcher("/succeed.jsp").forward(request,response);
                }else {
                    request.getRequestDispatcher("/failed.jsp").forward(request,response);
                }


                /**
                 * 删除商品
                 */
            }else if(buyAction.equals("remove")){
                if(rmFromCart(request,response)){
                    request.getRequestDispatcher("/cart.jsp").forward(request,response);
                }


            }else if(buyAction.equals("show")){
                request.getRequestDispatcher("/cart.jsp").forward(request,response);


            }else {

            }
        }


    }

    /**
     * 将商品添加进购物车
     * @param request
     * @param response
     * @return
     */
    public boolean addToCart(HttpServletRequest request, HttpServletResponse response){

        int buyId = Integer.parseInt(request.getParameter("id"));
        int buyNum = Integer.parseInt(request.getParameter("num"));

        //判断会话中是否有Cart类
        if(request.getSession().getAttribute("usercart") == null){
            Cart cart = new Cart();
            request.getSession().setAttribute("usercart",cart);
        }
        Cart cart = (Cart) request.getSession().getAttribute("usercart");

        Items itemadd = itemsDAO.getItemsById(buyId);
        if(cart.addGoodsInCart(itemadd,buyNum)){

            /*************测试*************/
//            HashMap<Items,Integer> mygoods = cart.getGoods();
//
//            Iterator iterator = mygoods.entrySet().iterator();
//            while (iterator.hasNext()) {
//
//                Map.Entry entry = (Map.Entry) iterator.next();
//                Items items = (Items) entry.getKey();
//
//                int number = (int) entry.getValue();
//
//            }

            /*************测试*************/

            return true;

        }else {
            return false;
        }

    }

    /**
     * 将商品从购物车中删除
     * @param request
     * @param response
     * @return
     */
    public boolean rmFromCart(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Cart usercart = (Cart) request.getSession().getAttribute("usercart");

        if(usercart.rmGoodsFromCart(itemsDAO.getItemsById(id))){
            return true;
        }else {
            return false;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
