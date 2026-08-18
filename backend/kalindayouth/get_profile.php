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

$userId = trim($_POST['user_id'] ?? $_GET['user_id'] ?? '');

$response = ["success" => 0, "message" => "User not found"];

if ($userId === '' || !is_numeric($userId)) {
    $response["message"] = "Valid user_id is required";
    print(json_encode($response));
    mysqli_close($con);
    exit;
}

$userId = (int) $userId;

$sql = "SELECT u.id, u.firstname, u.lastname, u.phonenumber, u.email, u.picture, u.role, u.daycreated,
               d.location, d.education, d.role_title
        FROM users u
        LEFT JOIN user_details d ON d.user_id = u.id
        WHERE u.id = $userId
        LIMIT 1";

$result = mysqli_query($con, $sql);

if ($result && mysqli_num_rows($result) === 1) {
    $user = mysqli_fetch_assoc($result);
    $response = [
        "success" => 1,
        "message" => "Profile fetched successfully",
        "user" => [
            "id" => (int) $user['id'],
            "firstname" => $user['firstname'],
            "lastname" => $user['lastname'],
            "phonenumber" => $user['phonenumber'],
            "email" => $user['email'],
            "picture" => $user['picture'] ?? "",
            "role" => $user['role'] ?? "",
            "daycreated" => $user['daycreated'] ?? "",
            "location" => $user['location'] ?? "",
            "education" => $user['education'] ?? "",
            "role_title" => $user['role_title'] ?? ""
        ]
    ];
}

print(json_encode($response));
mysqli_close($con);
?>
