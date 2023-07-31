package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MySql {
	String path="com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
	String username = "root";
	String password = "root";
	static Connection con=null;
	PreparedStatement pstmt=null;
	String sql1="insert into book_dtls(bookname,author,price,bookcategory,status,photo,user_email) values(?,?,?,?,?,?,?)";
	public MySql() {
		try {
			Class.forName(path);
			con=DriverManager.getConnection(url, username, password);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void info(String bookname,String Author,String price,String categories,String status,String filename,String user_email) {
		try {
			pstmt=con.prepareStatement(sql1);
			pstmt.setString(1, bookname);
			pstmt.setString(2, Author);
			pstmt.setString(3, price);
			pstmt.setString(4, categories);
			pstmt.setString(5, status);
			pstmt.setString(6, filename);
			pstmt.setString(7, user_email);
			pstmt.executeUpdate();


		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List bookDetails() {
		String path="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
		String username = "root";
		String password = "root";
		Connection con1=null;
		PreparedStatement pstmt=null;
		String sql2="SELECT * FROM book_dtls";
		List plist=new ArrayList();
		try {
			Class.forName(path);
			con1=DriverManager.getConnection(url, username, password);
			Statement st=con1.createStatement();
			ResultSet rs=st.executeQuery(sql2);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getString(7)+":"+rs.getString(8);
				plist.add(temp);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return plist;
	}
	public void updateBook(int bookId, String bookName, String author, String price, String status) throws SQLException, ClassNotFoundException {
		String path="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
		String username = "root";
		String password = "root";
		Connection con1=null;
		PreparedStatement pstmt=null;
		Class.forName(path);
		con1=DriverManager.getConnection(url, username, password);
		String sql3="update book_dtls set bookname=?,author=?,price=?,status=? where bookid=?";
		pstmt=con.prepareStatement(sql3);
		pstmt.setString(1, bookName);
		pstmt.setString(2, author);
		pstmt.setString(3, price);
		pstmt.setString(4, status);
		pstmt.setInt(5, bookId);
		pstmt.executeUpdate();
	}
	public void delete(int bookId) throws SQLException {
		String sql4="delete from book_dtls where bookid=?";
		pstmt=con.prepareStatement(sql4);
		pstmt.setInt(1, bookId);
		pstmt.executeUpdate();
	}
	public static List newBook() {
		List blist=new ArrayList();
		try {
			String path="com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Connection con1=null;
			PreparedStatement pstmt=null;
			Class.forName(path);
			con1=DriverManager.getConnection(url, username, password);
			String sql4="SELECT * FROM `ebook-app`.book_dtls WHERE bookcategory != 'old' ORDER BY bookid DESC;";
			Statement st=con1.createStatement();
			ResultSet rs=st.executeQuery(sql4);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getString(7)+":"+rs.getString(8);
				blist.add(temp);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return blist;

	}
	public static List recentBook() {
		List rlist=new ArrayList();
		try {
			String path="com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Connection con1=null;
			PreparedStatement pstmt=null;
			Class.forName(path);
			con1=DriverManager.getConnection(url, username, password);
			String sql4="SELECT bookid, bookname, author, price, bookcategory ,status, photo,user_email FROM `ebook-app`.book_dtls WHERE status = 'active' AND bookcategory = 'new'";
			Statement st=con1.createStatement();
			ResultSet rs=st.executeQuery(sql4);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getString(7)+":"+rs.getString(8);
				rlist.add(temp);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rlist;
	}
	public static List oldBook() {
		List rlist=new ArrayList();
		try {
			String path="com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Connection con1=null;
			PreparedStatement pstmt=null;
			Class.forName(path);
			con1=DriverManager.getConnection(url, username, password);
			String sql4="SELECT * FROM `ebook-app`.book_dtls WHERE bookcategory = 'old'";
			Statement st=con1.createStatement();
			ResultSet rs=st.executeQuery(sql4);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getString(7)+":"+rs.getString(8);
				rlist.add(temp);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rlist;
	}
	public static List viewBook(String book_id) {
		List vlist=new ArrayList();
		try {
			String path = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Connection con1 = null;

			String sql2 = "SELECT * FROM `ebook-app`.book_dtls where bookid LIKE ?";
			Class.forName(path);
			con1 = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = con1.prepareStatement(sql2);
			pstmt.setString(1, book_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String temp = rs.getInt(1) + ":" + rs.getString(2) + ":" + rs.getString(3) + ":" + rs.getString(4) + ":" + rs.getString(5) + ":" + rs.getString(6) + ":" + rs.getString(7) + ":" + rs.getString(8);
				vlist.add(temp);
			}
			con1.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}

	public static List viewOldBook(String book_id) {
		List olist=new ArrayList();
		try {
			String path = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Connection con1 = null;

			String sql2 = "SELECT * FROM `ebook-app`.book_dtls where bookid LIKE ?";
			Class.forName(path);
			con1 = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = con1.prepareStatement(sql2);
			pstmt.setString(1, book_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String temp = rs.getInt(1) + ":" + rs.getString(2) + ":" + rs.getString(3) + ":" + rs.getString(4) + ":" + rs.getString(5) + ":" + rs.getString(6) + ":" + rs.getString(7) + ":" + rs.getString(8);
				olist.add(temp);
			}
			con1.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return olist;
	}
	public static List editView(String bookid) {
		String path = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
		String username = "root";
		String password = "root";
		Connection con1 = null;
		PreparedStatement pstmt = null;
		String sql2 = "SELECT * FROM `ebook-app`.book_dtls WHERE bookid = ?";
		List plist = new ArrayList();
		try {
			Class.forName(path);
			con1 = DriverManager.getConnection(url, username, password);
			pstmt = con1.prepareStatement(sql2);
			pstmt.setString(1, bookid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String temp = rs.getInt(1) + ":" + rs.getString(2) + ":" + rs.getString(3) + ":" + rs.getString(4)
				+ ":" + rs.getString(5) + ":" + rs.getString(6) + ":" + rs.getString(7) + ":"
				+ rs.getString(8);
				plist.add(temp);
			}
			pstmt.close();
			con1.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return plist;
	}
	public void register(String name,String email,String phone,String password) {
		String path = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
		String username = "root";
		String password1 = "root";
		Connection con1 = null;
		PreparedStatement pstmt = null;
		String sql3 = "insert into `ebook-app`.user (name,email,phone,password) values(?,?,?,?)";
		try {
			Class.forName(path);
			con1 = DriverManager.getConnection(url, username, password1);
			pstmt=con.prepareStatement(sql3);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			pstmt.setString(4, password);
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String login(String email) {
		String sql4="SELECT PASSWORD FROM `ebook-app`.user WHERE EMAIL=?";
		String password1="";
		try {
			Class.forName(path);
			con=DriverManager.getConnection(url,username,password);
			pstmt=con.prepareStatement(sql4);
			pstmt.setString(1,email);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			password1=rs.getString("PASSWORD");
		}
		catch (Exception e) {
			System.out.println("Login issues" );
			e.printStackTrace();
		}
		return password1;
	}
	public static List userId() {
		List rlist=new ArrayList();
		try {
			String path="com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Connection con1=null;
			PreparedStatement pstmt=null;
			Class.forName(path);
			con1=DriverManager.getConnection(url, username, password);
			String sql4="SELECT * FROM `ebook-app`.user WHERE status='active'";
			Statement st=con1.createStatement();
			ResultSet rs=st.executeQuery(sql4);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getString(7)+":"+rs.getString(8);
				rlist.add(temp);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rlist;
	}
	public int addCart(int bid, int uid, String book_name, String author, String price, String total_price) {
		String sql6 = "INSERT INTO cart(bid, uid, book_name, author, price, total_price) VALUES (?, ?, ?, ?, ?, ?)";
		int rowsAffected = 0;
		try {
			pstmt = con.prepareStatement(sql6);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, uid);
			pstmt.setString(3, book_name);
			pstmt.setString(4, author);
			pstmt.setString(5, price);
			pstmt.setString(6, total_price);
			rowsAffected = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowsAffected;
	}
	public static List bookCart() {
		List bclist=new ArrayList();
		try {
			String path="com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Connection con1=null;
			PreparedStatement pstmt=null;
			Class.forName(path);
			con1=DriverManager.getConnection(url, username, password);
			String sql5="SELECT * FROM `ebook-app`.cart where uid LIKE '?'";
			Statement st=con1.createStatement();
			ResultSet rs=st.executeQuery(sql5);
			while(rs.next()) {
				String temp=rs.getInt(1)+":"+rs.getInt(2)+":"+rs.getInt(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)+":"+rs.getDouble(7);

				bclist.add(temp);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bclist;

	}
	public static List bookCarts(String uid) {
		List bclist = new ArrayList();
		try {
			String path = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Connection con1 = null;
			PreparedStatement pstmt = null;
			Class.forName(path);
			con1 = DriverManager.getConnection(url, username, password);
			String sql5 = "SELECT * FROM `ebook-app`.cart where uid=?";
			pstmt = con1.prepareStatement(sql5);
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			double total_price = 0; // Initialize the total price outside of the loop
			while (rs.next()) {
				total_price += rs.getDouble(7); // Add the price for each row to the total price
				String temp = rs.getInt(1) + ":" + rs.getInt(2) + ":" + rs.getInt(3) + ":" + rs.getString(4) + ":" + rs.getString(5) + ":" + rs.getString(6) + ":" + total_price;
				bclist.add(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bclist;
	}
	public void deleteBook(int bid) throws SQLException {
		String sql8="delete from `ebook-app`.cart where bid=?";
		pstmt=con.prepareStatement(sql8);
		pstmt.setInt(1, bid);
		pstmt.executeUpdate();
	}
	public static List userInfo(String id) {
		List rlist = new ArrayList();
		Connection con1 = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String path = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
			String username = "root";
			String password = "root";
			Class.forName(path);
			con1 = DriverManager.getConnection(url, username, password);
			String sql4 = "SELECT * FROM `ebook-app`.user WHERE id=?";
			pstmt = con1.prepareStatement(sql4);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String temp = rs.getInt(1) + ":" + rs.getString(2) + ":" + rs.getString(3) + ":" + rs.getString(4)
				+ ":" + rs.getString(5) + ":" + rs.getString(6) + ":" + rs.getString(7) + ":" + rs.getString(8);
				rlist.add(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return rlist;
	}
	public void updateProfile(int id, String name, String email, String phone, String password) throws SQLException, ClassNotFoundException {
		String path="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/EBOOK-APP";
		String username = "root";
		String password1 = "root";
		Connection con1=null;
		PreparedStatement pstmt=null;
		Class.forName(path);
		con1=DriverManager.getConnection(url, username, password1);
		String sql3="update `ebook-app`.user set name=?,email=?,phone=?,password=? where id=?";
		pstmt=con.prepareStatement(sql3);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, phone);
		pstmt.setString(4, password);
		pstmt.setInt(5, id);
		pstmt.executeUpdate();
	}
	
}