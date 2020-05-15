<?php 
	include"inc/config.php";
	include"layout/header.php";	
?> 

<script src="assets/vue/vue.js"></script>
<script src='assets/vue/axios.min.js'></script>
		 
		<div class="col-md-9">
			<div class="row">
			<div class="col-md-12">
			
			
			<h3>Kontak Kami</h3>
				<hr>
				<div class="col-md-8 content-menu" style="margin-top:-20px;" id='myapp'>
				 
				 <form action="" method="post" enctype="multipart/form-data">
						<label>Nama:{{ nama }}</label><br>
						<input type="text" class="form-control" name="nama" v-model='nama' required><br>
						<label>Email:{{ email }}</label><br>
						<input type="email" class="form-control" name="email" v-model='email' required><br>
						<label>Subjek:{{ subjek }}</label><br>
						<input type="text" class="form-control" name="subject" v-model='subjek' required><br>
						<label>Pesan:<br>{{ pesan }}</label><br>
						<textarea class="form-control" name="pesan" v-model='pesan' required></textarea><br>
						<input type="submit" name="form-input" value="Simpan"  @click='addRecord();' class="btn btn-success">
					</form>
				 
				</div>   
				 
					
				
			</div>
			</div> 
		</div> 	
<?php include"layout/footer.php"; ?>
<script>
			var app = new Vue({
				el: '#myapp',
				data: {
					kontak: "",
					nama: "",
					email: "",
					subjek: "",
					pesan: ""
				},
				methods: {
					addRecord: function(){

						if(this.nama != '' && this.email != '' && this.subjek != '' && this.pesan != ''){
							axios.post('ajax/ajaxfile.php', {
							    request: 2,
							    nama: this.nama,
							    email: this.email,
							    subjek: this.subjek,
								pesan: this.pesan
							})
							.then(function (response) {

								// Mengambil nilai record
							    app.allRecords();
							    // Value Kosong
							    app.nama = '';
							    app.email = '';
							    app.subjek = '';
								app.pesan = '';

							    alert(response.data);
							})
							.catch(function (error) {
							    console.log(error);
							});
						}else{
							alert('Harap isi semua masukan');
						}		
					},
					
				},
			})

		</script>