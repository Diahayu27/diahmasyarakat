<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('m_admin');	
	}

	public function index()
	{
		$data['user'] = $this->db->get_where('petugas', ['username' => $this->session->userdata('username')])->row_array();
		$pengaduan = $this->db->get('pengaduan')->num_rows();
		$proses=$this->db->get_where('pengaduan',['status'=>'proses'])->num_rows();
		$selesai=$this->db->get_where('pengaduan',['status'=>'selesai'])->num_rows();

		$data=array(
			'pengaduan'=>$pengaduan,
			'proses'=>$proses,
			'selesai'=>$selesai
		);

		$data['user'] = $this->db->get_where('petugas', ['username' => $this->session->userdata('username')])->row_array();

		$this->load->view('template/Header');
        $this->load->view('template/Sidebar',$data);
        $this->load->view('template/Topbar',  $data);
		$this->load->view('admin/admin_dashboard', $data);
		$this->load->view('template/Footer');
	}


	public function kategori()
	{
		$data['user'] = $this->db->get_where('petugas', ['username' => $this->session->userdata('username')])->row_array();

		$this->load->model('m_admin');

		$data['kategori'] = $this->m_admin->kategori()->result_array();
		// $data['kategori'] = $this->db->get('kategori');

		$data['subkategori'] = $this->m_admin->subkategori()->result_array();
		
		$this->load->view('template/Header');
        $this->load->view('template/Sidebar',$data);
        $this->load->view('template/Topbar',$data);
		$this->load->view('admin/admin_kategori', $data);
		$this->load->view('template/Footer');
	}

	public function tambah_kategori()
	{
		$data['user'] = $this->db->get_where('masyarakat', ['username' => $this->session->userdata('username')])->row_array();

		$kategori = $this->input->post('kategori');

		$add = array(
			'kategori' => $kategori,
		);

		$this->load->model('m_admin');
		$this->m_admin->tambah_kategori($add);
		redirect('Admin/kategori');
	}


	// editkategori
    public function editkategori($id)
    {
		$data['user'] = $this->db->get_where('masyarakat', ['username' => $this->session->userdata('username')])->row_array();

        $kategori = $this->input->post('kategori');

        $update = array(
            'kategori' => $kategori,
        );

        $this->db->where('id', $id);
        $this->db->update('kategori', $update);

        redirect('Admin/kategori');
    }

	
    // deletekategori
    public function deletekategori($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('kategori');
        redirect('Admin/kategori');
    }



	public function tambah_subkategori()
    {
		$kategori = $this->input->post('kategori');
        $sub_kategori = $this->input->post('subkategori');
        $data = array(

			'id_kategori' => $kategori,
            'sub_kategori' => $sub_kategori,
        );
		// $this->m_admin->subkategori();
        $this->db->insert('subkategori', $data);
        redirect('Admin/kategori');
    }


	// editsubkategori
    public function editsubkategori($id)
    {
		$data['user'] = $this->db->get_where('masyarakat', ['username' => $this->session->userdata('username')])->row_array();

        $subkategori = $this->input->post('subkategori');

        $update = array(
            'sub_kategori' => $subkategori,
        );

        $this->db->where('id_subkategori', $id);
        $this->db->update('subkategori', $update);

        redirect('Admin/kategori');
    }


	// deletesubkategori
    public function deletesubkategori($id)
    {
        $this->db->where('id_subkategori', $id);
        $this->db->delete('subkategori');
        redirect('Admin/kategori');
    }


	public function masyarakat()
	{
		$data['user'] = $this->m_admin->userData($this->session->userData('username'))->row_array();
		$data['masyarakat'] = $this->m_admin->masyarakat()->result_array();



		$this->load->view('template/Header');
        $this->load->view('template/Sidebar',$data);
        $this->load->view('template/Topbar',$data);
		$this->load->view('admin/admin_masyarakat', $data);
		$this->load->view('template/Footer');
	}

	
	public function suspendmasyarakat($id)
	{
		$suspendmasyarakat= [
			'active'=>'suspend',
		];

		$this->db->where('id', $id);
		$this->m_admin->suspendmasyarakat($suspendmasyarakat);
		$this->session->set_flashdata('message', '<div class="alert alert-warning" role="alert">
		Berhasil Mengsuspend akun ! 
		</div>');
		redirect('Admin/masyarakat');
	}


	public function unsuspendmasyarakat($id)
	{
		$unsuspendmasyarakat= [
			'active'=>'active',
		];

		$this->db->where('id', $id);
		$this->m_admin->unsuspendmasyarakat($unsuspendmasyarakat);
		$this->session->set_flashdata('message', '<div class="alert alert-warning" role="alert">
		Berhasil Mengunsuspend akun ! 
		</div>');
		redirect('Admin/masyarakat');
	}


	public function petugas()
	{
		$data['user'] = $this->m_admin->userData($this->session->userData('username'))->row_array();
		$data['petugas'] = $this->m_admin->petugas()->result_array();



		$this->load->view('template/Header');
        $this->load->view('template/Sidebar',$data);
        $this->load->view('template/Topbar',$data);
		$this->load->view('admin/admin_petugas', $data);
		$this->load->view('template/Footer');
	}


	public function editpetugas($id)
	{
		$nama_petugas = $this->input->post('nama_petugas');
		$username = $this->input->post('username');
		$telp = $this->input->post('telepon');
		$level = $this->input->post('level');


		$update = [
			'nama_petugas' => $nama_petugas,
			'username' => $username,
			'telp' => $telp,
			'level' => $level,
		];

		$this->db->where('id_petugas', $id);
		$this->m_admin->editpetugas($update);
		$this->session->set_flashdata('message', '<div class="alert alert-warning" role="alert">
		Berhasil Mengganti data petugas ! 
		</div>');
		redirect('Admin/petugas');
	}


	public function suspendpetugas($id)
	{
		$suspend= [
			'active'=>'suspend',
		];

		$this->db->where('id_petugas', $id);
		$this->m_admin->suspendpetugas($suspend);
		$this->session->set_flashdata('message', '<div class="alert alert-warning" role="alert">
		Berhasil Mengsuspend akun ! 
		</div>');
		redirect('Admin/petugas');
	}


	public function unsuspendpetugas($id)
	{
		$unsuspend= [
			'active'=>'active',
		];

		$this->db->where('id_petugas', $id);
		$this->m_admin->unsuspendpetugas($unsuspend);
		$this->session->set_flashdata('message', '<div class="alert alert-warning" role="alert">
		Berhasil Mengunsuspend akun ! 
		</div>');
		redirect('Admin/petugas');
	}


	public function pengadu()
	{
		$data['user'] = $this->m_admin->userData($this->session->userData('username'))->row_array();
		$data['masyarakat'] = $this->m_admin->masyarakat()->result_array();
		$data['pengaduan'] = $this->m_admin->pengaduan()->result_array();

		$this->load->view('template/Header');
        $this->load->view('template/Sidebar',$data);
        $this->load->view('template/Topbar',$data);
		$this->load->view('admin/admin_pengadu',$data);
		$this->load->view('template/Footer');
	}

	
	public function upload_pengaduan($id_pengaduan){
		
		$data_petugas=$this->m_admin->userData($this->session->userData('username'))->row_array();
		$upload_data = array(
			'id_pengaduan'=>$id_pengaduan,
			'tgl_tanggapan'=>date('Y-m-d'),
			'tanggapan'=>$this->input->post('tanggapan'),
			'id_petugas'=>$data_petugas['id_petugas'],
		);
		$this->db->insert('tanggapan',$upload_data);
		$update=array(
			'status'=>$this->input->post('status'),
		);
		$this->db->where('id_pengaduan',$id_pengaduan);
		$this->db->update('pengaduan',$update);
		redirect('Admin/pengadu');
	}


	public function statusproses($id)
	{
		$data['user'] = $this->m_admin->userData($this->session->userData('username'))->row_array();
		$data['masyarakat'] = $this->m_admin->masyarakat()->result_array();
		$data['p'] = $this->m_admin->detail_pengaduan($id)->row_array();
		$data['petugas'] = $this->m_admin->petugas()->result_array();
		$data['tanggapanproses'] = $this->m_admin->tanggapanproses($id)->result_array();

		$this->load->view('template/Header');
        $this->load->view('template/Sidebar',$data);
        $this->load->view('template/Topbar',$data);
		$this->load->view('admin/admin_proses',$data);
		$this->load->view('template/Footer');
	}



	public function laporan_pdf(){

		$data = array(
			"dataku" => array(
				"nama" => "Petani Kode",
				"url" => "http://petanikode.com"
			)
		);
	
		$this->load->library('Pdf');
	
		$this->pdf->setPaper('A4', 'landscape');
		$this->pdf->filename = "laporan-petanikode.pdf";
		$this->pdf->load_view('admin/laporan_pdf', $data);

	}

}