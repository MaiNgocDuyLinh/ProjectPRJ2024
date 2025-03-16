package dal;

/**
 *
 * @author admin
 */
public class OrderI {

    private String customerId;
    private String startDate;
    private String endDate;
    private String totalAmount;
    private String depositPaid;
    private String createdAt;
    private String status;

    public OrderI() {
    }

    public OrderI(String customerId, String startDate, String endDate, String totalAmount, String depositPaid, String createdAt, String status) {
        this.customerId = customerId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalAmount = totalAmount;
        this.depositPaid = depositPaid;
        this.createdAt = createdAt;
        this.status = status;
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
        return "OrderI{" + "customerId=" + customerId + ", startDate=" + startDate + ", endDate=" + endDate + ", totalAmount=" + totalAmount + ", depositPaid=" + depositPaid + ", createdAt=" + createdAt + ", status=" + status + '}';
    }

}
