<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #cfd9df, #e2ebf0); /* Background gradient */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: rgba(255, 255, 255, 0.5); /* Semi-transparent white background */
            backdrop-filter: blur(10px); /* Blur effect */
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Soft shadow */
            max-width: 400px;
            width: 100%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input {
            width: calc(100% - 12px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        .form-group button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-right: 10px;
        }

        .form-group button:hover {
            background-color: #45a049;
        }

        h2 {
            text-align: center;
            color: #555;
            text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.8);
        }

        .message {
            color: green;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form  action = "sendOtp" method="post">
            <div class="form-group">
                <label for="userId">Username:</label>
                <input type="text" id="userId" name="userId" required>
            </div>
            <div class="form-group">
                <button type="submit">Send OTP</button>
            </div>
        </form>
        <div id="message" class="message"></div>
    </div>
</body>
</html>
