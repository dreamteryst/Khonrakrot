<?php
require_once("../config/get_header.php");
include_once '../config/database.php';
include_once '../model/news.php';

$database = new Database();
$db = $database->getConnection();
$news = new News($db);

$result = $news->read();

echo $result;
?>