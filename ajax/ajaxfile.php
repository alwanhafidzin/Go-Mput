<?php
include "../inc/config.php";

$data = json_decode(file_get_contents("php://input"));

$request = $data->request;

// Mengirim data kontak
if($request == 2){
	$nama = $data->nama;
	$email = $data->email;
	$subjek = $data->subjek;
	$pesan = $data->pesan;
    mysqli_query($koneksi,"insert into kontak Values(NULL,'$nama','$email','$subjek','$pesan')");
	alert("Sukses");
	exit;
}

?>