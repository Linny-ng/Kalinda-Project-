CREATE DATABASE IF NOT EXISTS youthdetails;
USE youthdetails;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    phonenumber VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    picture VARCHAR(255) DEFAULT 'default.png',
    role VARCHAR(50) DEFAULT 'youth',
    daycreated DATETIME DEFAULT CURRENT_TIMESTAMP,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    location VARCHAR(255) DEFAULT '',
    education VARCHAR(255) DEFAULT '',
    role_title VARCHAR(100) DEFAULT 'Youth Member',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
