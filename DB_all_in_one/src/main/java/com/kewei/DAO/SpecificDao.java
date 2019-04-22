package com.kewei.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SpecificDao {

	private Connection connection = null;
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private String DB_URL;
	private String USER;
	private String PASSWORD;

	public SpecificDao(String username, String password, String database) throws Exception{
		//jdbc:mysql://localhost:3306/final_project?serverTimezone=UTC
		this.DB_URL = "jdbc:mysql://localhost:3306/" + database + "?serverTimezone=UTC";
		this.USER = username;
		this.PASSWORD = password;
		try {
			this.connection = getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw e;
		}
	}

	public Connection getConnection() throws Exception {
		try {
			Connection connection = null;
//            DbUtils.loadDriver(JDBC_DRIVER);
			System.out.println(this.DB_URL);
			System.out.println(this.USER);
			System.out.println(this.PASSWORD);
			this.connection = DriverManager.getConnection(this.DB_URL, this.USER, this.PASSWORD);
		} catch (SQLException ex) {
//            endConnection();
			System.out.println("SQL Exception");
			ex.printStackTrace();
			throw ex;
		}
//            endConnection();
		return this.connection;
	}

	public ArrayList doQuery(String query)  throws Exception{
		ArrayList<ArrayList<Object>> resultsArrayList = new ArrayList<ArrayList<Object>>();

		try {
			ResultSet rs = null;
			Statement statement = this.connection.createStatement();
			System.out.println("before query");
			rs = statement.executeQuery(query);
			
			System.out.println("after query");
			ResultSetMetaData rsmd = rs.getMetaData();
			
			System.out.println("in database check rs:"+ rsmd==null);

			int count = rsmd.getColumnCount();
			System.out.println("in database check count:"+ count);
			
			// add header
			ArrayList<Object> header = new ArrayList<Object>();
			for(int i = 1;i<=count; i++) {				
				header.add(rsmd.getColumnName(i));
			}			
			resultsArrayList.add(header);
			
			
			// add content
			while (rs.next()) {
				ArrayList<Object> contents = new ArrayList<Object>();
				for (int i = 1; i <= count; i++) {
					contents.add( rs.getObject(i));
				}
				resultsArrayList.add(contents);
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			System.out.println(e.getMessage());
			throw e;
		}
		
		System.out.println("resultsArrayList size:"+resultsArrayList.size() );

		return resultsArrayList;

	}

}
