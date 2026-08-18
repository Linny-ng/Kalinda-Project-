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

$userId = trim($_POST['user_id'] ?? '');
$firstname = trim($_POST['firstname'] ?? '');
$lastname = trim($_POST['lastname'] ?? '');
$phonenumber = trim($_POST['phonenumber'] ?? '');
$email = trim($_POST['email'] ?? '');
$location = trim($_POST['location'] ?? '');
$education = trim($_POST['education'] ?? '');
$roleTitle = trim($_POST['role_title'] ?? '');

$response = ["success" => 0, "message" => "Profile update failed"];

if ($userId === '' || !is_numeric($userId)) {
    $response["message"] = "Valid user_id is required";
    print(json_encode($response));
    mysqli_close($con);
    exit;
}

$userId = (int) $userId;

$firstname = mysqli_real_escape_string($con, $firstname);
$lastname = mysqli_real_escape_string($con, $lastname);
$phonenumber = mysqli_real_escape_string($con, $phonenumber);
$email = mysqli_real_escape_string($con, $email);
$location = mysqli_real_escape_string($con, $location);
$education = mysqli_real_escape_string($con, $education);
$roleTitle = mysqli_real_escape_string($con, $roleTitle);

$duplicateSql = "SELECT id FROM users
                 WHERE (email = '$email' OR phonenumber = '$phonenumber')
                 AND id != $userId
                 LIMIT 1";
$duplicateResult = mysqli_query($con, $duplicateSql);

if ($duplicateResult && mysqli_num_rows($duplicateResult) > 0) {
    $response["message"] = "Email or phone number already in use";
    print(json_encode($response));
    mysqli_close($con);
    exit;
}

$updateUserSql = "UPDATE users
                  SET firstname = '$firstname',
                      lastname = '$lastname',
                      phonenumber = '$phonenumber',
                      email = '$email'
                  WHERE id = $userId";

$userUpdated = mysqli_query($con, $updateUserSql);

$detailsCheckSql = "SELECT id FROM user_details WHERE user_id = $userId LIMIT 1";
$detailsCheck = mysqli_query($con, $detailsCheckSql);

if ($detailsCheck && mysqli_num_rows($detailsCheck) === 1) {
    $updateDetailsSql = "UPDATE user_details
                         SET location = '$location',
                             education = '$education',
                             role_title = '$roleTitle'
                         WHERE user_id = $userId";
    $detailsUpdated = mysqli_query($con, $updateDetailsSql);
} else {
    $updateDetailsSql = "INSERT INTO user_details (user_id, location, education, role_title)
                         VALUES ($userId, '$location', '$education', '$roleTitle')";
    $detailsUpdated = mysqli_query($con, $updateDetailsSql);
}

if ($userUpdated && $detailsUpdated) {
    $response = [
        "success" => 1,
        "message" => "Profile updated successfully"
    ];
} else {
    $response["message"] = "Update error: " . mysqli_error($con);
}

print(json_encode($response));
mysqli_close($con);
?>
