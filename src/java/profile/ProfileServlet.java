package profile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");

        ProfileBean profile = new ProfileBean();
        profile.setName(name);
        profile.setStudentId(studentId);
        profile.setProgram(program);
        profile.setEmail(email);
        profile.setHobbies(hobbies);
        profile.setIntro(intro);

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/studentProfile",
                "aina",
                "aina"
            );

            String sql = "INSERT INTO profile (name, student_id, program, email, hobbies, intro) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, profile.getName());
            ps.setString(2, profile.getStudentId());
            ps.setString(3, profile.getProgram());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getHobbies());
            ps.setString(6, profile.getIntro());

            ps.executeUpdate();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
//        request.setAttribute("profile", profile);
//        request.getRequestDispatcher("ProfileResult.jsp").forward(request, response);

           response.sendRedirect("viewProfiles.jsp");
    }
    

}
