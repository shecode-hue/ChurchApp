<?php
// Connect to the database

// SQL query to fetch all church finances data
$sql = "SELECT TransactionID, TransactionDate, PastoralFund, Offerings, Thanksgiving, Tithe, Membership, Stationary, Devotions,
        (PastoralFund + Offerings + Thanksgiving + Tithe + Membership + Stationary + Devotions) AS TotalAmount 
        FROM ChurchFinances";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Array to hold the fetched data
    $finances = array();

    // Fetch data row by row
    while($row = $result->fetch_assoc()) {
        // Add each row to the finances array
        $finances[] = $row;
    }

    // Convert the array to JSON and output
    echo json_encode($finances);
} else {
    // If no records found, output empty JSON array
    echo json_encode(array());
}

// Close connection
$conn->close();

?>