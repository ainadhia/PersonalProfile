/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profile;

/**
 *
 * @author Aina
 */
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class editProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        String name = request.getParameter("name");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/studentProfile",
                "aina",
                "aina"
            );

            String sql = "UPDATE profile SET name=?, program=?, email=?, hobbies=?, intro=? WHERE student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, program);
            ps.setString(3, email);
            ps.setString(4, hobbies);
            ps.setString(5, intro);
            ps.setString(6, studentId);

            ps.executeUpdate();
            ps.close();
            conn.close();

            // Redirect back to the profile view
            response.sendRedirect("viewProfiles.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating profile: " + e.getMessage());
        }
    }
}