package dao;

import entity.Items;
import util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ItemsDAO {

    public ArrayList<Items> getAllItems(){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet resultSet = null;

        //存储获得的所用商品
        ArrayList<Items> list = new ArrayList<Items>();

        try{
            conn = DBHelper.getConnection();

            //SQL语句
            String sql = "select * from goods;";
            stmt = conn.prepareStatement(sql);
            resultSet = stmt.executeQuery();

            while (resultSet.next()){
                Items items = new Items();
                items.setItem_id(resultSet.getInt("id"));
                items.setItem_name(resultSet.getString("name"));
                items.setItem_place(resultSet.getString("place"));
                items.setItem_price(resultSet.getFloat("price"));
                items.setItem_left(resultSet.getInt("left"));
                items.setItem_url(resultSet.getString("url"));

                list.add(items);
            }

            return list;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }finally {
            // 释放数据集对象
            if (resultSet!= null) {
                try {
                    resultSet.close();
                    resultSet = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            // 释放语句对象
            if (stmt != null) {
                try {
                    stmt.close();
                    stmt = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    /**
     * 获取最近浏览的五条信息
     * TODO
     */
        public ArrayList<Items> getViewList(String list){


            return null;
        }
}