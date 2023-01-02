package jdbc_test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;
	
		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/train_db";
			String dbUser = "root";
			String dbPass = "1q2w3e4r!";
			String query = "SELECT NUMBER, NAME, location, address, tel, noEmployees, noTrains \r\n"
					+ "FROM self_join AS self, stations AS stat \r\n"
					+ "WHERE self.baseStationId = stat.id;";
			
			// DB Connection 생성
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			// Statement 생성
			stmt = conn.createStatement();
			// Query 실행
			result = stmt.executeQuery(query);

			while(result.next()) {
				String number = result.getString("NUMBER");
				String name = result.getString("NAME");
				String location = result.getString("location");
				String address = result.getString("address");
				String tel = result.getString("tel");
				int noEmployees = result.getInt("noEmployees");
				int noTrains = result.getInt("noTrains");
				
				System.out.println(number + "\t" + name + "\t" + location + "\t" + 
						address + "\t\t" + tel + "\t" + noEmployees + "\t" + noTrains);

			}			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				result.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}
}
