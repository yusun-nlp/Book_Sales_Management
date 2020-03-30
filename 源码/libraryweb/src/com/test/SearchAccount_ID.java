package com.test;

import java.awt.print.Book;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class login
 */
@WebServlet("/SearchAccount_ID")
public class SearchAccount_ID extends HttpServlet {
	
	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
 
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<Map> list =new ArrayList<Map>();
		
		String n=request.getParameter("ID");
		
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
		Statement st = null;
		ResultSet rs = null;
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
			String sql = "select * from Administrator where ID="+n;
			
			st = (Statement) conn.createStatement();
			rs = (ResultSet) st.executeQuery(sql);
				
			while(rs.next()){
				flag = true;
				String UserID = rs.getString("UserID");
				String rights = rs.getString("rights");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				String ID = rs.getString("ID");
				String age = rs.getString("age");
				
				Map map = new HashMap(); 
				map.put("UserID", UserID);
				map.put("rights", rights);
				map.put("name", name);
				map.put("gender", gender);
				map.put("ID", ID);
				map.put("age", age);
				list.add(map);
				for (Map map_1 :list) {
					System.out.println(map_1);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(flag == true) {
			request.setAttribute("list",list);
			request.getRequestDispatcher("/Search_Account.jsp").forward(request, response);
		}
		else {
			request.setAttribute("list",list);
			request.setAttribute("message", "Fails! There is no such ID.");
			request.getRequestDispatcher("/Search_Account.jsp").forward(request, response);
		}
	}

}
