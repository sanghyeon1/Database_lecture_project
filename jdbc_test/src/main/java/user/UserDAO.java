package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db2";
			String dbUser = "root";
			String dbPass = "1q2w3e4r!";
			
			Class.forName("org.mariadb.jdbc.Driver");
			conn=DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String query = "SELECT password FROM USER WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}
				else
					return 0; // 로그인 실패(비밀번호 불일치)
			}
			
			return -1;  //ID가 존재하지 않음.
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2; // -2는 DB 오류.
	}
}
