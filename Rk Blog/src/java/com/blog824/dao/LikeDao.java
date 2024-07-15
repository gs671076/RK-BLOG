/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog824.dao;

import java.sql.*;

/**
 *
 * @author gs671
 */
public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insert(int pid, int uid) {
        boolean f = false;
        try {
            String sql = "insert into likes(pid,uid) values(?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, uid);
            st.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int likeCountOnPost(int pid) {
        int count=0;
        try {
            String sql = "select count(*) from likes where pid=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs=st.executeQuery();
            if(rs.next())
            {
            count=rs.getInt("count(*)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean isLikedByUser(int pid,int uid)
    {
    boolean f=false;
    try
    {
    String sql="select * from likes where pid=? and uid=?";
    PreparedStatement st=con.prepareStatement(sql);
    st.setInt(1,pid);
    st.setInt(2, uid);
    ResultSet rs=st.executeQuery();
    if(rs.next())
    {
    f=true;
    }
    }
    catch(Exception e)
    {
    e.printStackTrace();
    }
    return f;
    }
 public boolean deleteLike(int pid, int uid)
 {
     boolean f=false;
     try
     {
     String sql="delete from likes where pid=? and uid=?";
     PreparedStatement p=con.prepareStatement(sql);
     p.setInt(1,pid);
     p.setInt(2, uid);
     p.executeUpdate();
     f=true;
     }
     catch(Exception e)
     {
     e.printStackTrace();
     }
     
     return f;
 }

}
