package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public PreparedStatement psmtt;
	public ResultSet rs;

	
	public JDBConnect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/musthave";
			String id = "musthave";
			String pwd = "jsk281988";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(기본 생성자)");
			Statement st = con.createStatement();
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공(인수 생성자 1)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("mysqlDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("mysqlURL");
		 	String id = application.getInitParameter("mysqlId");
		 	String pwd = application.getInitParameter("mysqlPwd");
		 	con = DriverManager.getConnection(url,id,pwd);
		 	
		 	System.out.println("DB 연결 성공(인수 생성자 2)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		JDBConnect jdbconnect = new JDBConnect();
		
	}
	
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(stmt !=null) stmt.close();
			if(psmt != null) psmt.close();
//			if(psmtt != null) psmtt.close();
			if(con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
