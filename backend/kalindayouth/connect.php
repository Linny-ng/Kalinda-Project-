<?php
$con = mysqli_connect("localhost", "root", "", "youthdetails");

if (!$con) {
    header("Content-Type: application/json");
    print(json_encode([
        "success" => 0,
        "message" => "Database connection failed: " . mysqli_connect_error()
    ]));
    exit;
}

mysqli_set_charset($con, "utf8mb4");
?>
