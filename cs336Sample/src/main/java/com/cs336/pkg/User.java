package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class User {
	
	private String username;
	private String user_password;
	private String email;
	//private boolean is_customer_rep;
	//private boolean is_admin;
	
	public User(String username, String user_password, String email) {
		this.username = username;
		this.user_password = user_password;
		this.email = email;
		//is_customer_rep = isCusRep;
		//is_admin = isAdmin;
	}
	public User(){
	}
	
	//getter and setter methods for class Member
		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}
		
		public String getPassword() {
			return user_password;
		}

		public void setPassword(String user_password) {
			this.user_password = user_password;
		}
		
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
	}
