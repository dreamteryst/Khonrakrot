<?php
class Database{
    private $conn;
    private $host = "localhost";
    private $dbname = "sec01_flop";
    private $username = "root";
    private $password = "";

    public function getConnection(){
        $this->conn = null;
        try{
            $this->conn = new PDO(
                "mysql:host="
                .$this->host.
                ";dbname="
                .$this->dbname, $this->username, $this->password
            );
            $this->conn->exec("set names utf8");

        }catch(PDOException $e){
            echo "Connection error: " .$e->getMessage();
        }
        return $this->conn;
    }
}
?>