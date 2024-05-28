<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rent House Registration</title>
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

        .coordinates {
            display: flex;
            align-items: center;
        }

        .coordinates input {
            flex: 1;
            margin-right: 10px;
        }

        h2 {
            text-align: center;
            color: #555;
            text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.8);
        }

        .address-display {
            margin-top: 10px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Rent House Registration</h2>
        <form action="dataOfHouseToAdd" method="POST">
            <div class="form-group">
                <label for="houseName">Name of House or Apartment:</label>
                <input type="text" id="houseName" name="houseName" maxlength="255" required>
            </div>
            <div class="form-group">
                <label for="houseType">Type of House:</label>
                <select id="houseType" name="houseType" required>
                    <option value="">Select Type</option>
                    <option value="1">Resort</option>
                    <option value="2">Flat</option>
                    <option value="3">Villa</option>
                    <option value="4">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="rooms">Number of Rooms:</label>
                <select id="rooms" name="rooms" required>
                    <option value="">Select Rooms</option>
                    <option value="1">1BHK</option>
                    <option value="2">2BHK</option>
                    <option value="3">3BHK</option>
                    <option value="4">4BHK</option>
                </select>
            </div>
            <div class="form-group">
                <label for="doornumber">Door/Flat Number:</label>
                <input type="text" id="doornumber" name="doornumber" maxlength="10" required>
            </div>
            <div class="form-group">
                <label>Location Coordinates:</label>
                <div class="coordinates">
                    <input type="text" id="latitude" name="latitude" placeholder="Latitude" maxlength="20" required>
                    <input type="text" id="longitude" name="longitude" placeholder="Longitude" maxlength="20" required>
                    <input type="text" id="pincode" name="pincode" placeholder="Pin Code" maxlength="10" required>
                    <button type="button" onclick="getCurrentLocation()">Get Current Coordinates</button>
                </div>
            </div>
            <div class="form-group">
                <label for="availability_status">Availability Status:</label>
                <select id="availability_status" name="availability_status" required>
                    <option value="true">Available</option>
                    <option value="false">Not Available</option>
                </select>
            </div>
            <div id="address" class="address-display"></div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>
    </div>

    <script>
        function getCurrentLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

        function showPosition(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            var pincodeField = document.getElementById("pincode");

            document.getElementById("latitude").value = latitude.toFixed(6); // Limiting to 6 decimal places
            document.getElementById("longitude").value = longitude.toFixed(6);
        }


        function showError(error) {
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    alert("User denied the request for Geolocation.");
                    break;
                case error.POSITION_UNAVAILABLE:
                    alert("Location information is unavailable.");
                    break;
                case error.TIMEOUT:
                    alert("The request to get user location timed out.");
                    break;
                case error.UNKNOWN_ERROR:
                    alert("An unknown error occurred.");
                    break;
            }
        }
    </script>
</body>
</html>
