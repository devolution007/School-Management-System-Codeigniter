<?php
  if (!defined('BASEPATH')) {
      exit('No direct script access allowed');
  }
  class StudentBehaviour  extends Student_Controller
  {

    public function __construct()
    {
        parent::__construct();

        $this->load->model(array('course_model', 'coursesection_model', 'courselesson_model', 'studentcourse_model', 'coursequiz_model', 'course_payment_model', 'courseofflinepayment_model', 'coursereport_model'));
        $this->current_classSection = $this->customlib->getStudentCurrentClsSection();
        $this->result               = $this->customlib->getLoggedInUserData();
        $this->load->library("aws3");
        $this->sch_setting_detail = $this->setting_model->getSetting();
        $this->load->library(array('enc_lib', 'cart', 'customlib'));
    }


    public function index()
    {
      
        $this->session->set_userdata('top_menu', 'user/studentbehaviour');
        $student_id            = $this->customlib->getStudentSessionUserID();
        $this->load->view('layout/student/header');
        $this->load->view('user/studentbehaviour/index');
        $this->load->view('layout/student/footer');
    }
    public function get_student_behaviour(){
            $student_id =$this->session->userdata('student')['student_id'];
        $this->db->select("students.id,students.firstname,' ',students.lastname,student_behaviour.remarks")->from("student_behaviour");
        $this->db->join('student_session', 'student_session.student_id = student_behaviour.student_id');
        $this->db->join('classes', 'student_session.class_id = classes.id');
        $this->db->join('sections', 'sections.id = student_session.section_id');
         $this->db->join('students', 'students.id = student_behaviour.student_id', 'left');
         $this->db->where('students.id',$student_id);
         $data =$this->db->get()->result(); 
        $dt_data     = array();
        if (!empty($data)) {
            foreach ($data as $student_key => $student) {
                $row         = array();
                $row[]       = $student->id;
                $row[]       = $student->firstname .'  '.$student->lastname ;
                $row[]       = $student->remarks;
               
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
}