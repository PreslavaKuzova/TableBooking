package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class BookingDatabase {
	Connection connection = null;

	public BookingDatabase() {
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
			String sql = "CREATE TABLE bookedTables (" + "username TEXT NOT NULL," + "date TEXT NOT NULL,"
					+ "partySize TEXT NOT NULL," + "time TEXT NOT NULL)";
			stmt.executeUpdate(sql);
			stmt.close();
			System.out.print("Table created");
		} catch (Exception e) {
			System.out.println("Table was not created");
		}
	}

	public void insertData(String username, String date, String partySize, String time) {
		try {
			Statement stmt = connection.createStatement();
			String sql = "INSERT INTO users (username, date, partySize, time) VALUES('" + username + "', '" + date
					+ "', '" + "', '" + partySize + "', '" + time + "');";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
