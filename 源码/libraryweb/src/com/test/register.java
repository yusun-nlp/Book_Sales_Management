package com.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
@WebServlet("/register")
public class register extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		doPost(request, response);
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String un=request.getParameter("UserID");
		String pswd1 = request.getParameter("Password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		
		String pswd = encode2hex(pswd1);
		
		User u = new  User();
		
		u.setUserID(un);
		u.setPassword(pswd);
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
			String sql = "insert into Administrator (UserID,Password,rights,name,gender,age) values(?,?,?,?,?,?)";
			st =(PreparedStatement) conn.prepareStatement(sql);
			st.setString(1, u.getUserID());
			st.setString(2, u.getPassword());
			st.setString(3, "normal");
			st.setString(4, u.getName());
			st.setString(5, u.getGender());
			st.setString(6, u.getAge());
			int rows = st.executeUpdate();
			System.out.println(rows);
				
			if(rows>0){
				flag= true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(flag) {
			 request.setAttribute("message", "Creation successes!");
			 request.getRequestDispatcher("/Account_List.jsp").forward(request, response);
		}
		else {
			 request.setAttribute("message", "Creation fails. Please check if your UserID has existed.");
			 request.getRequestDispatcher("/Create_Account.jsp").forward(request, response);
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
