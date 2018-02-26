<?php
// header('Content-Type: application/json; charset=utf-8');

// $conn = mysql_connect('localhost', '', '');
// if(!empty($conn)) {
//     mysql_select_db('sec01_flop');
//     echo json_encode(array('message' => 'success'));
// }
$servername = "localhost";
$username = "Sec01_Flop";
$password = "Fs3P7s0T";
$dbname = "sec01_flop";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT topic FROM news";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
        echo json_encode($result->fetch_assoc());
} else {
    echo "0 results";
}
$conn->close();
?>