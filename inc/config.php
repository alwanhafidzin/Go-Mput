<?php 
	session_start();
	//$koneksi=mysqli_connect("localhost", "root", "");
	//$hasil=mysqli_select_db($koneksi,"catering");
	
	$koneksi = mysqli_connect("localhost","root","","catering");
 
   // Check connection
   if (mysqli_connect_errno()){
	echo "Koneksi database gagal : " . mysqli_connect_error();
}
	
	// settings
	$url = "http://localhost/Go-Mput/";
	$title = "Website Pemesanan Katering";
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
