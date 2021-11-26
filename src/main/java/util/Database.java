package util;

import java.sql.*;

// Database 관련 class
public class Database {
	// 
	public static Connection oracleConnect() {
		
		Connection con = null;
		
		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		// 2.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, db_id, db_pw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// 오버 로딩 
	// executeQuery 문 사용 후 객체 close 메소드 (SELECT 문 사용시)
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
			try {
				if(rs		!= null) rs.close();
				if(pstmt	!= null) pstmt.close();
				if(con	!= null) con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
	}
	// executeUpdate 문 사용 후 객체 close 메소드 (INSERT 문 사용시)
	public static void close(PreparedStatement pstmt, Connection con) {
			try {
				if(pstmt	!= null) pstmt.close();
				if(con	!= null) con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
	}
}
