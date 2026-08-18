<?php
require 'connect.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

$firstname = trim($_POST['firstname'] ?? '');
$lastname = trim($_POST['lastname'] ?? '');
$phonenumber = trim($_POST['phonenumber'] ?? '');
$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

$response = ["success" => 0, "message" => "Registration failed"];

if ($firstname === '' || $lastname === '' || $phonenumber === '' || $email === '' || $password === '') {
    $response["message"] = "All fields are required";
    print(json_encode($response));
    mysqli_close($con);
    exit;
}

$firstname = mysqli_real_escape_string($con, $firstname);
$lastname = mysqli_real_escape_string($con, $lastname);
$phonenumber = mysqli_real_escape_string($con, $phonenumber);
$email = mysqli_real_escape_string($con, $email);
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);
$defaultPicture = 'default.png';
$defaultRole = 'youth';

$checkSql = "SELECT id FROM users WHERE email = '$email' OR phonenumber = '$phonenumber' LIMIT 1";
$checkResult = mysqli_query($con, $checkSql);

if ($checkResult && mysqli_num_rows($checkResult) > 0) {
    $response["message"] = "Email or phone number already registered";
    print(json_encode($response));
    mysqli_close($con);
    exit;
}

$insertUserSql = "INSERT INTO users (firstname, lastname, phonenumber, email, picture, role, daycreated, password)
                  VALUES ('$firstname', '$lastname', '$phonenumber', '$email', '$defaultPicture', '$defaultRole', NOW(), '$hashedPassword')";

if (mysqli_query($con, $insertUserSql)) {
    $userId = mysqli_insert_id($con);

    $insertDetailsSql = "INSERT INTO user_details (user_id, location, education, role_title)
                         VALUES ($userId, '', '', 'Youth Member')";

    if (mysqli_query($con, $insertDetailsSql)) {
        $response = [
            "success" => 1,
            "message" => "User registered successfully",
            "user_id" => (int) $userId
        ];
    } else {
        $response["message"] = "User created but profile details failed: " . mysqli_error($con);
    }
} else {
    $response["message"] = "Failed to register user: " . mysqli_error($con);
}

print(json_encode($response));
mysqli_close($con);
?>
