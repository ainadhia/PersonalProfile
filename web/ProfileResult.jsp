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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, sans-serif;
                background-color: #f8f4f1; /* match first page */
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
                padding: 20px;
            }

            .profile-container {
                background-color: #ffffff; 
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(107, 91, 149, 0.05); /* match first page shadow */
                max-width: 550px;
                width: 100%;
            }

            h2 {
                color: #6b5b95; /* match first page heading color */
                text-align: center;
                margin-bottom: 30px;
                font-size: 28px;
            }

            .info-item {
                display: flex;
                align-items: flex-start;
                gap: 15px;
                padding: 15px;
                margin-bottom: 15px;
                background: #fafafa; /* light neutral background */
                border-radius: 12px;
                border-left: 4px solid #6b5b95; /* match first page accent */
            }

            .info-item i {
                color: #6b5b95; /* match first page icon color */
                font-size: 20px;
                margin-top: 3px;
                width: 25px;
                text-align: center;
            }

            .info-content strong {
                display: block;
                color: #6b5b95;
                font-size: 12px;
                text-transform: uppercase;
                margin-bottom: 5px;
                letter-spacing: 0.5px;
            }

            .info-content span {
                color: #333;
                font-size: 15px;
                line-height: 1.5;
            }

            .back-button {
                width: 100%;
                padding: 14px;
                background-color: #f7cac9; /* match first page button */
                color: white;
                border: none;
                border-radius: 10px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                text-decoration: none;
                display: block;
                text-align: center;
                margin-top: 25px;
                transition: all 0.3s;
            }

            .back-button:hover {
                background-color: #f1948a; /* match first page button hover */
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(241, 148, 138, 0.3);
            }
        </style>
    </head>
    <body>
        <div class="profile-container">
            <h2>Your Profile</h2>

            <div class="info-item">
                <i class="fas fa-user"></i>
                <div class="info-content">
                    <strong>Name</strong>
                    <span>${name}</span>
                </div>
            </div>

            <div class="info-item">
                <i class="fas fa-id-card"></i>
                <div class="info-content">
                    <strong>Student ID</strong>
                    <span>${studentId}</span>
                </div>
            </div>

            <div class="info-item">
                <i class="fas fa-graduation-cap"></i>
                <div class="info-content">
                    <strong>Program</strong>
                    <span>${program}</span>
                </div>
            </div>

            <div class="info-item">
                <i class="fas fa-envelope"></i>
                <div class="info-content">
                    <strong>Email</strong>
                    <span>${email}</span>
                </div>
            </div>

            <div class="info-item">
                <i class="fas fa-heart"></i>
                <div class="info-content">
                    <strong>Hobbies</strong>
                    <span>${hobbies}</span>
                </div>
            </div>

            <div class="info-item">
                <i class="fas fa-pen"></i>
                <div class="info-content">
                    <strong>About You</strong>
                    <span>${intro}</span>
                </div>
            </div>

            <a class="back-button" href="profileForm.html">Back to Form</a>
        </div>
    </body>
</html>

