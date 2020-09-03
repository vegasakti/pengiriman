<?php
class M_data_awal extends CI_Model
{
	function get_all()
	{
		return $this->db
			->select('id_data_awal, jenis_kiriman, kode_kirim,ekspedisi_awal,resi_supplier,invoice_awal')
			->where('dihapus', 'tidak')
			->order_by('id_data_awal','asc')
			->get('pj_data_awal');
	}

	function get_baris($id)
	{
		return $this->db
			->select('id_data_awal, jenis_kiriman, kode_kirim, ekspedisi_awal,resi_supplier,invoice_awal')
			->where('id_data_awal', $id_data_awal)
			->limit(1)
			->get('pj_data_awal');
	}

		function laporan_pengeluaran($dari, $sampai)
	{
		$sql = "
			SELECT 
				DISTINCT(SUBSTR(a.`tanggal`, 1, 10)) AS tanggal,
				(
					SELECT 
						SUM(b.`total`) 
					FROM 
						`pj_pengeluaran` AS b 
					WHERE 
						SUBSTR(b.`tanggal`, 1, 10) = SUBSTR(a.`tanggal`, 1, 10) 
					LIMIT 1
				) AS total_pengeluaran

				
			FROM 
				`pj_pengeluaran` AS a 
			WHERE 
				SUBSTR(a.`tanggal`, 1, 10) >= '".$dari."' 
				AND SUBSTR(a.`tanggal`, 1, 10) <= '".$sampai."' 
			ORDER BY 
				a.`tanggal` ASC
		";

		return $this->db->query($sql);
	}

	function fetch_data_awal($like_value = NULL, $column_order = NULL, $column_dir = NULL, $limit_start = NULL, $limit_length = NULL)
	{
		$sql = "
			SELECT 
				(@row:=@row+1) AS nomor, 
				a.`id_data_awal`, 
				a.`jenis_kiriman`, 
				a.`kode_kirim`,
				a.`ekspedisi_awal`,
				a.`resi_supplier`,
				a.`invoice_awal`,
				DATE_FORMAT(a.`tanggal`, '%d %b %Y - %H:%i:%s') AS tanggal 
			FROM 
				`pj_data_awal` AS a 
				, (SELECT @row := 0) r WHERE 1=1 
				AND a.`dihapus` = 'tidak' 
		";
		
		$data['totalData'] = $this->db->query($sql)->num_rows();
		
		if( ! empty($like_value))
		{
			$sql .= " AND ( ";    
			$sql .= "
				a.`jenis_kiriman` LIKE '%".$this->db->escape_like_str($like_value)."%' 
				OR a.`kode_kirim` LIKE '%".$this->db->escape_like_str($like_value)."%' 
				OR a.`ekspedisi_awal` LIKE '%".$this->db->escape_like_str($like_value)."%'
				OR a.`resi_supplier` LIKE '%".$this->db->escape_like_str($like_value)."%'
				OR a.`invoice_awal` LIKE '%".$this->db->escape_like_str($like_value)."%'
 
				OR DATE_FORMAT(a.`tanggal`, '%d %b %Y - %H:%i:%s') LIKE '%".$this->db->escape_like_str($like_value)."%' 
			";
			$sql .= " ) ";
		}
		
		$data['totalFiltered']	= $this->db->query($sql)->num_rows();
		
		$columns_order_by = array( 
			0 => 'nomor',
			1 => 'a.`jenis_kiriman`',
			2 => 'a.`kode_kirim`',
			3 => 'a.`ekspedisi_awal`',
			4 => 'a.`resi_supplier`',
			5 => 'a.`invoice_awal`',
			6 => 'a.`tanggal`'


		);

		$sql .= " ORDER BY ".$columns_order_by[$column_order]." ".$column_dir.", nomor ";
		$sql .= " LIMIT ".$limit_start." ,".$limit_length." ";
		
		$data['query'] = $this->db->query($sql);
		return $data;
	}

	function tambah_data_awal($jenis_kiriman, $kode_kirim, $ekspedisi_awal,$resi_supplier,$invoice_awal, $unique)
	{
		date_default_timezone_set("Asia/Jakarta");

		$dt = array(
			'jenis_kiriman' => $jenis_kiriman,
			'kode_kirim' => $kode_kirim,
			'ekspedisi_awal' => $ekspedisi_awal,
			'resi_supplier' => $resi_supplier,
			'invoice_awal' => $invoice_awal,

			'tanggal' => date('Y-m-d H:i:s'),
			'dihapus' => 'tidak',
			'kode_unik' => $unique
		);

		return $this->db->insert('pj_data_awal', $dt);
	}

	function update_data_awal($id_data_awal, $jenis_kiriman, $kode_kirim, $ekspedisi_awal, $resi_supplier, $invoice_awal)
	{
		$dt = array(
			'jenis_kiriman' => $jenis_kiriman,
			'kode_kirim' => $kode_kirim,
			'ekspedisi_awal' => $ekspedisi_awal,
			'resi_supplier' => $resi_supplier,
			'invoice_awal' => $invoice_awal

		);

		return $this->db
			->where('id_data_awal', $id_data_awal)
			->update('pj_data_awal', $dt);
	}

	function hapus_data_awal($id_data_awal)
	{
		$dt = array(
			'dihapus' => 'ya'
		);

		return $this->db
			->where('id_data_awal', $id_data_awal)
			->update('pj_data_awal', $dt);
	}

	function get_dari_kode($kode_unik)
	{
		return $this->db
			->select('id_data_awal')
			->where('kode_unik', $kode_unik)
			->limit(1)
			->get('pj_data_awal');
	}
}