package entity;

/**
 * 商品类
 */
public class Items {

    /**
     * 商品编号
     */
    private int item_id;

    /**
     * 商品名称
     */
    private String item_name;

    /**
     * 商品产地
     */
    private String item_place;

    /**
     * 商品价格
     */
    private double item_price;

    /**
     * 商品剩余数量
     */
    private int item_left;

    /**
     * 商品图片URL地址
     */
    private String item_url;

    /**
     * 带参构造方法
     * @param item_id
     * @param item_name
     * @param item_place
     * @param item_price
     * @param item_left
     * @param item_url
     */
    public Items(int item_id, String item_name, String item_place, double item_price,
                 int item_left, String item_url){
        this.item_id = item_id;
        this.item_name = item_name;
        this.item_place = item_place;
        this.item_price = item_price;
        this.item_left = item_left;
        this.item_url = item_url;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public double getItem_price() {
        return item_price;
    }

    public void setItem_price(double item_price) {
        this.item_price = item_price;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getItem_place() {
        return item_place;
    }

    public void setItem_place(String item_place) {
        this.item_place = item_place;
    }

    public int getItem_left() {
        return item_left;
    }

    public void setItem_left(int item_left) {
        this.item_left = item_left;
    }

    public String getItem_url() {
        return item_url;
    }

    public void setItem_url(String item_url) {
        this.item_url = item_url;
    }

}
