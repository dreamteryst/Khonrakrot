<?php
// require_once("../config/get_header.php");
// include_once '../config/database.php';
// include_once '../model/news.php';

// $database = new Database();
// $db = $database->getConnection();
// $news = new News($db);

// $news->topic = $_POST["topic"];
// $news->content = $_POST["content"];
// $news->date_post = $_POST["date_post"];

// $result = $news->insert();

// echo $result;

echo $_POST["topic"]." ";
echo $_POST["content"]." ";
echo $_POST["date_post"]." ";
?>