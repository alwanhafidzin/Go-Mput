<?php 
	include"../inc/config.php"; 
	validate_admin_not_login("login.php");
	
	
	if(!empty($_GET)){
		if($_GET['act'] == 'delete'){
			
			$q = mysqli_query($koneksi,"delete from kontak WHERE id='$_GET[id]'");
			if($q){ alert("Success"); redir("kontak.php"); }
		}  
	}
	include"inc/header.php";
	
?> 
	
	<div class="container">
		<?php
			$q = mysqli_query($koneksi,"select*from kontak");
			$j = mysqli_num_rows($q);
		?>
		<h4>Daftar Kontak Masuk (<?php echo ($j>0)?$j:0; ?>)</h4>
		<hr>

		<table class="table table-striped table-hove"> 
			<thead> 
				<tr> 
					<th>#</th> 
					<th>Nama</th> 
					<th>Email</th> 
					<th>Subjek</th> 
					<th>Pesan</th> 
					<th>Action</th> 
				</tr> 
			</thead> 
			<tbody> 
				

			
			
		<?php while($data=mysqli_fetch_object($q)){ ?> 
				<tr> 
					<th scope="row"><?php echo $no++; ?></th> 
					<td><?php echo $data->nama ?></td> 
					<td><?php echo $data->email ?></td> 
					<td><?php echo $data->subjek ?></td> 
					<td><?php echo $data->pesan ?></td> 
					<td>
						<a class="btn btn-sm btn-danger" href="kontak.php?act=delete&&id=<?php echo $data->id ?>">Delete</a>
					</td> 
				</tr>
		<?php } ?>
			</tbody> 
		</table> 
    </div> <!-- /container -->
	
<?php include"inc/footer.php"; ?>