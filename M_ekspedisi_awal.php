<?php
class M_ekspedisi_awal extends CI_Model 
{
	function get_all()
	{
		return $this->db
			->select('id_ekspedisi_awal, ekspedisi_awal')
			->where('dihapus', 'tidak')
			->order_by('ekspedisi_awal', 'asc')
			->get('pj_ekspedisi_awal');
	}

	function fetch_data_ekspedisi_awal($like_value = NULL, $column_order = NULL, $column_dir = NULL, $limit_start = NULL, $limit_length = NULL)
	{
		$sql = "
			SELECT 
				(@row:=@row+1) AS nomor, 
				id_ekspedisi_awal, 
				ekspedisi_awal  
			FROM 
				`pj_ekspedisi_awal`, (SELECT @row := 0) r WHERE 1=1 
				AND dihapus = 'tidak' 
		";
		
		$data['totalData'] = $this->db->query($sql)->num_rows();
		
		if( ! empty($like_value))
		{
			$sql .= " AND ( ";    
			$sql .= "
				ekspedisi_awal LIKE '%".$this->db->escape_like_str($like_value)."%' 
			";
			$sql .= " ) ";
		}
		
		$data['totalFiltered']	= $this->db->query($sql)->num_rows();
		
		$columns_order_by = array( 
			0 => 'nomor',
			1 => 'ekspedisi_awal'
		);
		
		$sql .= " ORDER BY ".$columns_order_by[$column_order]." ".$column_dir.", nomor ";
		$sql .= " LIMIT ".$limit_start." ,".$limit_length." ";
		
		$data['query'] = $this->db->query($sql);
		return $data;
	}

	function tambah_ekspedisi_awal($ekspedisi_awal)
	{
		$dt = array(
			'ekspedisi_awal' => $ekspedisi_awal,
			'dihapus' => 'tidak'
		);

		return $this->db->insert('pj_ekspedisi_awal', $dt);
	}

	function hapus_ekspedisi_awal($id_ekspedisi_awal)
	{
		$dt = array(
			'dihapus' => 'ya'
		);

		return $this->db
			->where('id_ekspedisi_awal', $id_ekspedisi_awal)
			->update('pj_ekspedisi_awal', $dt);
	}

	function get_baris($id_ekspedisi_awal)
	{
		return $this->db
			->select('id_ekspedisi_awal, ekspedisi_awal')
			->where('id_ekspedisi_awal', $id_ekspedisi_awal)
			->limit(1)
			->get('pj_ekspedisi_awal');
	}

	function update_ekspedisi_awal($id_ekspedisi_awal, $ekspedisi_awal)
	{
		$dt = array(
			'ekspedisi_awal' => $ekspedisi_awal
		);

		return $this->db
			->where('id_ekspedisi_awal', $id_ekspedisi_awal)
			->update('pj_ekspedisi_awal', $dt);
	}
}