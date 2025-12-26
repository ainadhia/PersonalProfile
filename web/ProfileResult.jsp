<%-- 
    Document   : ProfileResult
    Created on : Nov 18, 2025, 12:39:28 AM
    Author     : Aina
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Your Profile</title>
        <link rel="stylesheet" href="profileStudent.css">
    </head>
    <body>

        <div class="profile-container">
            <h2>Your Profile</h2>

            <div class="info-item">
                <strong>Name</strong>
                <span>${profile.name}</span>
            </div>

            <div class="info-item">
                <strong>Student ID</strong>
                <span>${profile.studentId}</span>
            </div>

            <div class="info-item">
                <strong>Program</strong>
                <span>${profile.program}</span>
            </div>

            <div class="info-item">
                <strong>Email</strong>
                <span>${profile.email}</span>
            </div>

            <div class="info-item">
                <strong>Hobbies</strong>
                <span>${profile.hobbies}</span>
            </div>

            <div class="info-item">
                <strong>About You</strong>
                <span>${profile.intro}</span>
            </div>

            <a href="profileForm.html">Back to Form</a>
        </div>

    </body>
</html>


