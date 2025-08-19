package com.mycompany.ayesha_backend.resources;

import com.mycompany.ayesha_backend.model.Item;
import com.mycompany.ayesha_backend.db.DBUtil;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import java.sql.*;
import java.util.*;

@Path("/items")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ItemResource {

    @GET
    public List<Item> getItems(@QueryParam("search") String search) {
        List<Item> items = new ArrayList<>();
        String sql = "SELECT id, name, price, quantity FROM ayesha_items";
        if (search != null && !search.trim().isEmpty()) {
            sql += " WHERE name LIKE ?";
        }
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            if (search != null && !search.trim().isEmpty()) {
                ps.setString(1, "%" + search + "%");
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                items.add(new Item(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getInt("quantity")
                ));
            }
        } catch (SQLException e) {
            throw new WebApplicationException("DB error: " + e.getMessage(), 500);
        }
        return items;
    }

    @POST
    public Item addItem(Item item) {
        String sql = "INSERT INTO ayesha_items (name, price, quantity) VALUES (?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, item.getName());
            ps.setDouble(2, item.getPrice());
            ps.setInt(3, item.getQuantity());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) item.setId(rs.getInt(1));
        } catch (SQLException e) {
            throw new WebApplicationException("DB error: " + e.getMessage(), 500);
        }
        return item;
    }

    @PUT
    @Path("{id}")
    public Item updateItem(@PathParam("id") int id, Item item) {
        String sql = "UPDATE ayesha_items SET name=?, price=?, quantity=? WHERE id=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, item.getName());
            ps.setDouble(2, item.getPrice());
            ps.setInt(3, item.getQuantity());
            ps.setInt(4, id);
            int affected = ps.executeUpdate();
            if (affected == 0) throw new NotFoundException();
            item.setId(id);
        } catch (SQLException e) {
            throw new WebApplicationException("DB error: " + e.getMessage(), 500);
        }
        return item;
    }

    @DELETE
    @Path("{id}")
    public Response deleteItem(@PathParam("id") int id) {
        String sql = "DELETE FROM ayesha_items WHERE id=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int affected = ps.executeUpdate();
            if (affected == 0) throw new NotFoundException();
        } catch (SQLException e) {
            throw new WebApplicationException("DB error: " + e.getMessage(), 500);
        }
        return Response.ok().build();
    }
}