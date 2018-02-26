<?php
class News{
    private $conn;
    private $table_name = "news";
 
    // object properties
    public $id_news;
    public $topic;
    public $content;
    public $date_post;
    public $lastupdate;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    public function read () {
        $query = "SELECT * FROM "
            .$this->table_name;

        $stmt = $this->conn->prepare($query);
        $news_arr = array();
        try {
            $stmt->execute();

            $rowCount = $stmt->rowCount();
            $news_arr["success"] = true;
            
            if ($rowCount > 0) {
                $news_arr["message"] = array();
                while($rows = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($rows);
                    $news_item = array(
                        "id_news" => $id_news,
                        "topic" => $topic,
                        "content" => $content,
                        "date_post" => $date_post,
                        "lastupdate" => $lastupdate
                    );
                    array_push($news_arr["message"], $news_item);
                }
                return json_encode(
                    $news_arr
                );
            } else {
                $news_arr["message"] = "news is empty.";
                return json_encode(
                    $news_arr
                );
            }
        } catch (PDOException $e) {
            $news_arr["success"] = false;
            $news_arr["message"] = $e->getMessage();
            return json_encode(
                $news_arr
            );
        }
    }

    public function readLimit ($start, $end) {
   
        $query = "SELECT * FROM "
            .$this->table_name.
            " LIMIT :start,:end";
        $stmt = $this->conn->prepare($query);

        $stmt->bindValue(':start', (int) trim($start), PDO::PARAM_INT);
        $stmt->bindValue(':end', (int) trim($end), PDO::PARAM_INT);

        $news_arr = array();
        try {
            $stmt->execute();

            $rowCount = $stmt->rowCount();
            $news_arr["success"] = true;
            
            if ($rowCount > 0) {
                $news_arr["message"] = array();
                while($rows = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($rows);
                    $news_item = array(
                        "id_news" => $id_news,
                        "topic" => $topic,
                        "content" => $content,
                        "date_post" => $date_post,
                        "lastupdate" => $lastupdate
                    );
                    array_push($news_arr["message"], $news_item);
                }
                return json_encode(
                    $news_arr
                );
            } else {
                $news_arr["message"] = "news is empty.";
                return json_encode(
                    $news_arr
                );
            }
        } catch (PDOException $e) {
            $news_arr["success"] = false;
            $news_arr["message"] = $e->getMessage();
            return json_encode(
                $news_arr
            );
        }
    }

    public function insert(){
        $query = "INSERT INTO `news`(`topic`, `content`, `date_post`) VALUES  (?,?,?)";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1,$this->topic);
        $stmt->bindParam(2,$this->content);
        $stmt->bindParam(3,$this->date_post);
        
        try {
            $stmt->execute();
            $rowCount = $stmt->rowCount();
            $news_arr["success"] = true;
            $news_arr["message"] = $rowCount. " row(s) inserted.";
            return json_encode(
                $news_arr
            );
        } catch (PDOException $e) {
            $news_arr["success"] = false;
            $news_arr["message"] = $e->getMessage();
            return json_encode(
                $news_arr
            );
        }
    }
}