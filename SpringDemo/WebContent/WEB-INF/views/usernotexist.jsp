<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            background-color: #fff;
            padding: 20px 30px;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .error-container h1 {
            color: #ff0000;
            font-size: 24px;
            margin: 0 0 10px 0;
        }
        .error-container p {
            color: #333;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Error</h1>
        <p>User does not exist.</p>
    </div>
</body>
</html>
