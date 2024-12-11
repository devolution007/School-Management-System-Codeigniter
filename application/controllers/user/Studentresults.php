<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Studentresults extends Student_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('media_storage');  
        $this->load->model('Student_model');
        $this->load->model('setting_model');
        $this->load->library('user_agent');

    }

    public function index()
    {
        
        $this->session->set_userdata('top_menu', 'Studentresults');
        $this->session->set_userdata('sub_menu', 'Studentresults/index');
        $data['title']     = 'Student Results';
        $data['class'] = $this->class_model->get();
        $data["sessions"] = $this->setting_model->getsessions();
    
        $this->load->view('layout/student/header', $data);
        $this->load->view('studentresult/index', $data);
        $this->load->view('layout/student/footer', $data);
    }

    public function search()
    {
        if(!$this->input->post('session'))
        {
            return redirect($this->agent->referrer());
        }
        $student_id = $this->customlib->getLoggedInUserData()["student_id"];
        $this->session->set_userdata('top_menu', 'Studentresults');
        $this->session->set_userdata('sub_menu', 'Studentresults/index');
        $data['title']     = 'Student Results';
        $data['class'] = $this->class_model->get();
        $data["sessions"] = $this->setting_model->getsessions();
        
        $session =  $this->input->post("session");
        $data["results"] = $this->db->select("results.*")->from("results")
        ->join('students', 'students.id = results.s_id', 'inner')
        ->where("results.s_id",$student_id)
        ->where("results.session",$session)
        ->get()->result();

        $this->load->view('layout/student/header', $data);
        $this->load->view('studentresult/index', $data);
        $this->load->view('layout/student/footer', $data);
    }

    public function print_terms($id)
    {
        $data['settings'] = $this->setting_model->getSetting();
        $data["result"] = $this->db->where("id",$id)->get("results")->row();
        $data["result"] = $this->db->where("id",$id)->get("results")->row();
        if($data["result"]->terms == "3rd Term")
        {      
            $this->print_final_term($id,$data["result"]->s_id);
        }
        else
        {
            $data["student"] = $this->Student_model->get($data["result"]->s_id);
            $data["result"]->result_details = $this->db->where("r_id",$id)->get("result_details")->result();
            $this->load->view('admin/generateresult/print_terms_reports',$data);
        }
    }
    public function print_final_term($id,$s_id)
    {
        $data['settings'] = $this->setting_model->getSetting();
        $data["result"] = $this->db->where("id",$id)->get("results")->row();
        $data["student"] = $this->Student_model->get($data["result"]->s_id);
        $data["result"]->result_details = $this->db->query(
            "
            select subject,sum(assessment_0) as assessment_0,sum(assessment_1) as assessment_1, 
            sum(assessment_2) as assessment_2,sum(assessment_3) as assessment_3, 
            sum(exams) as exams,totalscore,sum(1st_term_total) as first_term_total,position,
            sum(2nd_term_total) as second_term_total,sum(3rd_term_total) as final_term_total from(
            
            select *, RANK() OVER (PARTITION BY subject ORDER BY totalscore DESC) AS position from (
            select r_id,subject,assessment_0,assessment_1,assessment_2,
            assessment_3,exams,
            (assessment_0 + assessment_1 + assessment_2 + assessment_3 + exams) as totalscore,
            0 1st_term_total,0 2nd_term_total,0 3rd_term_total
            from result_details 
            ) as c where r_id = ".$id."
            union all 
            select 0,a.subject,0,0,0,0,0,0,a.1st_term_total,a.2nd_term_total,a.3rd_term_total,0 from (
                select a.id,b.subject,a.terms,
                case when a.terms = '1st Term'
                then (sum(assessment_0)+sum(assessment_1)+sum(assessment_2)+sum(assessment_3)+sum(b.exams)) 
                else 0 end 1st_term_total,
                case when a.terms = '2nd Term'
                then (sum(assessment_0)+sum(assessment_1)+sum(assessment_2)+sum(assessment_3)+sum(b.exams)) 
                else 0 end 2nd_term_total,
                case when a.terms = '3rd Term'
                then (sum(assessment_0)+sum(assessment_1)+sum(assessment_2)+sum(assessment_3)+sum(b.exams)) 
                else 0 end 3rd_term_total,0
                from results a inner join result_details b on a.id = b.r_id
                where a.s_id = ".$s_id." 
                group by b.subject,a.terms
            ) as a) as b group by subject  
        ")->result(); 
        $this->load->view('admin/generateresult/final_terms_reports',$data);
    }

    public function detail($id)
    {
        $data['settings'] = $this->setting_model->getSetting();
        $data["result"] = $this->db->where("id",$id)->get("results")->row();
        
        
        $data["student"] = $this->Student_model->get($data["result"]->s_id);
      
        if($data["result"]->terms == "3rd Term")
        {      
            $this->print_final_term($id,$data["result"]->s_id);
        }
        else
        {

             $result_details = $this->db->where("r_id",$id)->get("result_details")->result();
             if(!empty($result_details)){
                $data["result"]->result_details=$result_details;
             }
            $this->load->view('admin/generateresult/print_terms_reports',$data);
        }
        
    }


}
