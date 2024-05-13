<?php
// Retrieve the raw POST data
$input = file_get_contents('php://input');

// Decode the JSON data
$data = json_decode($input, true);

// Connect to the database

// Prepare and execute the SQL query to delete the finance record
$sql = "DELETE FROM ChurchFinances WHERE TransactionID = '{$data['TransactionID']}'";

if (mysqli_query($conn, $sql)) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . mysqli_error($conn);
}

// Close the database connection
mysqli_close($conn);
?>