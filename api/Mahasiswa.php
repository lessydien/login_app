<?php
class Mahasiswa{
 
    // database connection and table name
    private $conn;
    public $table_name;
 
    // object properties
    
    public $id;
    public $nama;
    public $pass;
    public $alamat;
    
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    function read(){
	
 	$query = "SELECT * FROM ". $this->table_name ;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
 
        return $stmt;
    }

	
    
    function login(){
		$query = "SELECT * FROM ". $this->table_name . " WHERE user= :user AND pass= :pass";
        //echo $this->user."#";
        //echo $this->pass;
        $stmt = $this->conn->prepare($query);
		$stmt->bindParam(":user", $this->user);
		$stmt->bindParam(":pass", $this->pass);
        $stmt->execute(); 
        return $stmt;
    }
		     
}

?>

