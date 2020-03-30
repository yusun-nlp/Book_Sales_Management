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
@WebServlet("/SalesBook")
public class SalesBook extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		doPost(request, response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String bill = request.getParameter("dealID");
		String ISBN = request.getParameter("ISBN");
		String amount = request.getParameter("amount");
		String d_date = (new java.util.Date()).toLocaleString();
		String status = "in";
		
		Bill b = new Bill();
		Deal d = new Deal();
		
		b.setISBN(ISBN);
		b.setAmount(amount);
		b.setStatus(status);
		b.setDate(d_date);
		d.setdealID(bill);
		d.setISBN(ISBN);
		d.setAmount(amount);
		d.setDate(d_date);
		
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
		String name = null;
		String price = null;
		String c_store = null;
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
			String sql1 = "select * from bookinfo where ISBN="+ISBN;
			stmt = (Statement) conn.createStatement();
			rs = (ResultSet) stmt.executeQuery(sql1);
			while(rs.next()){
				name = rs.getString("name");
				price = rs.getString("price");
				c_store = rs.getString("store");
			}
			b.setName(name);
			b.setPrices(price);
			d.setName(name);
			d.setPrice(price);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			flag = true;
			float num =Float.parseFloat(amount);
			float cstore = Float.parseFloat(c_store);
			if(num<cstore) {
				String sql2 = "update bookinfo set store = store-"+num+"where ISBN="+ISBN;
				stat = (Statement) conn.createStatement();
				rs = stat.executeQuery(sql2);

			}
			else if(num==cstore) {
				flag = true;
				String sql3 = "delete from bookinfo where ISBN="+ISBN;
				stat = (Statement) conn.createStatement();
				rs = stat.executeQuery(sql3);
			}
			else {
				flag = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(flag) {
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

				String sql3 = "insert into deal (ISBN,name,price,amount,d_date) values(?,?,?,?,?)";
				st =(PreparedStatement) conn.prepareStatement(sql3);
				st.setString(1, d.getISBN());
				st.setString(2, d.getName());
				st.setString(3, d.getPrice());
				st.setString(4, d.getAmount());
				st.setString(5, d.getDate());
				int rows = st.executeUpdate();
				System.out.println(rows);
					
				if(rows>0){
					flag= true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("Deal_List.jsp");
		}
		else {
			request.setAttribute("message", "This kind of book is not enough. You can check in here.");
			request.getRequestDispatcher("/Check_In.jsp").forward(request, response);
		}
	}
}
