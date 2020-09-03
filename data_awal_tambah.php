<?php echo form_open('data_awal/tambah_data_awal', array('id' => 'FormTambahdata_awal')); ?>
<div class='form-group'>
	<label>Jenis Kiriman</label>
	<select name='jenis_kiriman' class='form-control'>
		<option value="Barang">Barang</option>
		<option value="Amplop">Amplop</option>
	</select>
</div>


<div class='form-group'>
	<label>Kode Kirim</label>
	<input type='text' name='kode_kirim' class='form-control'>
</div>

<div class='form-group'>
	<label>Ekspedisi Awal</label>
	<select name='ekspedisi_awal' class='form-control'>
		<option value="JNE">JNE</option>
		<option value="JNE Cashless">JNE Cashless</option>
		<option value="Sicepat">Sicepat</option>
		<option value="GO Send">GO Send</option>
		<option value="Anterin aja">Anterin aja</option>
		<option value="J&T">J&T</option>
	</select>
</div>
<div class='form-group'>
	<label>Resi Supplier</label>
	<input type='text' name='resi_supplier' class='form-control'>
</div>
<div class='form-group'>
	<label>Invoice Awal</label>
	<input type='text' name='invoice_awal' class='form-control'>
</div>

<?php echo form_close(); ?>

<div id='ResponseInput'></div>

<script>
function Tambahdata_awal()
{
	$.ajax({
		url: $('#FormTambahdata_awal').attr('action'),
		type: "POST",
		cache: false,
		data: $('#FormTambahdata_awal').serialize(),
		dataType:'json',
		success: function(json){
			if(json.status == 1)
			{ 
				$('#FormTambahdata_awal').each(function(){
					this.reset();
				});

				if(document.getElementById('data_awalArea') != null)
				{
					$('#ResponseInput').html('');

					$('.modal-dialog').removeClass('modal-lg');
					$('.modal-dialog').addClass('modal-sm');
					$('#ModalHeader').html('Berhasil');
					$('#ModalContent').html(json.pesan);
					$('#ModalFooter').html("<button type='button' class='btn btn-primary' data-dismiss='modal' autofocus>Okay</button>");
					$('#ModalGue').modal('show');

					$('#id_data_awal').append("<option value='"+json.id_data_awal+"' selected>"+json.nama+"</option>");
					$('#telp_data_awal').html(json.telepon);
					$('#alamat_data_awal').html(json.alamat);
					$('#info_tambahan_data_awal').html(json.info);
				}
				else
				{
					$('#ResponseInput').html(json.pesan);
					setTimeout(function(){ 
				   		$('#ResponseInput').html('');
				    }, 3000);
					$('#my-grid').DataTable().ajax.reload( null, false );
				}
			}
			else 
			{
				$('#ResponseInput').html(json.pesan);
			}
		}
	});
}

$(document).ready(function(){
	var Tombol = "<button type='button' class='btn btn-primary' id='SimpanTambahdata_awal'>Simpan Data</button>";
	Tombol += "<button type='button' class='btn btn-default' data-dismiss='modal'>Tutup</button>";
	$('#ModalFooter').html(Tombol);

	$("#FormTambahdata_awal").find('input[type=text],textarea,select').filter(':visible:first').focus();

	$('#SimpanTambahdata_awal').click(function(e){
		e.preventDefault();
		Tambahdata_awal();
	});

	$('#FormTambahdata_awal').submit(function(e){
		e.preventDefault();
		Tambahdata_awal();
	});
});
</script>