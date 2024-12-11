<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Student_behavior extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('media_storage');
        $this->load->library('Customlib');
    }

    public function index() {
        if (!$this->rbac->hasPrivilege('student_behavior', 'can_view')) {
            access_denied();
        }
         $this->load->view('layout/header');
        $this->load->view('admin/student_behavior/index');
        $this->load->view('layout/footer');
    }
    public function create() {

        if (!$this->rbac->hasPrivilege('student_behavior', 'can_add')) {
            access_denied();
        }
        $class                   = $this->class_model->get();
        $data['classlist']       = $class;
        $this->load->view('layout/header');
        $this->load->view('admin/student_behavior/create', $data);
        $this->load->view('layout/footer');
    }
    public function store()
    {
           // Set form validation rules
            $this->form_validation->set_rules('class_id', 'Class ID', 'required');
            $this->form_validation->set_rules('student_id', 'Student ID', 'required');
            $this->form_validation->set_rules('remarks', 'remarks', 'required');
            $this->form_validation->set_rules('date', 'Date', 'required');
    
            if ($this->form_validation->run() === FALSE) {
                $this->load->view('student_form');
            } 
            else {
                $formattedDate = date("y-m-d", strtotime($this->input->post("date")));
                $data = array(
                    'class_id' => $this->input->post('class_id'),
                    'student_id' => $this->input->post('student_id'),
                    'remarks' => $this->input->post('remarks'),
                    "create_date" => $formattedDate,
                );
                $this->db->insert("student_behaviour",$data);
                $this->session->set_flashdata('success_message', 'Record has been created successfully.');
                return redirect("admin/student_behavior");
            }
    }


    public function get_student_behaviour(){
      
        $this->db->select("students.id,students.firstname,' ',students.lastname,student_behaviour.remarks,student_behaviour.comments, student_behaviour.created_at")->from("student_behaviour");
        $this->db->join('student_session', 'student_session.student_id = student_behaviour.student_id');
        $this->db->join('classes', 'student_session.class_id = classes.id');
        $this->db->join('sections', 'sections.id = student_session.section_id');
        $data = $this->db->join('students', 'students.id = student_behaviour.student_id', 'left')->get()->result(); 
        $dt_data     = array();
        if (!empty($data)) {
            foreach ($data as $student_key => $student) {
                $row         = array();
                $row[]       = $student->id;
                $row[]       = $student->firstname .'  '.$student->lastname ;
                $row[] = $student->remarks . (!empty($student->comments) ? "<br><b>Answer:</b> " . $student->comments : '');
                $row[] = date("Y-m-d", strtotime($student->created_at));
                $row[] = "<a href=" . site_url('admin/Student_behavior/delete/' . $student->id) . "  class='btn btn-danger btn-xs'>Delete</a>";
                $dt_data[] = $row;
            }
        }
        
        $json_data = array(
            "draw"            => intval($data->draw),
            "recordsTotal"    => intval($$data->recordsTotal),
            "recordsFiltered" => intval($data->recordsFiltered),
            "data"            => $dt_data,
        );
        echo json_encode($json_data);
    }

    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('student_behaviour');
        if($this->db->affected_rows()){
            $this->session->set_flashdata('delete_message', 'Record has been deleted');
            return redirect("admin/student_behavior");
        };
        return redirect("admin/student_behavior");
      
    }
}
