package com.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * Servlet implementation class register
 */
@WebServlet("/UpdateAccount")
public class UpdateAccount extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		doPost(request, response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String usr = request.getParameter("UserID");
		String pswd1 = request.getParameter("Password");
		String right = request.getParameter("rights");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		
		String Password = encode2hex(pswd1);
		
		List<Map> list =new ArrayList<Map>();

		User u = new  User();
		
		u.setUserID(usr);
		u.setPassword(Password);
		u.setName(name);
		u.setGender(gender);
		u.setAge(age);
		
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
		Statement stmt = null,st1=null;
		ResultSet rs = null;
		Statement stat = null;
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
			String sql1 = "select * from Administrator where UserID=" + usr;
			stmt = (Statement) conn.createStatement();
			rs = (ResultSet) stmt.executeQuery(sql1);
			while(rs.next()){
				rights = rs.getString("rights");
			}
			u.setRights(rights);
			
			String sql2 = "delete from Administrator where UserID="+usr;
			stat = (Statement) conn.createStatement();
			stat.executeQuery(sql2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {

			String sql = "insert into Administrator (UserID,Password,rights,name,gender,age) values(?,?,?,?,?,?)";
			st =(PreparedStatement) conn.prepareStatement(sql);
			st.setString(1, u.getUserID());
			st.setString(2, u.getPassword());
			st.setString(3, u.getRights());
			st.setString(4, u.getName());
			st.setString(5, u.getGender());
			st.setString(6, u.getAge());
			System.out.println(u.getUserID());
			System.out.println(u.getPassword());
			int rows = st.executeUpdate();
			System.out.println(rows);
				
			if(rows>0){
				flag= true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
			String sql3 = "select * from Administrator where UserID="+usr;
			st1 = (Statement) conn.createStatement();
			rs = (ResultSet) st1.executeQuery(sql3);
			Map map = new HashMap(); 
			while(rs.next()){
					rights=rs.getString("rights");
					String UserID = rs.getString("UserID");
					name = rs.getString("name");
					gender = rs.getString("gender");
					age = rs.getString("age");
					map.put("UserID", UserID);
					map.put("Password", Password);
					map.put("rights", rights);
					map.put("name", name);
					map.put("gender", gender);
					map.put("age", age);
					list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(right.equals("super")) {
			response.sendRedirect("Account_List.jsp");
		}else {
			request.setAttribute("list",list);
			 request.getRequestDispatcher("/Normal_Account.jsp").forward(request, response);
		}
	}
	private String encode2hex(String source) {
		// TODO Auto-generated method stub
		byte[] data = encode2bytes(source);
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < data.length; i++) {
			String hex = Integer.toHexString(0xff & data[i]);

			if (hex.length() == 1) {
				hexString.append('0');
			}

			hexString.append(hex);
		}

		return hexString.toString();
	}

	private byte[] encode2bytes(String source) {
		// TODO Auto-generated method stub
		byte[] result = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.reset();
			md.update(source.getBytes("UTF-8"));
			result = md.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return result;
	}
}
