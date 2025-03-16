package dao;

import context.DBContext;
import dal.Order;
import dal.OrderI;
import dal.OrderVehicle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDao {

    Connection conn = null; // Kết nối với SQL Server
    PreparedStatement ps = null; // Ném câu lệnh query sang SQL Server
    ResultSet rs = null; // Nhận kết quả trả về

    public boolean insertOrder(String customerId, String startDate, String endDate, String totalAmount, String status, String depositPaid, String createdAt) {
        String query = "INSERT INTO RentalOrder (customer_id, start_date, end_date, total_amount, status, deposit_paid, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, customerId);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            ps.setString(4, totalAmount);
            ps.setString(5, status);
            ps.setString(6, depositPaid);
            ps.setString(7, createdAt);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getOrderId(String customerId, String startDate, String endDate, String totalAmount, String status, String depositPaid, String createdAt) {
        String query = "SELECT order_id FROM RentalOrder WHERE customer_id = ? AND start_date = ? AND end_date = ? AND total_amount = ? AND status = ? AND deposit_paid = ? AND created_at = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, customerId);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            ps.setString(4, totalAmount);
            ps.setString(5, status);
            ps.setString(6, depositPaid);
            ps.setString(7, createdAt);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("order_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean insertOrderVehicle(int order_id, int vehicle_id) {
        String query = "INSERT INTO [OrderVehicle] ([order_id], [vehicle_id], [pickup_date], [return_date]) "
                + "VALUES (?, ?, NULL, NULL)";  // Cập nhật giá trị pickup_date và return_date nếu cần

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, order_id);
            ps.setInt(2, vehicle_id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Order> getAllOrderOfCustomerById(int customerId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM RentalOrder WHERE customer_id = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, customerId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getString("order_id"));
                order.setCustomerId(rs.getString("customer_id"));
                order.setStartDate(rs.getString("start_date"));
                order.setEndDate(rs.getString("end_date"));
                order.setTotalAmount(rs.getString("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setDepositPaid(rs.getString("deposit_paid"));
                order.setCreatedAt(rs.getString("created_at"));

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<Order> getAllOrderPending() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM RentalOrder WHERE status = 'pending'"; // Truy vấn không cần customerId

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            // Thực thi truy vấn
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrder_id(rs.getString("order_id"));
                    order.setCustomerId(rs.getString("customer_id"));
                    order.setStartDate(rs.getString("start_date"));
                    order.setEndDate(rs.getString("end_date"));
                    order.setTotalAmount(rs.getString("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setDepositPaid(rs.getString("deposit_paid"));
                    order.setCreatedAt(rs.getString("created_at"));

                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean confirmOrder(int order_id) {
        String query = "UPDATE RentalOrder SET status = 'confirmed' WHERE order_id = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, order_id);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean confirmDeny(int order_id) {
        String query = "UPDATE RentalOrder SET status = 'cancelled' WHERE order_id = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, order_id);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<OrderVehicle> getOrderReturn() {
        List<OrderVehicle> orderVehicles = new ArrayList<>();
        String query = "SELECT * \n"
                + "FROM dbo.OrderVehicle AS o\n"
                + "INNER JOIN RentalOrder AS r ON o.order_id = r.order_id \n"
                + "WHERE r.[status] = 'confirmed';";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderVehicle orderVehicle = new OrderVehicle();
                orderVehicle.setOrderVehicleId(rs.getInt("order_vehicle_id"));
                orderVehicle.setOrderId(rs.getInt("order_id"));
                orderVehicle.setVehicleId(rs.getInt("vehicle_id"));
                orderVehicle.setPickupDate(rs.getDate("pickup_date"));
                orderVehicle.setReturnDate(rs.getDate("return_date"));
                orderVehicles.add(orderVehicle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderVehicles;
    }

    public List<OrderVehicle> getOrderReturnById(int order_id) {
        List<OrderVehicle> orderVehicles = new ArrayList<>();
        String query = "select * from OrderVehicle where order_id='?' and vehicle_id='?'";

        return orderVehicles;
    }

    public boolean updateOrderVehicle(int orderVehicleId, String pickupDate, String returnDate) {
        String query = "UPDATE OrderVehicle SET pickup_date = ?, return_date = ? WHERE order_vehicle_id = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, pickupDate);
            ps.setString(2, returnDate);
            ps.setInt(3, orderVehicleId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        OrderDao orderDao = new OrderDao();

        // Thử nghiệm dữ liệu
        int orderId = 3;  // ID của đơn hàng, có thể lấy từ một số phương thức khác hoặc từ cơ sở dữ liệu

        String returnDate = "2024-12-12";
        String pickUpDate = "2024-12-12";
        // Gọi phương thức và in kết quả
        boolean result = orderDao.updateOrderVehicle(orderId, pickUpDate, returnDate);

        // In kết quả
        if (result) {
            System.out.println("Successfully inserted order vehicle.");
        } else {
            System.out.println("Failed to insert order vehicle.");
        }
    }

}
