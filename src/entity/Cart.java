package entity;

import dao.ItemsDAO;

import java.util.*;

/**
 * 购物车类
 */
public class Cart {

    //商品及其数量
    private HashMap<Items,Integer> goods;

    //购物车总金额
    private double totalPrice;

    public Cart(){
        goods = new HashMap<Items, Integer>();
        totalPrice = 0.0;
    }

    public HashMap<Items, Integer> getGoods() {
        return goods;
    }

    public void setGoods(HashMap<Items, Integer> goods) {
        this.goods = goods;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }



    /**
     * 添加商品进购物车方法
     * @param items     商品类
     * @param number    商品数量
     * @return  true表示添加商品成功
     */
    public boolean addGoodsInCart(Items items, int number){

        /**
         * 判断是否添加的是重复商品，如果是的话数量增加
         */
        if(goods.containsKey(items)){
            goods.put(items,goods.get(items) + number);
        }else {
            goods.put(items,number);
        }

        this.calTotalPrice();
        return true;
    }

    /**
     * 删除购物车中商品的方法
     * @param items     商品类
     * @return      true表示删除商品成功
     */
    public boolean rmGoodsFromCart(Items items){

        goods.remove(items);
        this.calTotalPrice();
        return true;
    }

    /**
     * 计算购物车总金额并返回
     * @return
     */
    public double calTotalPrice(){
        double sum = 0.0;

        /**
         * 遍历goods实现总金额计算
         */
        Iterator iterator = goods.entrySet().iterator();
        while (iterator.hasNext()){

            Map.Entry entry = (Map.Entry) iterator.next();
            Items items = (Items) entry.getKey();
            int number = (int) entry.getValue();
            sum += items.getItem_price() * number;
        }
        this.setTotalPrice(sum);
        return sum;
    }


    public static void main(String args[]){

        Cart cart1 = new Cart();

        /**
         * 测试代码
         * 手动输入商品信息
         * ↓↓↓↓↓↓↓↓↓↓↓
         */
//        Items items1 = new Items(1, "李宁跑步鞋", "温州",
//                200, 3000, "001.jpg");
//        Items items2 = new Items(2, "阿迪运动鞋", "福建",
//                300, 2600, "002.jpg");
//        Items items3 = new Items(1, "李宁跑步鞋", "温州",
//                200, 3000, "001.jpg");
//        cart1.addGoodsInCart(items1,1);
//        cart1.addGoodsInCart(items2,2);
//        cart1.addGoodsInCart(items3,2);
        /**
         * ↑↑↑↑↑↑↑↑↑↑↑
         */


        /**
         * 测试代码
         * 从数据库中读取所有商品信息
         * ↓↓↓↓↓↓↓↓↓↓↓
         */
        ItemsDAO itemsDAO = new ItemsDAO();

        ArrayList<Items> cartitems = itemsDAO.getAllItems();

        for(Items i : cartitems){

            //暂时把所有商品数量设为1
            cart1.addGoodsInCart(i,1);
        }
        /**
         * ↑↑↑↑↑↑↑↑↑↑↑
         */


        //遍历购物车中的商品 goods
        Iterator iterator = cart1.getGoods().entrySet().iterator();
        while (iterator.hasNext()){

            Map.Entry entry = (Map.Entry)iterator.next();
            Items items = (Items) entry.getKey();
            int number = (int)entry.getValue();
            
            System.out.print("购物车中的商品：");
            System.out.print("商品id：" + items.getItem_id() + "  商品名：" + items.getItem_name() +
                    "  商品产地：" + items.getItem_place() + "  商品单价：" + items.getItem_price() +
                    "  库存：" + items.getItem_left());
            System.out.println("  购物车中数量：" + number);
        }

        System.out.println("购物车总金额：" + cart1.getTotalPrice());


        /**
         * 测试 itemsDAO.getItemsById()方法
         * ↓↓↓↓↓↓↓↓↓↓↓
         */
        Items items1 = itemsDAO.getItemsById(1);
        System.out.print("商品id：" + items1.getItem_id() + "  商品名：" + items1.getItem_name() +
                "  商品产地：" + items1.getItem_place() + "  商品单价：" + items1.getItem_price() +
                "  库存：" + items1.getItem_left());
        /**
         * ↑↑↑↑↑↑↑↑↑↑↑
         */

    }

}
