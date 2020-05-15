<?php
	ob_start();
	include"../inc/config.php";
	validate_admin_not_login("login.php");
		include"inc/header.php";
?>
<div class="container">
	<h4>Laporan Keuntungan</h4>
	<div class="col-md-12">
		<hr/>
	</div>

	<div class="row">
		<table class="table table-striped" border="1">
			<tr>
				<th>Total Penghasilan</th>
				<th>Total Ongkir</th>
				<th>Total Pengeluaran</th>
			</tr>
			<tbody>
			<?php
              $totalall =0;

					$no = 0;
					$q = mysqli_query($koneksi,"Select laporan.* from laporan order by id_pengeluaran desc") or die (mysqli_error());
					while ($data = mysqli_fetch_object($q)) {
						$no++;
                 $totalall += $data->total;
							$tgl=explode("-",$data->Tanggal_pengeluaran);
							$tgl1=$tgl['2'].'-'. $tgl['1'].'-'. $tgl['0'];
						?>
						<?php
					}
				?>
				<?php
					$totalSemua = 0;
					$totalOngkir = 0;
					$no = 0;
					$q = mysqli_query($koneksi,"Select pesanan.* from pesanan order by id desc") or die (mysql_error());
					while ($data = mysqli_fetch_object($q)) {
						$totalHarga = 0;
						$no++;
						$q2 = mysqli_query($koneksi,"Select detail_pesanan.*, produk.harga from detail_pesanan INNER JOIN produk ON detail_pesanan.produk_id = produk.id where pesanan_id = '$data->id'") or die (mysql_error());
						while ($d = mysqli_fetch_object($q2)) {
							$totalHarga += $d->harga * $d->qty;
						}
						$totalSemua += $totalHarga;
						$totalOngkir += $data->ongkir;
						?>
						<tr>
							<td><?php echo "Rp. " .number_format($totalSemua, 2, ",", "."); ?></td>
							<td><?php echo "Rp. " .number_format($totalOngkir, 2, ",", "."); ?></td>
							<td><?php echo "Rp. " .number_format($totalall, 2, ",", "."); ?></td>
						</tr>
						<?php
					}
					$keuntungan=($totalSemua+$totalOngkir)-$totalall;
				?>
				<tr>
					<td colspan="2" align="right">
						<font size="3">
							<b>Total Keuntungan</b>
						</font>
					</td>
					<td>
						<font size="3"><?php echo "Rp. ". number_format($keuntungan, 2, ",", "."); ?></font>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<?php
	include"inc/footer.php";
?>
