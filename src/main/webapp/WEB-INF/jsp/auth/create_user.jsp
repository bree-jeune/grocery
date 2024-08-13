<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create User</title>
</head>
<body>
<h2>Create User</h2>
<form action="create" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <label for="role">Role:</label>
    <input type="text" id="role" name="role" required><br>

    <button type="submit">Create User</button>
</form>
<a href="/admin/users">Back to User List</a>
</body>
</html>
