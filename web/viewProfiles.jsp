<%-- 
    Document   : viewProfiles
    Created on : Dec 26, 2025
    Author     : Aina
--%>

<%-- 
    Document   : viewProfiles
    Created on : Dec 26, 2025
    Author     : Aina
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>All Profiles</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, sans-serif;
                background-color: #f8f4f1;
                margin: 0;
                padding: 20px;
            }
            h2 {
                color: #6b5b95;
                text-align: center;
            }
            form {
                text-align: center;
                margin-bottom: 20px;
            }
            input[type="text"] {
                padding: 10px 12px;
                width: 300px;
                border-radius: 8px;
                border: 1.5px solid #dcdcdc;
                margin-right: 10px;
                font-size: 14px;
            }
            button {
                padding: 10px 18px;
                background-color: #6b5b95;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 14px;
                transition: all 0.3s;
            }
            button:hover {
                background-color: #58477c;
            }
            table {
                border-collapse: collapse;
                width: 95%;
                margin: 0 auto;
                background-color: white;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 8px 25px rgba(107, 91, 149, 0.1);
            }
            th, td {
                padding: 12px 15px;
                border-bottom: 1px solid #eee;
                text-align: left;
            }
            th {
                background-color: #6b5b95;
                color: white;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            a.action-link {
                margin-right: 8px;
                text-decoration: none;
                font-size: 16px;
                color: #6b5b95;
            }
            a.delete-link {
                color: #e74c3c;
            }
            a.back-button {
                display: inline-block;
                margin: 20px auto;
                padding: 12px 25px;
                background-color: #f7cac9;
                color: white;
                text-decoration: none;
                border-radius: 10px;
                font-weight: 600;
                transition: all 0.3s;
            }
            a.back-button:hover {
                background-color: #f1948a;
            }
        </style>
    </head>
    <body>
        <h2>All Profiles</h2>

        <form method="get">
            <input type="text" name="search" placeholder="Search Here" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
            <button type="submit"><i class="fas fa-search"></i> Search</button>
        </form>

        <table>
            <tr>
                <th>Name</th>
                <th>Student ID</th>
                <th>Program</th>
                <th>Email</th>
                <th>Hobbies</th>
                <th>About</th>
                <th>Action</th>
            </tr>

            <%
                String search = request.getParameter("search");

                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                Connection conn = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/studentProfile",
                    "aina",
                    "aina"
                );

                String sql = "SELECT * FROM profile";
                if (search != null && !search.isEmpty()) {
                    sql += " WHERE LOWER(name) LIKE ? OR LOWER(student_id) LIKE ? OR LOWER(program) LIKE ? OR LOWER(email) LIKE ? OR LOWER(hobbies) LIKE ? OR LOWER(intro) LIKE ?";
                }

                PreparedStatement ps = conn.prepareStatement(sql);
                if (search != null && !search.isEmpty()) {
                    String keyword = "%" + search.toLowerCase() + "%";
                    ps.setString(1, keyword);
                    ps.setString(2, keyword);
                    ps.setString(3, keyword);
                    ps.setString(4, keyword);
                    ps.setString(5, keyword);
                    ps.setString(6, keyword);
                }

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String studentId = rs.getString("student_id");
            %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= studentId %></td>
                <td><%= rs.getString("program") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("hobbies") %></td>
                <td><%= rs.getString("intro") %></td>
                <td>
                    <!--<a class="action-link" href="#"><i class="fas fa-toggle-on"></i></a>-->
                    <a class="action-link" href="editProfile.jsp?studentId=<%= studentId %>"><i class="fas fa-pen"></i></a>
                    <a class="action-link delete-link" href="DeleteProfileServlet?studentId=<%= studentId %>" onclick="return confirm('Are you sure you want to delete this profile?');"><i class="fas fa-trash"></i></a>
                </td>
            </tr>
            <%
                }
                rs.close();
                ps.close();
                conn.close();
            %>
        </table>

        <div style="text-align:center;">
            <a class="back-button" href="index.html"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </body>
</html>


