package profile;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentId = request.getParameter("studentId");

        if (studentId != null && !studentId.isEmpty()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/studentProfile",
                    "aina",
                    "aina"
                );

                String sql = "DELETE FROM profile WHERE student_id=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, studentId);
                ps.executeUpdate();

                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("viewProfiles.jsp"); // Go back to profiles list
    }
}
