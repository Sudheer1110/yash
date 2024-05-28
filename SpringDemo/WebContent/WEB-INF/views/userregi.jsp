<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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

        .form-group input,
        .form-group select {
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
        }

        .form-group button:hover {
            background-color: #45a049;
        }

        h2 {
            text-align: center;
            color: #555;
            text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.8);
        }
    </style>
 <script>
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            } else {
                document.getElementById("userpincode").value = "Geolocation is not supported by this browser.";
            }
        }

        function showPosition(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            var apiUrl = `https://nominatim.openstreetmap.org/reverse?lat=${latitude}&lon=${longitude}&format=json`;

            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to fetch data from OpenStreetMap API');
                    }
                    return response.json();
                })
                .then(data => {
                    var postalCode = getPostalCode(data);
                    document.getElementById("userpincode").value = postalCode;
                    console.log(postalCode);
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                    document.getElementById("userpincode").value = "Failed to fetch data from OpenStreetMap API";
                });
        }

        function getPostalCode(data) {
            if (data && data.address && data.address.postcode) {
                return data.address.postcode;
            } else {
                return 'Postal code not found';
            }
        }

        function showError(error) {
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    document.getElementById("userpincode").value = "User denied the request for Geolocation.";
                    break;
                case error.POSITION_UNAVAILABLE:
                    document.getElementById("userpincode").value = "Location information is unavailable.";
                    break;
                case error.TIMEOUT:
                    document.getElementById("userpincode").value = "The request to get user location timed out.";
                    break;
                case error.UNKNOWN_ERROR:
                    document.getElementById("userpincode").value = "An unknown error occurred.";
                    break;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>User Registration Form</h2>
        <form action="addUser" method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" maxlength="255" required>
            </div>
            <div class="form-group">
                <label for="userphone">Phone Number:</label>
                <input type="text" id="userphone" name="userphone" maxlength="20" required>
            </div>
            <div class="form-group">
                <label for="usermail">Email:</label>
                <input type="email" id="usermail" name="usermail" maxlength="255" required>
            </div>
            <div class="form-group">
                <label for="usertypeid">User Type:</label>
                <select id="usertypeid" name="usertypeid" required>
                    <option value="1">Customer</option>
                    <option value="2">Owner</option>
                </select>
            </div>
            <div class="form-group">
                <label for="userpincode">Pincode:</label>
                <input type="text" id="userpincode" name="userpincode" maxlength="10" required>
                <button type="button" onclick="getLocation()">Get Current Pincode</button>
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>
    </div>
</body>
</html>
