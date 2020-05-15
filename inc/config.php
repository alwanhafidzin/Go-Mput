<?php 
	session_start();
	
	$koneksi = mysqli_connect("localhost","root","","gomput");
 
   // Check connection
   if (mysqli_connect_errno()){
	echo "Koneksi database gagal : " . mysqli_connect_error();
}
	
	// settings
	$url = "http://localhost/gomput/";
	$title = "Go-Mput";
	$no = 1;
	
	function alert($command){
		echo "<script>alert('".$command."');</script>";
	}
	function redir($command){
		echo "<script>document.location='".$command."';</script>";
	}
	function validate_admin_not_login($command){
		if(empty($_SESSION['iam_admin'])){
			redir($command);
		}
	}
?>
