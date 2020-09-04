<?php
class M_barang extends CI_Model 
{
	function fetch_data_barang($like_value = NULL, $column_order = NULL, $column_dir = NULL, $limit_start = NULL, $limit_length = NULL)
	{
		$sql = "
			SELECT 
				(@row:=@row+1) AS nomor, 
				a.`id_barang`, 
				a.`kode_barang`, 
				DATE_FORMAT(a.`tanggal`, '%d %b %Y - %H:%i:%s') AS tanggal,
				d.`jenis_kiriman`,
				e.`ekspedisi_awal`,

				a.`nama_barang`,
			

				IF(a.`total_stok` = 0, 'Kosong', a.`total_stok`) AS total_stok,
				CONCAT('Rp. ', REPLACE(FORMAT(a.`harga`, 0),',','.') ) AS harga,
				a.`keterangan`,
				b.`kategori`,
				IF(c.`merk` IS NULL, '-', c.`merk` ) AS merk 
			FROM 
				`pj_barang` AS a 
				LEFT JOIN `pj_jenis_kiriman` AS d ON a.`id_jenis_kiriman` = d.`id_jenis_kiriman` 
				LEFT JOIN `pj_ekspedisi_awal` AS e ON a.`id_ekspedisi_awal` = e.`id_ekspedisi_awal` 
				LEFT JOIN `pj_kategori_barang` AS b ON a.`id_kategori_barang` = b.`id_kategori_barang` 
				LEFT JOIN `pj_merk_barang` AS c ON a.`id_merk_barang` = c.`id_merk_barang` 
				, (SELECT @row := 0) r WHERE 1=1 
				AND a.`dihapus` = 'tidak' 
		";
		
		$data['totalData'] = $this->db->query($sql)->num_rows();
		
		if( ! empty($like_value))
		{
			$sql .= " AND ( ";    
			$sql .= "
				a.`kode_barang` LIKE '%".$this->db->escape_like_str($like_value)."%' 
				OR DATE_FORMAT(a.`tanggal`, '%d %b %Y - %H:%i:%s') LIKE '%".$this->db->escape_like_str($like_value)."%' 
				OR d.`jenis_kiriman` LIKE '%".$this->db->escape_like_str($like_value)."%'
				OR e.`ekspedisi_awal` LIKE '%".$this->db->escape_like_str($like_value)."%'

				OR a.`nama_barang` LIKE '%".$this->db->escape_like_str($like_value)."%'
			

				OR IF(a.`total_stok` = 0, 'Kosong', a.`total_stok`) LIKE '%".$this->db->escape_like_str($like_value)."%' 
				OR CONCAT('Rp. ', REPLACE(FORMAT(a.`harga`, 0),',','.') ) LIKE '%".$this->db->escape_like_str($like_value)."%' 
				OR a.`keterangan` LIKE '%".$this->db->escape_like_str($like_value)."%' 
				OR b.`kategori` LIKE '%".$this->db->escape_like_str($like_value)."%' 
				OR c.`merk` LIKE '%".$this->db->escape_like_str($like_value)."%' 
			";
			$sql .= " ) ";
		}
		
		$data['totalFiltered']	= $this->db->query($sql)->num_rows();
		
		$columns_order_by = array( 
			0 => 'nomor',
			1 => 'a.`kode_barang`',
			2 => 'a.`tanggal`',
			3 => 'd.`jenis_kiriman`',
			4 => 'e.`ekspedisi_awal`',
			5 => 'a.`nama_barang`',
			
			6 => 'b.`kategori`',
			7 => 'c.`merk`',
			8 => 'a.`total_stok`',
			9 => '`harga`',
			10 => 'a.`keterangan`'
		);
		
		$sql .= " ORDER BY ".$columns_order_by[$column_order]." ".$column_dir.", nomor ";
		$sql .= " LIMIT ".$limit_start." ,".$limit_length." ";
		
		$data['query'] = $this->db->query($sql);
		return $data;
	}

	function hapus_barang($id_barang)
	{
		$dt['dihapus'] = 'ya';
		return $this->db
				->where('id_barang', $id_barang)
				->update('pj_barang', $dt);
	}

	function tambah_baru($kode,$id_jenis_kiriman,$ekspedisi_awal, $nama, $id_kategori_barang, $id_merk_barang, $stok, $harga, $keterangan)
	{
				date_default_timezone_set("Asia/Jakarta");

		$dt = array(
			'kode_barang' => $kode,
			'tanggal' => date('Y-m-d H:i:s'),
			'id_jenis_kiriman' => $id_jenis_kiriman,
			'id_ekspedisi_awal' => $id_ekspedisi_awal,


			'nama_barang' => $nama,

			'total_stok' => $stok,
			'harga' => $harga,
			'id_kategori_barang' => $id_kategori_barang,
			'id_merk_barang' => (empty($id_merk_barang)) ? NULL : $id_merk_barang,
			'keterangan' => $keterangan,
			'dihapus' => 'tidak'
		);

		return $this->db->insert('pj_barang', $dt);
	}

	function cek_kode($kode)
	{
		return $this->db
			->select('id_barang')
			->where('kode_barang', $kode)
			->where('dihapus', 'tidak')
			->limit(1)
			->get('pj_barang');
	}

	function get_baris($id_barang)
	{
		return $this->db
			->select('id_barang, kode_barang,id_jenis_kiriman,id_ekspedisi_awal, nama_barang,  total_stok, harga, id_kategori_barang, id_merk_barang, keterangan')
			->where('id_barang', $id_barang)
			->limit(1)
			->get('pj_barang');
	}

	function update_barang($id_barang, $kode_barang,$id_jenis_kiriman, $id_ekspedisi_awal, $nama, $id_kategori_barang, $id_merk_barang, $stok, $harga, $keterangan)
	{
		$dt = array(
			'kode_barang' => $kode_barang,
			'nama_barang' => $nama,
			'total_stok' => $stok,
			'harga' => $harga,
			'id_kategori_barang' => $id_kategori_barang,
			'id_merk_barang' => (empty($id_merk_barang)) ? NULL : $id_merk_barang,
			'keterangan' => $keterangan
		);

		return $this->db
			->where('id_barang', $id_barang)
			->update('pj_barang', $dt);
	}

	function cari_kode($keyword, $registered)
	{
		$not_in = '';

		$koma = explode(',', $registered);
		if(count($koma) > 1)
		{
			$not_in .= " AND `kode_barang` NOT IN (";
			foreach($koma as $k)
			{
				$not_in .= " '".$k."', ";
			}
			$not_in = rtrim(trim($not_in), ',');
			$not_in = $not_in.")";
		}
		if(count($koma) == 1)
		{
			$not_in .= " AND `kode_barang` != '".$registered."' ";
		}

		$sql = "
			SELECT 
				`kode_barang`, `nama_barang`, `harga` 
			FROM 
				`pj_barang` 
			WHERE 
				`dihapus` = 'tidak' 
				AND `total_stok` > 0 
				AND ( 
					`kode_barang` LIKE '%".$this->db->escape_like_str($keyword)."%' 
					OR `nama_barang` LIKE '%".$this->db->escape_like_str($keyword)."%' 
				) 
				".$not_in." 
		";

		return $this->db->query($sql);
	}

	function get_stok($kode)
	{
		return $this->db
			->select('nama_barang, total_stok')
			->where('kode_barang', $kode)
			->limit(1)
			->get('pj_barang');
	}

	function get_id($kode_barang)
	{
		return $this->db
			->select('id_barang, nama_barang')
			->where('kode_barang', $kode_barang)
			->limit(1)
			->get('pj_barang');
	}

	function update_stok($id_barang, $jumlah_beli)
	{
		$sql = "
			UPDATE `pj_barang` SET `total_stok` = `total_stok` - ".$jumlah_beli." WHERE `id_barang` = '".$id_barang."'
		";

		return $this->db->query($sql);
	}

		function update_tambah_stok($id_barang, $jumlah_beli)
	{
		$sql = "
			UPDATE `pj_barang` SET `total_stok` = `total_stok` + ".$jumlah_beli." WHERE `id_barang` = '".$id_barang."'
		";

		return $this->db->query($sql);
	}
}