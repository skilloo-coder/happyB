<?php
session_start();

if (!isset($_SESSION['roll_number'])) {
    header("location: index.php");
    exit;
}

require_once "config.php";
$roll_number = $_SESSION['roll_number'];
$sql = "SELECT name, branch FROM stddetails WHERE roll_number = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $roll_number);
$stmt->execute();
$stmt->bind_result($name, $branch);
$stmt->fetch();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h2>Welcome, <?php echo htmlspecialchars($name); ?>!</h2>
    <p>Your branch is: <?php echo htmlspecialchars($branch); ?></p>
    <p>Your roll number is: <?php echo htmlspecialchars($roll_number); ?></p>
    <a href="logout.php">Logout</a>
</body>
</html>
<?php
$stmt->close();
$conn->close();
?>
