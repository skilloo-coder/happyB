<?php
require_once "config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $roll_number = $_POST['roll_number'];
    $user_id = $_POST['user_id'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $name = $_POST['name'];
    $branch = $_POST['branch'];

    $conn->begin_transaction();
    try {
        $sql1 = "INSERT INTO userdata (roll_number, user_id, password) VALUES (?, ?, ?)";
        $stmt1 = $conn->prepare($sql1);
        $stmt1->bind_param("sss", $roll_number, $user_id, $password);
        $stmt1->execute();

        $sql2 = "INSERT INTO stddetails (roll_number, name, branch) VALUES (?, ?, ?)";
        $stmt2 = $conn->prepare($sql2);
        $stmt2->bind_param("sss", $roll_number, $name, $branch);
        $stmt2->execute();

        $conn->commit();
        echo "Registration successful. <a href='index.php'>Login here</a>";
        
        $stmt1->close();
        $stmt2->close();
    } catch (Exception $e) {
        $conn->rollback();
        echo "Error: " . $e->getMessage();
    }

    $conn->close();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
    <h2>Register</h2>
    <form method="POST">
        Roll Number: <input type="text" name="roll_number" required><br>
        User ID: <input type="text" name="user_id" required><br>
        Password: <input type="password" name="password" required><br>
        Name: <input type="text" name="name" required><br>
        Branch: <input type="text" name="branch" required><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>
