<?php
// Retrieve the raw POST data
$input = file_get_contents('php://input');

// Decode the JSON data
$data = json_decode($input, true);

// Connect to the database

// Prepare and execute the SQL query to update the finance data
$sql = "UPDATE ChurchFinances SET 
        TransactionDate = '{$data['TransactionDate']}',
        PastoralFund = '{$data['PastoralFund']}',
        Offerings = '{$data['Offerings']}',
        Thanksgiving = '{$data['Thanksgiving']}',
        Tithe = '{$data['Tithe']}',
        Membership = '{$data['Membership']}',
        Stationary = '{$data['Stationary']}',
        Devotions = '{$data['Devotions']}'
        WHERE TransactionID = '{$data['TransactionID']}'";

if (mysqli_query($conn, $sql)) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . mysqli_error($conn);
}

// Close the database connection
mysqli_close($conn);
?>