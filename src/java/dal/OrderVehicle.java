package dal;

import java.sql.Date;

public class OrderVehicle {

    private int orderVehicleId;
    private int orderId;
    private int vehicleId;
    private Date pickupDate;
    private Date returnDate;

    // Constructor
    public OrderVehicle() {
    }

    // Getters and Setters
    public int getOrderVehicleId() {
        return orderVehicleId;
    }

    public void setOrderVehicleId(int orderVehicleId) {
        this.orderVehicleId = orderVehicleId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public Date getPickupDate() {
        return pickupDate;
    }

    public void setPickupDate(Date pickupDate) {
        this.pickupDate = pickupDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    @Override
    public String toString() {
        return "OrderVehicle{" +
                "orderVehicleId=" + orderVehicleId +
                ", orderId=" + orderId +
                ", vehicleId=" + vehicleId +
                ", pickupDate=" + pickupDate +
                ", returnDate=" + returnDate +
                '}';
    }
}
