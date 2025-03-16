package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
            String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=swp391";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConnection() {
        return connection;
    }

     public static void main(String[] args) {
        // Khởi tạo đối tượng DBContext để thử kết nối
        DBContext dbContext = new DBContext();
        
        // Lấy đối tượng kết nối
        Connection connection = null;
        try {
            connection = dbContext.getConnection();
            
            // Kiểm tra xem kết nối có thành công không
            if (connection != null) {
                System.out.println("Kết nối thành công!");
            } else {
                System.out.println("Kết nối thất bại!");
            }
        } catch (Exception e) {
            System.out.println("Lỗi xảy ra khi cố gắng kết nối: " + e.getMessage());
        } finally {
            // Đảm bảo kết nối được đóng nếu đã được thiết lập
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("Đã đóng kết nối.");
                } catch (SQLException e) {
                    System.out.println("Lỗi khi đóng kết nối: " + e.getMessage());
                }
            }
        }
    }
}
