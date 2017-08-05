package entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

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
        goods.put(items,number);
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
        Set<Items> keys = goods.keySet();
        Iterator<Items> iterator = keys.iterator();
        while (iterator.hasNext()){
            Items items = iterator.next();
            sum += items.getItem_price() * goods.get(items);
        }
        this.setTotalPrice(sum);
        return sum;
    }

    public static void main(String args[]){

        Items items1 = new Items(1, "李宁跑步鞋", "温州",
                200, 3000, "001.jpg");
        Items items2 = new Items(2, "阿迪运动鞋", "福建",
                300, 2600, "002.jpg");

        Cart cart1 = new Cart();
        cart1.addGoodsInCart(items1,1);
        cart1.addGoodsInCart(items2,2);

        System.out.println("购物车总金额：" + cart1.getTotalPrice());
    }

}
