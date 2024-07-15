/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog824.dao;
import com.blog824.entities.User;
import java.sql.*;

/**
 *
 * @author gs671
 */
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    // method to insert user data in database;
    public boolean saveUser(User user)
    {
        boolean f=false;
        try
        {
        String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
        PreparedStatement st=this.con.prepareStatement(query);
        st.setString(1,user.getName());
        st.setString(2,user.getEmail());
        st.setString(3,user.getPassword());
        st.setString(4,user.getGender());
        st.setString(5,user.getAbout());
        st.executeUpdate();
        f=true;
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        return f;
    }
    
  public User   getUserByEmailAndPassword(String email,String password)
  {  User user=null; 
     try
     {
        
     String query="select * from user where email=? and password=?";
     PreparedStatement st=con.prepareStatement(query);
     st.setString(1, email);
     st.setString(2, password);
     ResultSet rs=st.executeQuery();
     if(rs.next())
     {
     user=new User();
     String name=rs.getString("name");
     user.setName(name);
     user.setId(rs.getInt("id"));
     user.setAbout(rs.getString("about"));
     user.setEmail(rs.getString("email"));
     user.setPassword(rs.getString("password"));
     user.setGender(rs.getString("gender"));
     user.setDateTime(rs.getTimestamp("rdate"));
     user.setProfile(rs.getString("profile"));
     }
     }
     catch(Exception e)
          {}
      return user;
  }
  public boolean updateUser(User user)
  {
      boolean f=false;
  try{
  String sql="update user set email=?, name=?,password=?,profile=?,about=? where id=?";
  PreparedStatement st=con.prepareStatement(sql);
  st.setString(1,user.getEmail());
  st.setString(2,user.getName());
  st.setString(3, user.getPassword());
  st.setString(4, user.getProfile());
  st.setString(5,user.getAbout());
  st.setInt(6,user.getId());
  st.execute();
  f=true;
  }
  catch(Exception e)
  {
  e.printStackTrace();
  }
        return f;
  }
  public User getDetails(int id)
  {
  User user=null; 
     try
     {
        
     String query="select * from user where id=?";
     PreparedStatement st=con.prepareStatement(query);
     st.setInt(1, id);
     ResultSet rs=st.executeQuery();
     if(rs.next())
     {
     user=new User();
     String name=rs.getString("name");
     user.setName(name);
     user.setId(rs.getInt("id"));
     user.setAbout(rs.getString("about"));
     user.setEmail(rs.getString("email"));
     user.setPassword(rs.getString("password"));
     user.setGender(rs.getString("gender"));
     user.setDateTime(rs.getTimestamp("rdate"));
     user.setProfile(rs.getString("profile"));
     }
     }
     catch(Exception e)
          {}
      return user;
  
  }
}
