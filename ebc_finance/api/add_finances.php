<?php
// Retrieve the raw POST data
$input = file_get_contents('php://input');

// Decode the JSON data
$data = json_decode($input, true);

// Connect to the database

// Prepare and execute the SQL query to insert the finance record
$sql = "INSERT INTO ChurchFinances (TransactionDate, PastoralFund, Offerings, Thanksgiving, Tithe, Membership, Stationary, Devotions) 
        VALUES ('{$data['TransactionDate']}', '{$data['PastoralFund']}', '{$data['Offerings']}', '{$data['Thanksgiving']}', '{$data['Tithe']}', '{$data['Membership']}', '{$data['Stationary']}', '{$data['Devotions']}')";

if (mysqli_query($conn, $sql)) {
    echo "Record inserted successfully";
} else {
    echo "Error inserting record: " . mysqli_error($conn);
}

// Close the database connection
mysqli_close($conn);
?>