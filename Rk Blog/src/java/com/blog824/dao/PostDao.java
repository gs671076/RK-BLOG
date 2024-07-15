/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog824.dao;

import com.blog824.entities.Categories;
import com.blog824.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author gs671
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getCategories() {
        ArrayList<Categories> list = new ArrayList<>();
        try {
            String query = "select * from categories ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("descrption");
                Categories c = new Categories(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public boolean savePost(Post post) {
        boolean f = false;
        try {
            String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,UserId) values(?,?,?,?,?,?)";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, post.getpTitle());
            st.setString(2, post.getpContent());
            st.setString(3, post.getpCode());
            st.setString(4, post.getpPic());
            st.setInt(5, post.getCatId());
            st.setInt(6, post.getUserId());
            st.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        try {

            PreparedStatement st = con.prepareStatement("select * from posts order by pid");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTiitle = rs.getString("pTitle");
                String content = rs.getString("pContent");
                String code = rs.getString("pCode");
                String pic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userId = rs.getInt("userid");
                Post p = new Post(pid, pTiitle, content, code, pic, date, catId, userId);
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        try {

            PreparedStatement st = con.prepareStatement("select * from posts where catid=?");
            st.setInt(1, catId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTiitle = rs.getString("pTitle");
                String content = rs.getString("pContent");
                String code = rs.getString("pCode");
                String pic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int userId = rs.getInt("userid");
                Post p = new Post(pid, pTiitle, content, code, pic, date, catId, userId);
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getDataByPostId(int postid) {
        String sql = "select * from posts where pid=?";
        Post p = null;
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, postid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int pid = rs.getInt("pid");
                String pTiitle = rs.getString("pTitle");
                String content = rs.getString("pContent");
                String code = rs.getString("pCode");
                String pic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userId = rs.getInt("userid");
                p = new Post(pid, pTiitle, content, code, pic, date, catId, userId);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
}
