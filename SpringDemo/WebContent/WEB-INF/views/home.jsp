<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .button-container {
            text-align: center;
        }
        button {
            display: block;
            width: 200px;
            margin: 10px auto;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="button-container">
        <button onclick="register()">Registration</button>
        <button onclick="login('1')">Customer Login</button>
        <button onclick="login('2')">Owner Login</button>
    </div>
    <script>
        function createAndSubmitForm(action, hiddenFields) {
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = action;

            for (const name in hiddenFields) {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = name;
                input.value = hiddenFields[name];
                form.appendChild(input);
            }

            document.body.appendChild(form);
            form.submit();
        }

        function register() {
            createAndSubmitForm('goforregi', {});
        }

        function login(userType) {
            createAndSubmitForm('goforlogin', { userType: userType });
        }
    </script>
</body>
</html>
