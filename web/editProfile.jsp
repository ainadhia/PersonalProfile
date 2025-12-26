<%-- 
    Document   : editProfile
    Created on : Dec 26, 2025, 9:01:06 PM
    Author     : Aina
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentId = request.getParameter("studentId");
    String name = "", program = "", email = "", hobbies = "", intro = "";

    if (studentId != null) {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection(
            "jdbc:derby://localhost:1527/studentProfile",
            "aina",
            "aina"
        );

        String sql = "SELECT * FROM profile WHERE student_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, studentId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            program = rs.getString("program");
            email = rs.getString("email");
            hobbies = rs.getString("hobbies");
            intro = rs.getString("intro");
        }
        rs.close();
        ps.close();
        conn.close();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #f8f4f1;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(107, 91, 149, 0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #6b5b95;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1.5px solid #dcdcdc;
            border-radius: 8px;
            font-size: 14px;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #6b5b95;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #58477c;
        }
        a.back-button {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #f7cac9;
            text-decoration: none;
            font-weight: 600;
        }
        a.back-button:hover {
            color: #f1948a;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Profile</h2>
        <form action="editProfileServlet" method="post">
            <input type="hidden" name="studentId" value="<%= studentId %>">
            <input type="text" name="name" placeholder="Full Name" value="<%= name %>" required>
            <input type="text" name="program" placeholder="Program" value="<%= program %>" required>
            <input type="email" name="email" placeholder="Email" value="<%= email %>" required>
            <input type="text" name="hobbies" placeholder="Hobbies" value="<%= hobbies %>">
            <textarea name="intro" placeholder="About yourself"><%= intro %></textarea>
            <button type="submit"><i class="fas fa-save"></i> Save Changes</button>
        </form>
        <a class="back-button" href="viewProfiles.jsp"><i class="fas fa-arrow-left"></i> Back</a>
    </div>
</body>
</html>

