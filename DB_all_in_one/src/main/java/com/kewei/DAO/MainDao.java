package com.kewei.DAO;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.kewei.Pojo.User;



public class MainDao {
    private Connection connection = null;
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/final_project?serverTimezone=UTC";
    static final String USER = "root";
    static final String PASSWORD = "11022033i";
    
    
    
    
    public MainDao() {
        try {
            getConnection();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
    public Connection getConnection() throws Exception {
        try {
            Connection connection = null;
//            DbUtils.loadDriver(JDBC_DRIVER);
            this.connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (SQLException ex) {
//            endConnection();
            System.out.println("SQL Exception");
            ex.printStackTrace();
            throw new Exception();
        }
//            endConnection();
        return this.connection;
    }
    
    
    
    public  ArrayList getDbs() throws Exception{
    	
    	ArrayList<String> results = new ArrayList<String>();
    	
    	try {
    		ResultSet rs = null;
            Statement statement = this.connection.createStatement();
            String query = " SELECT  * FROM  db_info";
            rs = statement.executeQuery(query);
            while(rs.next()) {
            	  results.add(rs.getString("dbname"));
            	}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
        
        return results;
    }
    
    public int registerUser(String skillString, String user_name, String user_password) throws Exception{
    	int result = 1;
    	while(skillString.charAt(0) ==',') {
    		skillString = skillString.substring(1);
    	}
    	
    	String createuserString  =  "CREATE USER '"+user_name+"'@'localhost' IDENTIFIED BY '"+user_password+ "'";
    	String grantuserString = "GRANT " +skillString + " ON " +" *.* " +"to '" +user_name+"'@'localhost'"; 
    	
    	String insertqueryString = "INSERT INTO user_info (user_name, user_password)  VALUES('"+user_name+"','"+user_password+"')";
    	System.out.println(createuserString+"111111");
    	System.out.println(grantuserString+"!!!22222!!!!!");
    	System.out.println(insertqueryString+"!!!333333!!!!!");
    	
    	
    	try {
    	 	Statement statement = this.connection.createStatement();
        	statement.execute(createuserString);
        	statement.execute(grantuserString);
        	statement.execute(insertqueryString);
        	
		} catch (Exception e) {
			// TODO: handle exception
			result = 1;
			System.out.println(e.getMessage());
			throw e;
		}
    	
    	
    
    	return result;
    }
    
    
   public  ArrayList getUsers() throws Exception{
    	
    	ArrayList<String> results = new ArrayList<String>();
    	
    	try {
    		ResultSet rs = null;
            Statement statement = this.connection.createStatement();
            String query = " SELECT  * FROM  user_info";
            rs = statement.executeQuery(query);
            while(rs.next()) {
            	  results.add(rs.getString("user_name"));
            	}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
        
        return results;
    }
    
    
    
    public User authenticateLogin(String user, String password) throws SQLException {
        
        try {
           System.out.println(this.connection == null);
            System.out.println("user " + user);
            System.out.println("passord " + password);
            QueryRunner queryRunner = new QueryRunner();
            String query = "SELECT * FROM user_info where user_name=? AND user_password=?";
            ResultSetHandler<User> h = new BeanHandler(User.class);
            User l = queryRunner.query(connection, query, h, user, password);
            return l;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    
//    public int DoSave(String username, String statement) throws Exception{
//    	int result = 0;    	
//      	try {
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			result = 1;
//			System.out.println(e.getMessage());
//			throw e;
//		}
//
//    	return result;
//    }
    
    
    
    
    
    
}
