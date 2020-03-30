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
@WebServlet("/CheckInOld")
public class CheckInOld extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		doPost(request, response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String IS = request.getParameter("ISBN");
		String amount = request.getParameter("amount");
		String prices = request.getParameter("prices");
		String o_date = (new java.util.Date()).toLocaleString();
		
		Order b = new  Order();
		
		b.setISBN(IS);
		b.setAmount(amount);
		b.setPrices(prices);
		b.setDate(o_date);
		
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
		PreparedStatement st = null;
		Statement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String ISBN = null;
		String name = null;
		String press = null;
		String author = null;
		String price = null;
		
		try {
	        //第一步，加载驱动
	           Class.forName(DBDRIVER);
	           System.out.println("成功连接!");
	    } catch (ClassNotFoundException e) {
	           e.printStackTrace();
	    }
		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			String InSql="select * from bookinfo where ISBN="+IS;
			stmt = (Statement) conn.createStatement();
			rs = (ResultSet) stmt.executeQuery(InSql);
			while(rs.next()){
				ISBN = rs.getString("ISBN");
				name = rs.getString("name");
				press = rs.getString("press");
				author = rs.getString("author");
				price = rs.getString("price");
			}
			b.setISBN(ISBN);
			b.setName(name);
			b.setPress(press);
			b.setAuthor(author);
			b.setPrice(price);
			
			String sql = "insert into order_form (ISBN,name,author,press,price,status,prices,amount,o_date) values(?,?,?,?,?,?,?,?,?)";
			st =(PreparedStatement) conn.prepareStatement(sql);
			st.setString(1, b.getISBN());
			st.setString(2, b.getName());
			st.setString(3, b.getAuthor());
			st.setString(4, b.getPress());
			st.setString(5, b.getPrice());
			st.setString(6, "non-payment");
			st.setString(7, b.getPrices());
			st.setString(8, b.getAmount());
			st.setString(9, b.getDate());
			int rows = st.executeUpdate();
			System.out.println(rows);
				
			if(rows>0){
				flag= true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(flag) {
			response.sendRedirect("Payment.jsp");
		}
		else {
			response.sendRedirect("Check_In.jsp");
		}
	}
}
