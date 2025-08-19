package com.mycompany.ayesha_backend.resources;

import com.mycompany.ayesha_backend.model.Order;
import com.mycompany.ayesha_backend.model.OrderItem;
import com.mycompany.ayesha_backend.model.Customer;
import com.mycompany.ayesha_backend.db.DBUtil;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Path("/orders")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class OrderResource {

    @POST
    public Order addOrder(Order order) {
        Connection con = null;
        PreparedStatement psOrder = null, psOrderItem = null, psCustomer = null;
        ResultSet rsOrder = null, rsCustomer = null;
        try {
            con = DBUtil.getConnection();
            con.setAutoCommit(false);

            int customerId = order.getCustomerId();
            String customerName = order.getCustomerName();
            String customerContact = order.getCustomerContact();

            // If customerId == 0, register new customer
            if (customerId == 0 && customerName != null && customerContact != null) {
                String sqlCust = "INSERT INTO ayesha_pahanaedu (name, contact) VALUES (?, ?)";
                psCustomer = con.prepareStatement(sqlCust, Statement.RETURN_GENERATED_KEYS);
                psCustomer.setString(1, customerName);
                psCustomer.setString(2, customerContact);
                psCustomer.executeUpdate();
                rsCustomer = psCustomer.getGeneratedKeys();
                if (rsCustomer.next()) customerId = rsCustomer.getInt(1);
            }

            // Insert into ayesha_orders
            String orderTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            String sqlOrder = "INSERT INTO ayesha_orders (customer_id, order_time) VALUES (?, ?)";
            psOrder = con.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, customerId);
            psOrder.setString(2, orderTime);
            psOrder.executeUpdate();
            rsOrder = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rsOrder.next()) orderId = rsOrder.getInt(1);

            // Insert items
            String sqlItem = "INSERT INTO ayesha_order_items (order_id, item_id, quantity, price) VALUES (?, ?, ?, ?)";
            psOrderItem = con.prepareStatement(sqlItem);
            for (OrderItem item : order.getItems()) {
                psOrderItem.setInt(1, orderId);
                psOrderItem.setInt(2, item.getItemId());
                psOrderItem.setInt(3, item.getQuantity());
                psOrderItem.setDouble(4, item.getPrice());
                psOrderItem.addBatch();

                // Update quantity in ayesha_items
                try (PreparedStatement psUpdate = con.prepareStatement("UPDATE ayesha_items SET quantity = quantity - ? WHERE id = ? AND quantity >= ?")) {
                    psUpdate.setInt(1, item.getQuantity());
                    psUpdate.setInt(2, item.getItemId());
                    psUpdate.setInt(3, item.getQuantity());
                    int updated = psUpdate.executeUpdate();
                    if (updated == 0) throw new WebApplicationException("Insufficient stock", 400);
                }
            }
            psOrderItem.executeBatch();

            con.commit();

            // Set order info back
            order.setId(orderId);
            order.setCustomerId(customerId);
            order.setOrderTime(orderTime);
            return order;
        } catch (Exception e) {
            try { if (con != null) con.rollback(); } catch (Exception ex) {}
            throw new WebApplicationException("DB error: " + e.getMessage(), 500);
        } finally {
            try { if (rsOrder != null) rsOrder.close(); } catch (Exception e) {}
            try { if (psOrder != null) psOrder.close(); } catch (Exception e) {}
            try { if (psOrderItem != null) psOrderItem.close(); } catch (Exception e) {}
            try { if (psCustomer != null) psCustomer.close(); } catch (Exception e) {}
            try { if (rsCustomer != null) rsCustomer.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}