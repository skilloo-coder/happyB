<?php
require_once "config.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_POST['user_id'];
    $password = $_POST['password'];

    $sql = "SELECT roll_number, password FROM userdata WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $user_id);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 1) {
        $stmt->bind_result($roll_number, $hashed_password);
        $stmt->fetch();
        if (password_verify($password, $hashed_password)) {
            $_SESSION['roll_number'] = $roll_number;
            header("location: welcome.php");
        } else {
            echo "Invalid password.";
        }
    } else {
        echo "No account found with that user ID.";
    }

    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body  ><center><div  >
    <h2>Login</h2>
    <form method="POST">
        User ID: <input type="text" name="user_id" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
    <p>New user? <a href="register.php">Register here</a></p>
</div></center>
</body>
</html>
