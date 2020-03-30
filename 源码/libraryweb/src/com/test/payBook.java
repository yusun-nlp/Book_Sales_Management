package com.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
@WebServlet("/payBook")
public class payBook extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		doPost(request, response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String bill = request.getParameter("orderID");
		String d_date = (new java.util.Date()).toLocaleString();
		String status = "out";
		
		Bill b = new Bill();
		Book bo = new Book();
		
		b.setStatus(status);
		b.setDate(d_date);
		
		String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        //数据库地址
		String DBURL = "jdbc:sqlserver://localhost:1433;DataBaseName=library";
        //数据库登录用户名
		String DBUSER = "julia";
        //数据库用户密码
		String DBPASSWORD = "sunyu0623";
        //数据库连接
        //数据库操作
		Connection conn = null;
		PreparedStatement st = null, st1 = null;
		Statement stmt = null;
		ResultSet rs = null;
		Statement stat = null;
		String ISBN = null;
		String name = null;
		String press = null;
		String author = null;
		String price = null;
		String amount = null;
		String prices = null;
		boolean flag = false;
		boolean flag1 = false;
		
		try {
	        //第一步，加载驱动
	           Class.forName(DBDRIVER);
	           System.out.println("成功连接!");
	    } catch (ClassNotFoundException e) {
	           e.printStackTrace();
	    }
		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			String sql1 = "select * from order_form where orderID=" + bill;
			stmt = (Statement) conn.createStatement();
			rs = (ResultSet) stmt.executeQuery(sql1);
			while(rs.next()){
				ISBN = rs.getString("ISBN");
				name = rs.getString("name");
				press = rs.getString("press");
				author = rs.getString("author");
				price = rs.getString("price");
				amount = rs.getString("amount");
				prices = rs.getString("prices");
			}
			b.setISBN(ISBN);
			b.setName(name);
			b.setAmount(amount);
			b.setPrices(prices);
			bo.setISBN(ISBN);
			bo.setName(name);
			bo.setPress(press);
			bo.setAuthor(author);
			bo.setPrice(price);
			bo.setStore(amount);
			
			String sql2 = "update order_form set status ='"+"success"+"' where orderID = "+bill;
			stat = (Statement) conn.createStatement();
			stat.executeQuery(sql2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {

			String sql = "insert into bill (status,ISBN,name,amount,prices,b_date) values(?,?,?,?,?,?)";
			st =(PreparedStatement) conn.prepareStatement(sql);
			st.setString(1, b.getStatus());
			st.setString(2, b.getISBN());
			st.setString(3, b.getName());
			st.setString(4, b.getAmount());
			st.setString(5, b.getPrices());
			st.setString(6, b.getDate());
			int rows = st.executeUpdate();
			System.out.println(rows);
				
			if(rows>0){
				flag= true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			String sql3 = "select * from bookinfo where ISBN="+ISBN;
			stat = (Statement) conn.createStatement();
			rs = stat.executeQuery(sql3);
			if(rs.next()) {
				flag1 =true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		if(flag1) {
			try {
				float store=Float.parseFloat(amount);
				String sql4 = "update bookinfo set store = store+"+store+"where ISBN="+ISBN;
				stat = (Statement) conn.createStatement();
				rs = stat.executeQuery(sql4);
				if(rs.next()) {
					flag = flag&&true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				String sql5 = "insert into bookinfo (ISBN,name,press,author,price,store) values(?,?,?,?,?,?)";
				st1 =(PreparedStatement) conn.prepareStatement(sql5);
				st1.setString(1, bo.getISBN());
				st1.setString(2, bo.getName());
				st1.setString(3, bo.getPress());
				st1.setString(4, bo.getAuthor());
				st1.setString(5, bo.getPrice());
				st1.setString(6, bo.getStore());
				int rows = st1.executeUpdate();
				System.out.println(rows);
					
				if(rows>0){
					flag= flag&&true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(flag) {
			response.sendRedirect("Order_List.jsp");
		}
		else {
			response.sendRedirect("Payment.jsp");
		}
	}
}
