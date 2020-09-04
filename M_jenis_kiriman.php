<?php
class M_jenis_kiriman extends CI_Model 
{
	function get_all()
	{
		return $this->db
			->select('id_jenis_kiriman, jenis_kiriman')
			->where('dihapus', 'tidak')
			->order_by('jenis_kiriman', 'asc')
			->get('pj_jenis_kiriman');
	}

	function fetch_data_jenis_kiriman($like_value = NULL, $column_order = NULL, $column_dir = NULL, $limit_start = NULL, $limit_length = NULL)
	{
		$sql = "
			SELECT 
				(@row:=@row+1) AS nomor, 
				id_jenis_kiriman, 
				jenis_kiriman  
			FROM 
				`pj_jenis_kiriman`, (SELECT @row := 0) r WHERE 1=1 
				AND dihapus = 'tidak' 
		";
		
		$data['totalData'] = $this->db->query($sql)->num_rows();
		
		if( ! empty($like_value))
		{
			$sql .= " AND ( ";    
			$sql .= "
				jenis_kiriman LIKE '%".$this->db->escape_like_str($like_value)."%' 
			";
			$sql .= " ) ";
		}
		
		$data['totalFiltered']	= $this->db->query($sql)->num_rows();
		
		$columns_order_by = array( 
			0 => 'nomor',
			1 => 'jenis_kiriman'
		);
		
		$sql .= " ORDER BY ".$columns_order_by[$column_order]." ".$column_dir.", nomor ";
		$sql .= " LIMIT ".$limit_start." ,".$limit_length." ";
		
		$data['query'] = $this->db->query($sql);
		return $data;
	}

	function tambah_jenis_kiriman($jenis_kiriman)
	{
		$dt = array(
			'jenis_kiriman' => $jenis_kiriman,
			'dihapus' => 'tidak'
		);

		return $this->db->insert('pj_jenis_kiriman', $dt);
	}

	function hapus_jenis_kiriman($id_jenis_kiriman)
	{
		$dt = array(
			'dihapus' => 'ya'
		);

		return $this->db
			->where('id_jenis_kiriman', $id_jenis_kiriman)
			->update('pj_jenis_kiriman', $dt);
	}

	function get_baris($id_jenis_kiriman)
	{
		return $this->db
			->select('id_jenis_kiriman, jenis_kiriman')
			->where('id_jenis_kiriman', $id_jenis_kiriman)
			->limit(1)
			->get('pj_jenis_kiriman');
	}

	function update_jenis_kiriman($id_jenis_kiriman, $jenis_kiriman)
	{
		$dt = array(
			'jenis_kiriman' => $jenis_kiriman
		);

		return $this->db
			->where('id_jenis_kiriman', $id_jenis_kiriman)
			->update('pj_jenis_kiriman', $dt);
	}
}