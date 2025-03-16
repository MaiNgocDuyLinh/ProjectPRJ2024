/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author admin
 */
public class Customer {

    private String customer_id;
    private String user_id;
    private String full_name;
    private String phone_number;
    private String address;
    private String driving_license_number;
    private String date_of_birth;

    public Customer() {
    }

    public Customer(String customer_id, String user_id, String full_name, String phone_number, String address, String driving_license_number, String date_of_birth) {
        this.customer_id = customer_id;
        this.user_id = user_id;
        this.full_name = full_name;
        this.phone_number = phone_number;
        this.address = address;
        this.driving_license_number = driving_license_number;
        this.date_of_birth = date_of_birth;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDriving_license_number() {
        return driving_license_number;
    }

    public void setDriving_license_number(String driving_license_number) {
        this.driving_license_number = driving_license_number;
    }

    public String getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    @Override
    public String toString() {
        return "Customer{" + "customer_id=" + customer_id + ", user_id=" + user_id + ", full_name=" + full_name + ", phone_number=" + phone_number + ", address=" + address + ", driving_license_number=" + driving_license_number + ", date_of_birth=" + date_of_birth + '}';
    }

}
