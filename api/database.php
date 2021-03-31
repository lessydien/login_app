
<?php
class Database{
 
    // database server information
    private  $host = "localhost";
    private  $port = 3306;
    private  $db_name = "akademik";
    private  $username = "root";
    private  $password = "";
    public   $conn;
	
    // get the database connection
    public function getConnection(){
 
        $this->conn = null;
 
        try{
            $this->conn = new PDO("mysql:host=" . $this->host .";port=".$this->port. ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
             //echo "Connection: succeded";
			 
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }
 
        return $this->conn;
    }

 

}
?>