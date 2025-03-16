/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author admin
 */
public class Order {

    private String order_id;
    private String customerId;
    private String startDate;
    private String endDate;
    private String totalAmount;
    private String depositPaid;
    private String createdAt;
    private String status;

    public Order() {
    }

    public Order(String order_id, String customerId, String startDate, String endDate, String totalAmount, String depositPaid, String createdAt, String status) {
        this.order_id = order_id;
        this.customerId = customerId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalAmount = totalAmount;
        this.depositPaid = depositPaid;
        this.createdAt = createdAt;
        this.status = status;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getDepositPaid() {
        return depositPaid;
    }

    public void setDepositPaid(String depositPaid) {
        this.depositPaid = depositPaid;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", customerId=" + customerId + ", startDate=" + startDate + ", endDate=" + endDate + ", totalAmount=" + totalAmount + ", depositPaid=" + depositPaid + ", createdAt=" + createdAt + ", status=" + status + '}';
    }

}
