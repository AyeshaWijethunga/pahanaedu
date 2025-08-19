package com.mycompany.ayesha_backend.resources;

import com.mycompany.ayesha_backend.model.OrderHistory;
import com.mycompany.ayesha_backend.model.OrderHistoryItem;
import com.mycompany.ayesha_backend.db.DBUtil;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.sql.*;
import java.util.*;

@Path("/order_history")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class OrderHistoryResource {

    @GET
    public List<OrderHistory> getOrderHistory(
        @QueryParam("customer") String customer,
        @QueryParam("from") String from,
        @QueryParam("to") String to
    ) {
        List<OrderHistory> orders = new ArrayList<>();
        String sql = "SELECT o.id, c.name, c.contact, o.order_time " +
                     "FROM ayesha_orders o " +
                     "JOIN ayesha_pahanaedu c ON o.customer_id = c.id " +
                     "WHERE c.name LIKE ? AND o.order_time BETWEEN ? AND ? " +
                     "ORDER BY o.order_time DESC";
        if (from == null || from.isEmpty()) from = "1900-01-01";
        if (to == null || to.isEmpty()) to = "2100-01-01";
        if (customer == null) customer = "";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + customer + "%");
            ps.setString(2, from);
            ps.setString(3, to);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderHistory order = new OrderHistory();
                order.setId(rs.getInt("id"));
                order.setCustomerName(rs.getString("name"));
                order.setCustomerContact(rs.getString("contact"));
                order.setOrderTime(rs.getString("order_time"));
                order.setItems(getOrderItems(rs.getInt("id"), con));
                orders.add(order);
            }
        } catch (SQLException e) {
            throw new WebApplicationException("DB error: " + e.getMessage(), 500);
        }
        return orders;
    }

    private List<OrderHistoryItem> getOrderItems(int orderId, Connection con) throws SQLException {
        List<OrderHistoryItem> items = new ArrayList<>();
        String sql = "SELECT i.name, oi.price, oi.quantity " +
                     "FROM ayesha_order_items oi " +
                     "JOIN ayesha_items i ON oi.item_id = i.id " +
                     "WHERE oi.order_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                items.add(new OrderHistoryItem(rs.getString("name"), rs.getDouble("price"), rs.getInt("quantity")));
            }
        }
        return items;
    }

    @DELETE
    @Path("{id}")
    public Response deleteOrder(@PathParam("id") int id) {
        try (Connection con = DBUtil.getConnection()) {
            // Delete order items first
            try (PreparedStatement ps = con.prepareStatement("DELETE FROM ayesha_order_items WHERE order_id = ?")) {
                ps.setInt(1, id);
                ps.executeUpdate();
            }
            // Delete order
            try (PreparedStatement ps = con.prepareStatement("DELETE FROM ayesha_orders WHERE id = ?")) {
                ps.setInt(1, id);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            throw new WebApplicationException("DB error: " + e.getMessage(), 500);
        }
        return Response.ok().build();
    }
}