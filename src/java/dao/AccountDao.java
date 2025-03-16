package dao;

import context.DBContext;
import dal.Account;
import dal.AccountSignUp;
import dal.CusInformation;
import dal.Customer;
import dal.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class AccountDao {

    Connection conn = null; // Kết nối với SQL Server
    PreparedStatement ps = null; // Ném câu lệnh query sang SQL Server
    ResultSet rs = null; // Nhận kết quả trả về

    public boolean signUp(AccountSignUp account) {
        String query = "INSERT INTO [dbo].[User] ([username], [email], [password_hash]) VALUES (?, ?, ?); "
                + "INSERT INTO [dbo].[UserRole] ([user_id], [role_id]) VALUES (SCOPE_IDENTITY(), 1);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Set thông tin user vào câu lệnh
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getEmail());
            ps.setString(3, account.getPassword());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

//    public boolean insertCusId(int user_id) {
//
//    }
//    public boolean updateInformation() {
//
//    }
    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public boolean checkAccount(Account account, String role) {
        String query = "SELECT u.user_id, u.username, u.email, r.role_name "
                + "FROM [User] u "
                + "JOIN UserRole ur ON u.user_id = ur.user_id "
                + "JOIN Role r ON ur.role_id = r.role_id "
                + "WHERE (u.username = ? OR u.email = ?) AND u.password_hash = ? AND r.role_name = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getUsername());
            ps.setString(3, account.getPassword());
            ps.setString(4, role); // Kiểm tra vai trò

            rs = ps.executeQuery();

            // Nếu tìm thấy bản ghi, trả về true
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public List<User> getAllUser() {
        String query = "SELECT u.[user_id], u.[username], u.[email], r.[role_name] "
                + "FROM [dbo].[User] u "
                + "JOIN [dbo].[UserRole] ur ON u.[user_id] = ur.[user_id] "
                + "JOIN [dbo].[Role] r ON ur.[role_id] = r.[role_id] "
                + "WHERE r.[role_name] IN ('user')";

        List<User> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return list;
    }

    public int getUserId(String userOrEmail, String password) {
        String query = "SELECT user_id FROM [User] WHERE (username = ? OR email = ?) AND password_hash = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, userOrEmail);
            ps.setString(2, userOrEmail);
            ps.setString(3, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("user_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // 0 neu khong tim thay
    }

    public List<CusInformation> getCusInformation(int userId) {
        String query = "SELECT * FROM Customer WHERE user_id = ?";
        List<CusInformation> cusInfoList = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            // Set giá trị cho user_id trong câu truy vấn
            ps.setInt(1, userId); // Set user_id

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {

                    CusInformation cusInfo = new CusInformation(
                            rs.getString("user_id"),
                            rs.getString("full_name"),
                            rs.getString("phone_number"),
                            rs.getString("address"),
                            rs.getString("driving_license_number"),
                            rs.getString("date_of_birth"));

                    cusInfoList.add(cusInfo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cusInfoList;
    }

    public boolean insertCustomerInformation(int userId, String fullName, String phoneNumber, String address, String drivingLicenseNumber, String dateOfBirth) {
        String query = "INSERT INTO [dbo].[Customer] "
                + "([user_id], [full_name], [phone_number], [address], [driving_license_number], [date_of_birth]) "
                + "VALUES (?, ?, ?, ?, ?, ?)"; // Dùng câu lệnh INSERT thay vì UPDATE

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setInt(1, userId);
            ps.setString(2, fullName);
            ps.setString(3, phoneNumber);
            ps.setString(4, address);
            ps.setString(5, drivingLicenseNumber);
            ps.setString(6, dateOfBirth);

            // Thực thi câu lệnh INSERT
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Nếu có ít nhất một dòng bị ảnh hưởng, trả về true
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Nếu có lỗi xảy ra, trả về false
        }
    }

    public boolean checkInformation(int userId) {
        String sql = "SELECT * FROM Customer WHERE user_id = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId); // Set user_id cho câu truy vấn

            rs = ps.executeQuery();

            if (rs.next()) {

                String fullName = rs.getString("full_name");
                String phoneNumber = rs.getString("phone_number");
                String drivingLicense = rs.getString("driving_license_number");

                // Nếu có bất kỳ trường nào là null hoặc rỗng, thì trả về false
                return fullName != null && !fullName.isEmpty() && phoneNumber != null && !phoneNumber.isEmpty() && drivingLicense != null && !drivingLicense.isEmpty();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; // Trả về false nếu không tìm thấy thông tin khách hàng
    }

    public int getCusId(int userId) {
        String query = "SELECT customer_id FROM Customer WHERE user_id = ?";
        int customerId = -1; // Giá trị mặc định nếu không tìm thấy

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    customerId = rs.getInt("customer_id"); // Lấy giá trị customer_id
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerId; // Trả về giá trị tìm thấy hoặc -1
    }

    public static void main(String[] args) {
        AccountDao accountDao = new AccountDao();
        List<User> users = accountDao.getAllUser();
        if (users != null && !users.isEmpty()) {
            for (User user : users) {
                System.out.println("ID: " + user.getUser_id());
                System.out.println("Username: " + user.getUsername());
                System.out.println("Email: " + user.getEmail());
                System.out.println("Role: " + user.getRole());
                System.out.println("-------------------------");
            }
        } else {
            System.out.println("No users found.");
        }
    }
}
