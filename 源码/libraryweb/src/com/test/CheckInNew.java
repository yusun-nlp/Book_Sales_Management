package com.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
@WebServlet("/CheckInNew")
public class CheckInNew extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		doPost(request, response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String ISBN =request.getParameter("ISBN");
		String name = request.getParameter("name");
		String press = request.getParameter("press");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String prices = request.getParameter("prices");
		String amount = request.getParameter("amount");
		String o_date = (new java.util.Date()).toLocaleString();
		
		Order b = new  Order();
		
		b.setISBN(ISBN);
		b.setName(name);
		b.setPress(press);
		b.setAuthor(author);
		b.setPrice(price);
		b.setPrices(prices);
		b.setAmount(amount);
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
		boolean flag = false;
		
		try {
	        //第一步，加载驱动
	           Class.forName(DBDRIVER);
	           System.out.println("成功连接!");
	    } catch (ClassNotFoundException e) {
	           e.printStackTrace();
	    }
		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
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
