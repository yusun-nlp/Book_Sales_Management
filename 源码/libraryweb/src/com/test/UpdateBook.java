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
@WebServlet("/UpdateBook")
public class UpdateBook extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		doPost(request, response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String ISBN = request.getParameter("ISBN");
		String name = request.getParameter("name");
		String press = request.getParameter("press");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String store = request.getParameter("store");
		
		Book b = new  Book();
		
		b.setISBN(ISBN);
		b.setName(name);
		b.setPress(press);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStore(store);
		
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
		Statement stat = null;
		String Password = null;
		String rights = null;
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
			String sql1 = "delete from bookinfo where ISBN="+ISBN;
			stat = (Statement) conn.createStatement();
			stat.executeQuery(sql1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {

			String sql = "insert into bookinfo (ISBN,name,press,author,price,store) values(?,?,?,?,?,?)";
			st =(PreparedStatement) conn.prepareStatement(sql);
			st.setString(1, b.getISBN());
			st.setString(2, b.getName());
			st.setString(3, b.getPress());
			st.setString(4, b.getAuthor());
			st.setString(5, b.getPrice());
			st.setString(6, b.getStore());
			int rows = st.executeUpdate();
			System.out.println(rows);
				
			if(rows>0){
				flag= true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(flag) {
			response.sendRedirect("Book_List.jsp");
		}
		else {
			response.sendRedirect("Edit_Book.jsp");
		}
	}
}
