<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once 'database.php';
include_once 'Mahasiswa.php';

$database = new Database();
$db = $database->getConnection();
 
 
// initialize object
$mahasiswa = new Mahasiswa($db);
 

$mahasiswa->table_name = "mahasiswa";	

// query mahasiswa
$stmt = $mahasiswa->read();

$num = $stmt->rowCount();


// check if more than 0 record found
if($num>0){
 
    // mahasiswa array
    $mahasiswa_arr=array();
    $mahasiswa_arr["MahasiswaObject"]=array();
   
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){

        extract($row);
 
        $mahasiswa_item=array(
            "nim" => $nim,
			"user" => $user,
			"pass" => $pass,
            "nama" => $nama,
            "ang" => $ang
        );
		
        array_push($mahasiswa_arr["MahasiswaObject"], $mahasiswa_item);
    }
    
 
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show products data in json format
    echo json_encode($mahasiswa_arr);
}

else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no products found
    echo json_encode(
        array("message" => "Tidak ada data.")
    );
}
 


?>