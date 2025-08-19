package com.mycompany.ayesha_backend.resources;

import com.mycompany.ayesha_backend.model.Customer;
import com.mycompany.ayesha_backend.db.DBUtil;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.sql.*;
import java.util.*;

@Path("/customers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CustomerResource {

    @GET
    public List<Customer> getCustomers(@QueryParam("search") String search) {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT id, name, contact FROM ayesha_pahanaedu";
        if (search != null && !search.trim().isEmpty()) {
            sql += " WHERE name LIKE ? OR contact LIKE ?";
        }
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            if (search != null && !search.trim().isEmpty()) {
                ps.setString(1, "%" + search + "%");
                ps.setString(2, "%" + search + "%");
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customers.add(new Customer(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("contact")
                ));
            }
        } catch (SQLException e) {
            throw new WebApplicationException("DB error", 500);
        }
        return customers;
    }
    
        @GET
    @Path("/search")
    public Customer getCustomerByPhone(@QueryParam("phone") String phone) {
        String sql = "SELECT id, name, contact FROM ayesha_pahanaedu WHERE contact = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt("id"), rs.getString("name"), rs.getString("contact"));
            }
        } catch (SQLException e) {
            throw new WebApplicationException("DB error", 500);
        }
        return null; // Not found
    }

    @POST
    public Customer addCustomer(Customer customer) {
        String sql = "INSERT INTO ayesha_pahanaedu (name, contact) VALUES (?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getContact());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) customer.setId(rs.getInt(1));
        } catch (SQLException e) {
            throw new WebApplicationException("DB error", 500);
        }
        return customer;
    }

    @PUT
    @Path("{id}")
    public Customer updateCustomer(@PathParam("id") int id, Customer customer) {
        String sql = "UPDATE ayesha_pahanaedu SET name=?, contact=? WHERE id=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getContact());
            ps.setInt(3, id);
            int affected = ps.executeUpdate();
            if (affected == 0) throw new NotFoundException();
            customer.setId(id);
        } catch (SQLException e) {
            throw new WebApplicationException("DB error", 500);
        }
        return customer;
    }

    @DELETE
    @Path("{id}")
    public Response deleteCustomer(@PathParam("id") int id) {
        String sql = "DELETE FROM ayesha_pahanaedu WHERE id=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int affected = ps.executeUpdate();
            if (affected == 0) throw new NotFoundException();
        } catch (SQLException e) {
            throw new WebApplicationException("DB error", 500);
        }
        return Response.ok().build();
    }
}