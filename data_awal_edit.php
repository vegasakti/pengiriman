<?php echo form_open('data_awal/data_awal_edit/'.$data_awal->id_data_awal, array('id' => 'FormEditdata_awal')); ?>

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
function Editdata_awal()
{
	$.ajax({
		url: $('#FormEditdata_awal').attr('action'),
		type: "POST",
		cache: false,
		data: $('#FormEditdata_awal').serialize(),
		dataType:'json',
		success: function(json){
			if(json.status == 1){ 
				$('#ResponseInput').html(json.pesan);
				setTimeout(function(){ 
			   		$('#ResponseInput').html('');
			    }, 3000);
				$('#my-grid').DataTable().ajax.reload( null, false );
			}
			else {
				$('#ResponseInput').html(json.pesan);
			}
		}
	});
}

$(document).ready(function(){
	var Tombol = "<button type='button' class='btn btn-primary' id='SimpanEditdata_awal'>Update Data</button>";
	Tombol += "<button type='button' class='btn btn-default' data-dismiss='modal'>Tutup</button>";
	$('#ModalFooter').html(Tombol);

	$("#FormEditdata_awal").find('input[type=text],textarea,select').filter(':visible:first').focus();

	$('#SimpanEditdata_awal').click(function(e){
		e.preventDefault();
		Editdata_awal();
	});

	$('#FormEditdata_awal').submit(function(e){
		e.preventDefault();
		Editdata_awal();
	});
});
</script>