package com.mycompany.ayesha_backend.model;

import java.util.List;

public class OrderHistory {
    private int id;
    private String customerName;
    private String customerContact;
    private String orderTime;
    private List<OrderHistoryItem> items;

    public OrderHistory() {}
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public String getCustomerContact() { return customerContact; }
    public void setCustomerContact(String customerContact) { this.customerContact = customerContact; }
    public String getOrderTime() { return orderTime; }
    public void setOrderTime(String orderTime) { this.orderTime = orderTime; }
    public List<OrderHistoryItem> getItems() { return items; }
    public void setItems(List<OrderHistoryItem> items) { this.items = items; }
}