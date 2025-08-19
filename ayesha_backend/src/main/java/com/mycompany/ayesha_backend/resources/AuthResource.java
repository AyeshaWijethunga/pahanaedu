package com.mycompany.ayesha_backend.resources;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;

@Path("/auth")
public class AuthResource {
    @POST
    @Path("/login")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public Response login(@FormParam("username") String username, @FormParam("password") String password) {
        if ("pahanaedu".equals(username) && "pahanaedu123".equals(password)) {
            // In real projects, use JWT/session etc.
            return Response.ok("{\"status\":\"success\"}").build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).entity("{\"status\":\"fail\"}").build();
        }
    }
}