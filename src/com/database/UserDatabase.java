package com.database;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDatabase {
	Connection connection = null;

	public UserDatabase() {
		dataBaseSetUp();
		createTable();
	}

	private void dataBaseSetUp() {
		try {
			String connectionURL = "jdbc:mysql://localhost:3306/TableBooking?createDatabaseIfNotExist=true";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "1234");
			if (!connection.isClosed())
				System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		} catch (Exception ex) {
			System.out.println("Unable to connect to database" + ex);
		}
	}

	private void createTable() {
		try {
			Statement stmt = connection.createStatement();
			String sql = "CREATE TABLE users (" + "username TEXT NOT NULL,"	+ "email TEXT NOT NULL," + "password TEXT NOT NULL)";
			stmt.executeUpdate(sql);
			stmt.close();
			System.out.print("Table created");
		} catch (Exception e) {
			System.out.println("Table was not created");
		}
	}

	public void insertData(String username, String email, String password) {
		try {
			Statement stmt = connection.createStatement();
			String sql = "INSERT INTO users (username, email, password) VALUES('" + username + "', '" + email
					+ "', '" + password + "');";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkNames (String username) {
		boolean doesMatch = false;
		
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT username FROM users;");
			while (rs.next()) {
				if (username.equals(rs.getString("username"))) {
					doesMatch = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return doesMatch;
	}
	
	public boolean checkPassword (String username, String password) {
		boolean doesMatch = false;
		
		try {
			Statement stmt = connection.createStatement();
			String sql = ("SELECT password FROM users WHERE username LIKE '%" + username + "%';");
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()){
				String passCheck = rs.getString("password");
				System.out.println(passCheck);
				if(passCheck.equals(password)) {
					doesMatch = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doesMatch;
	}
}
