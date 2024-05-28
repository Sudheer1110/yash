<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Owner View</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .navbar {
            background-color: #333;
            color: #fff;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            margin-right: 15px;
            font-size: 18px;
        }
        .navbar .nav-left {
            display: flex;
            align-items: center;
        }
        .profile-button {
            position: absolute;
            top: 60px;
            left: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .profile-button:hover {
            background-color: #0056b3;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #888;
            width: 300px;
            border-radius: 10px;
        }
        .modal-header {
            font-size: 20px;
            margin-bottom: 15px;
        }
        .modal-body {
            margin-bottom: 15px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .edit-button, .save-button {
            padding: 10px 20px;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .edit-button {
            background-color: #28a745;
        }
        .edit-button:hover {
            background-color: #218838;
        }
        .save-button {
            background-color: #ffc107;
            display: none;
        }
        .save-button:hover {
            background-color: #e0a800;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        .hidden {
            display: none;
        }
        .houses-container {
            padding: 20px;
            margin-top: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .houses-container h3 {
            color: #333;
        }
        .house-item {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .house-item h4 {
            margin-top: 0;
            color: #555;
        }
        .house-item p {
            margin: 5px 0;
            color: #777;
        }
        .add-house-button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        .add-house-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="nav-left">
            <a href="#home">Home</a>
            <a href="#pennant-rent">Pennant Rent</a>
        </div>
    </div>
    <button class="profile-button" id="viewProfileBtn">Profile</button>
    <div id="profileModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal">&times;</span>
            <div class="modal-header">User Details</div>
            <div class="modal-body">
                <p><strong>Id:</strong> <span id="userIdText">${userId}</span><input type="text" id="userIdInput" class="hidden" value="${userId}"></p>
                <p><strong>Name:</strong> <span id="userNameText">${username}</span><input type="text" id="userNameInput" class="hidden" value="${username}"></p>
                <p><strong>Email:</strong> <span id="userEmailText">${usermail}</span><input type="text" id="userEmailInput" class="hidden" value="${usermail}"></p>
                <p><strong>Phone:</strong> <span id="userPhoneText">${userphone}</span><input type="text" id="userPhoneInput" class="hidden" value="${userphone}"></p>
                <p><strong>Pincode:</strong> <span id="userPincodeText">${userpincode}</span><input type="text" id="userPincodeInput" class="hidden" value="${userpincode}"></p>
            </div>
            <button class="edit-button" id="editProfileBtn">Edit</button>
            <button class="save-button" id="saveProfileBtn">Save</button>
        </div>
    </div>
    <div id="housesContent1" class="houses-container">
    <h3>Your Houses</h3>
    <c:forEach var="house" items="${houseDetailsList}">
        <div class="house-item">
            <h4>${house.nameofapartment}</h4>
            <p>Door Number: <span>${house.doornumber}</span></p>
            <p>Type of House: <span>${house.typeofhouse}</span></p>
            <p>Number of Rooms: <span>${house.noofrooms}</span></p>
            <p>Location: Latitude: <span>${house.latitude}</span>, Longitude: <span>${house.longitude}</span></p>
            <p>Availability: <span>${house.availability_status ? 'Not Available' : 'Available'}</span></p>
             <button class="add-house-button" id="removeHouseBtn_${house.id}" onclick="removeHouse(${house.id})">Remove House</button>
        </div>
    </c:forEach>
    <form action="addhouse" method="get">
        <button type="submit" class="add-house-button">Add House</button>
    </form>
</div>

       <script>
        var modal = document.getElementById("profileModal");
        var btn = document.getElementById("viewProfileBtn");
        var span = document.getElementById("closeModal");
        var editBtn = document.getElementById("editProfileBtn");
        var saveBtn = document.getElementById("saveProfileBtn");
        var addHouseBtn = document.getElementById("addHouseBtn");
        var userIdText = document.getElementById("userIdText");
        var userIdInput = document.getElementById("userIdInput");
        var userNameText = document.getElementById("userNameText");
        var userNameInput = document.getElementById("userNameInput");
        var userEmailText = document.getElementById("userEmailText");
        var userEmailInput = document.getElementById("userEmailInput");
        var userPhoneText = document.getElementById("userPhoneText");
        var userPhoneInput = document.getElementById("userPhoneInput");
        var userPincodeText = document.getElementById("userPincodeText");
        var userPincodeInput = document.getElementById("userPincodeInput");
        btn.onclick = function() {
            modal.style.display = "flex";
        }
        span.onclick = function() {
            modal.style.display = "none";
            resetEditMode();
        }
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
                resetEditMode();
                }
            }
            editBtn.onclick = function() {
                enableEditMode();
            }
            saveBtn.onclick = function() {
                saveChanges();
                sendToController();
                disableEditMode();
            }
            function enableEditMode() {
                userNameText.classList.add("hidden");
                userNameInput.classList.remove("hidden");
                userEmailText.classList.add("hidden");
                userEmailInput.classList.remove("hidden");
                userPhoneText.classList.add("hidden");
                userPhoneInput.classList.remove("hidden");
                userPincodeText.classList.add("hidden");
                userPincodeInput.classList.remove("hidden");
                editBtn.style.display = "none";
                saveBtn.style.display = "inline-block";
            }
            function disableEditMode() {
                userNameText.classList.remove("hidden");
                userNameInput.classList.add("hidden");
                userEmailText.classList.remove("hidden");
                userEmailInput.classList.add("hidden");
                userPhoneText.classList.remove("hidden");
                userPhoneInput.classList.add("hidden");
                userPincodeText.classList.remove("hidden");
                userPincodeInput.classList.add("hidden");
                editBtn.style.display = "inline-block";
                saveBtn.style.display = "none";
            }
            function saveChanges() {
                userIdText.innerText = userIdInput.value;
                userNameText.innerText = userNameInput.value;
                userEmailText.innerText = userEmailInput.value;
                userPhoneText.innerText = userPhoneInput.value;
                userPincodeText.innerText = userPincodeInput.value;
            }
            function resetEditMode() {
                userNameInput.value = userNameText.innerText;
                userEmailInput.value = userEmailText.innerText;
                userPhoneInput.value = userPhoneText.innerText;
                userPincodeInput.value = userPincodeText.innerText;
                disableEditMode();
            }
            function sendToController() {
                var userId = userIdInput.value;
                var username = userNameInput.value;
                var usermail = userEmailInput.value;
                var userphone = userPhoneInput.value;
                var userpincode = userPincodeInput.value;

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "setUpdate", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                var params = "userId=" + encodeURIComponent(userId) +
                             "&username=" + encodeURIComponent(username) +
                             "&usermail=" + encodeURIComponent(usermail) +
                             "&userphone=" + encodeURIComponent(userphone) +
                             "&userpincode=" + encodeURIComponent(userpincode);

                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            console.log("User data updated successfully!");
                        } else {
                            console.error("Error updating user data:", xhr.status);
                        }
                    }
                };
                xhr.send(params);
            }
            document.addEventListener("DOMContentLoaded", function() {
                loadHouses();
            });
            function loadHouses() {
                fetch("getHouses")
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Failed to fetch houses data.");
                        }
                        return response.text();
                    })
                    .then(data => {
                        document.getElementById("").innerHTML = data;
                    })
                    .catch(error => {
                        console.error("Error fetching houses:", error);
                    });
            }
            function removeHouse(houseId) {
                var confirmation = confirm("Are you sure you want to remove this house?");
                if (confirmation) {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "housedelete", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    var params = "houseId=" + encodeURIComponent(houseId);

                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                console.log("House deleted successfully!");
                                // Optionally, update the UI or reload house list
                                loadHouses(); // Reload houses after deletion
                            } else {
                                console.error("Error deleting house:", xhr.status);
                            }
                        }
                    };
                    xhr.send(params);
                }
            }

         
        </script>
    </body>
</html>       