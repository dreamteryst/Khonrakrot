<?php
class Database{
    private $conn;
    private $host = "10.199.66.227";
    private $dbname = "sec01_flop";
    private $username = "Sec01_Flop";
    private $password = "Fs3P7s0T";

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