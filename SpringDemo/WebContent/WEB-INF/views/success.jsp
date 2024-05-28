<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
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
            text-align: center;
        }

        h2 {
            color: #4CAF50;
        }

        p {
            color: #555;
        }

        .link-btn {
            margin-top: 20px;
        }

        .link-btn a {
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .link-btn a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registration Successful!</h2>
        <p>Thank you for registering your house/apartment.</p>
        <div class="link-btn">
           <form action="gotohome" method="get">
        <button type="submit" class="link-btn">Add House</button>
         </form>
        </div>
    </div>
</body>
</html>
