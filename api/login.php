<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once 'database.php';
include_once 'Mahasiswa.php';
include_once 'saltdata.php';

$database = new Database();
$db = $database->getConnection();
 
 
// initialize object
$mahasiswa = new Mahasiswa($db);
 
// get posted data
   $datax = json_decode(file_get_contents("php://input"));
//   $datax = $datax->CustomerObject;

   //foreach($datax as $data){
	//print_r($datax);
	if(isset( $datax->user)) {
		$pass = crypt($datax->pass, $salt);
		//echo $pass;
		$mahasiswa->user = $datax->user;
		$mahasiswa->pass = $pass;
	}
    // set product property values
    
	$mahasiswa->table_name  = "mahasiswa";
    $stmt = $mahasiswa->login();
	
	if($stmt->rowCount() == 1 ) {
		http_response_code(200);
		echo json_encode(array("login" => 1));
    }
    else {
		http_response_code(404);
		echo json_encode(array("login" => 0));
    }
  

?>