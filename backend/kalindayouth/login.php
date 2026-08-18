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

$identifier = trim($_POST['identifier'] ?? $_GET['identifier'] ?? $_GET['phonenumber'] ?? '');
$password = $_POST['password'] ?? $_GET['password'] ?? '';

$response = ["success" => 0, "message" => "Invalid credentials"];

if ($identifier === '' || $password === '') {
    $response["message"] = "Email/phone and password are required";
    print(json_encode($response));
    mysqli_close($con);
    exit;
}

$identifier = mysqli_real_escape_string($con, $identifier);

$sql = "SELECT id, firstname, lastname, phonenumber, email, picture, password
        FROM users
        WHERE email = '$identifier' OR phonenumber = '$identifier'
        LIMIT 1";

$result = mysqli_query($con, $sql);

if ($result && mysqli_num_rows($result) === 1) {
    $user = mysqli_fetch_assoc($result);
    $storedPassword = $user['password'];
    $passwordValid = password_verify($password, $storedPassword) || $password === $storedPassword;

    if ($passwordValid) {
        unset($user['password']);
        $response = [
            "success" => 1,
            "message" => "Login successful",
            "data" => [
                "id" => (int) $user['id'],
                "firstname" => $user['firstname'],
                "lastname" => $user['lastname'],
                "phonenumber" => $user['phonenumber'],
                "email" => $user['email'],
                "picture" => $user['picture'] ?? ""
            ]
        ];
    }
}

print(json_encode($response));
mysqli_close($con);
?>
