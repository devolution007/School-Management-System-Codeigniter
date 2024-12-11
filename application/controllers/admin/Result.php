<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Result extends Admin_Controller
{

    public $custom_fields_list = array();

    public function __construct()
    {
        parent::__construct();
        
        $this->load->library('media_storage');  
        $this->load->model('Student_model');
        $this->load->model('setting_model');
    }
    public function list()
    {
        if (!$this->rbac->hasPrivilege('gererate_result', 'can_view')) {
            access_denied();
        }
        
        $sessions = $this->setting_model->getsessions();
        $class = $this->class_model->get();
        $data['sessions'] = $sessions;
        $data['classlist'] = $class;
         $this->load->view('layout/header');
        $this->load->view('admin/generateresult/list',$data);
        $this->load->view('layout/footer');
    }
    public function index()
    {
        if (!$this->rbac->hasPrivilege('gererate_result', 'can_view')) {
                access_denied();
        }
        $class             = $this->class_model->get();
        $data['classlist'] = $class;
        $this->load->view('layout/header');
        $this->load->view('admin/generateresult/index',$data);
        $this->load->view('layout/footer');
    }
   
    public function checkvalidation()
    {
        $search = $this->input->post('search');
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');
        // $this->form_validation->set_rules('student_id', $this->lang->line('student'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
            $msg = array(
                'class_id'   => form_error('class_id'),
                'section_id' => form_error('section_id'),
                // 'student_id' => form_error('student_id'),
            );
            $json_array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $class_section_id = $this->input->post('section_id');
            // $student_id       = $this->input->post('student_id');
            $class_id         = $this->input->post('class_id');
            $params           = array('class_section_id' => $class_section_id, "class_id" => $class_id);
            $json_array       = array('status' => 'success', 'error' => '', 'params' => $params);
        }
      
        echo json_encode($json_array);
    }
    public function checkresultvalidation()
    {
        $search = $this->input->post('search');
        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('Terms', "Terms", 'trim|required|xss_clean');
        $this->form_validation->set_rules('sessions', "sessions", 'trim|required|xss_clean');
       
        // $this->form_validation->set_rules('student_id', $this->lang->line('student'), 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {
            $msg = array(
                'class_id'   => form_error('class_id'),
                'Terms' => form_error('Terms'),
                'sessions' => form_error('sessions'),
            );
            $json_array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $class_id = $this->input->post('class_id');
            $sessions       = $this->input->post('sessions');
            $Terms         = $this->input->post('Terms');
            $params           = array('class_id' => $class_id, "sessions" => $sessions, "Terms" => $Terms);
            $json_array       = array('status' => 'success', 'error' => '', 'params' => $params);
        }
        echo json_encode($json_array);
    }

    public function get_student_list()
    {
        $class_section_id = $this->input->post('class_section_id');
        $class_id         = $this->input->post('class_id');
        $dt_data = array();

        $studentdata = $this->Student_model->getStudentByClassSectionID($class_id, $class_section_id);
        
        if (!empty($studentdata)) {
            $doc = "";
            foreach ($studentdata as $key => $value) {
          
                    $row   = array();
                    $row[] = intval($key+1);
                    $row[] = $value["admission_no"];
                    $row[] = $value["firstname"].' '.$value["lastname"] ;
                    $row[] = $value["dob"];
                    $row[] = $value["father_phone"];
                    $row[] = '<a data-backdrop="static" href="'.base_url().'/admin/result/Create/'.$value["id"].'" data-id="' . $value["id"] . '" user-data-id="' . $value["id"] . '" class="btn btn-primary btn-xs pull-right" target="_blank"><i class="fa fa-print"></i> Create Result</a>';

                    // if ($paidstatus) {
                    //     if ($this->rbac->hasPrivilege('online_course_offline_payment', 'can_add')) {
                    //         $revert = '<button data-backdrop="static" data-id=' . $value->id . ' user-data-id=' . $studentid . ' class-section-id=' . $class_section_id . ' class_id=' . $class_id . ' class="btn btn-danger btn-xs pull-right revert_btn"><i class="fa fa-undo"> </i> ' . $this->lang->line("revert") . ' </button>';
                    //     } else {
                    //         $revert = '';
                    //     }

                    //     $row[] = $revert . '
                    // <button data-backdrop="static" data-id=' . $value->id . ' user-data-id=' . $studentid . '  class="btn btn-primary btn-xs pull-right print_btn"><i class="fa fa-print"></i> ' . $this->lang->line("print") . '</button>';
                    // } else {
                    //     if ($this->rbac->hasPrivilege('online_course_offline_payment', 'can_add')) {
                    //         $row[] = '<button data-backdrop="static" data-id=' . $value->id . ' user-data-id=' . $studentid . ' class-section-id=' . $class_section_id . ' class_id=' . $class_id . ' data-keyboard="false" data-toggle="modal" data-target="#payment_modal" class="btn-success pull-right btn-xs paid_btn"><i class="fa fa-money"></i> ' . $this->lang->line("pay") . '</button>';
                    //     } else {
                    //         $row[] = '';
                    //     }
                    // }
                    $dt_data[] = $row;
            }
        }
        $json_data = array(
            "draw"            => 0,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => $dt_data,
        );

        echo json_encode($json_data);
    }
    public function get_result_list()
    {
        $class_id = $this->input->post('class_id');
        $session = $this->input->post('sessions');
        $terms = $this->input->post('Terms');
           $dt_data = array();
        $result = $this->db->select("results.id,students.firstname,students.lastname,session,class,terms,Type,file_url")
        ->from("results")
        ->join('students', 'students.id = results.s_id', 'left')
        ->where("class_id",$class_id)
        ->where("session",$session)
        ->where("terms",$terms)
        ->get()->result_array();
        if (!empty($result)) {
            $doc = "";
            foreach ($result as $key => $value) {
                    $row   = array();
                    $row[] = intval($key+1);
                    $row[] = $value["firstname"] .' '.$value["lastname"] ;
                    $row[] = $value["session"];
                    $row[] = $value["terms"];
                    $row[] = $value["class"];
                    if($value["Type"] == 1){
                        $row[] = '<a data-backdrop="static" href="'.base_url().'/admin/result/edit/'.$value["id"].'" data-id=' . $value["id"] . ' user-data-id=' . $value["id"] . '  class="btn btn-primary btn-xs pull-right"><i class="fa fa-pancel"></i> Edit</a>
                        <a data-backdrop="static" href="'.base_url().'/admin/result/detail/'.$value["id"].'" data-id=' . $value["id"] . ' user-data-id=' . $value["id"] . '  class="btn btn-primary btn-xs pull-right"><i class="fa fa-eye"></i> detail</a>
                        <a data-backdrop="static" href="'.base_url().'/admin/result/delete/'.$value["id"].'" data-id=' . $value["id"] . ' user-data-id=' . $value["id"] . '  class="btn btn-danger btn-xs pull-right"><i class="fa fa-trash"></i> Delete</a>';
                    }
                    else if($value["Type"] == 2)
                    {
                        $row[] = '<a data-backdrop="static" href="'.base_url().$value["file_url"].'" data-id=' . $value["id"] . ' user-data-id=' . $value["id"] . '  class="btn btn-primary btn-xs pull-right"><i class="fa fa-eye"></i> detail</a>
                        <a data-backdrop="static" href="'.base_url().'/admin/result/delete/'.$value["id"].'" data-id=' . $value["id"] . ' user-data-id=' . $value["id"] . '  class="btn btn-danger btn-xs pull-right"><i class="fa fa-trash"></i> Delete</a>';
                    }
                    $dt_data[] = $row;
            }
        }
        $json_data = array(
            "draw"            => 0,
            "recordsTotal"    => 0,
            "recordsFiltered" => 0,
            "data"            => $dt_data,
        );

        echo json_encode($json_data);
    }
    public function Create($id = 0)
    {
        if (!$this->rbac->hasPrivilege('gererate_result', 'can_add')) {
            access_denied();
        }
        $class = $this->class_model->get();
        $data["student"] = $this->Student_model->get($id);
        if($this->session->userdata('admin')['id'] == 1){
            $subject_result = $this->subject_model->get();
        }else{
            $subject_result = $this->subject_model->teacherSubject($this->session->userdata('admin')['id']);
        }
     
        $data['classlist'] = $class;
        $data['settings'] = $this->setting_model->getSetting();
        $data["subject_result"] = $subject_result;
        $data["student_exam_info"] = 1;
        $data["terms"] = $this->db
            ->select("terms")
            ->from("results")
            ->where("s_id", $id)
            ->where("class_id", $data["student"]["class_id"])
            ->get()
            ->result();
      
        $this->load->view('layout/header');
        $this->load->view('admin/generateresult/create',$data);
        $this->load->view('layout/footer');
    }
    public function SaveResult()
    {
        if (!$this->rbac->hasPrivilege('gererate_result', 'can_add')) {
            access_denied();
        }
        $student = $this->Student_model->get($this->input->post("s_id"));
        if($this->sort_and_validate_marks() == false)
        {
            $array = array('status' => 'fail', 'error' => ["result fields not be correct"], 'message' => "");
            echo json_encode($array);
            return;
        }
        else{
           
            $this->form_validation->set_rules('terms', "Terms", 'trim|required|xss_clean');
            $this->form_validation->set_rules('permotional_statment', "permotional statment",'trim|required|xss_clean');
           
            $this->form_validation->set_rules('following_instructions',"following instructions",'trim|required|xss_clean');
            $this->form_validation->set_rules('working_independently',"working independently",'trim|required|xss_clean');
            $this->form_validation->set_rules('disturbing_others',"disturbing others",'trim|required|xss_clean');
            $this->form_validation->set_rules('does_next_work_in_class',"does next work in class",'trim|required|xss_clean');
            $this->form_validation->set_rules('take_care_of_materials',"take care of materials",'trim|required|xss_clean');
            $this->form_validation->set_rules('completion_of_work',"completion of work",'trim|required|xss_clean');
            $this->form_validation->set_rules('finished_work_on_time',"finished work on time",'trim|required|xss_clean');
            $this->form_validation->set_rules('puncatuality',"puncatuality",'trim|required|xss_clean');
            $this->form_validation->set_rules('persional_cleanliness',"persional cleanliness",'trim|required|xss_clean');
            $this->form_validation->set_rules('assignments',"assignments",'trim|required|xss_clean');
            $this->form_validation->set_rules('regularity',"regularity",'trim|required|xss_clean');
            $this->form_validation->set_rules('ganeral_conduct',"ganeral conduct",'trim|required|xss_clean');
            $this->form_validation->set_rules('class_teacher_remarks',"class teacher remarks",'trim|required|xss_clean');
            $this->form_validation->set_rules('class_teacher_name',"class teacher name",'trim|required|xss_clean');
            $this->form_validation->set_rules('head_teacher_remarks',"head teacher remarks",'trim|required|xss_clean');
            $this->form_validation->set_rules('school_resumes',"school resumes",'trim|required|xss_clean');
            if ($this->form_validation->run() == false) 
            {
                $errors = array(
                    "terms" => form_error("terms"),
                    "permotional_statment"=> form_error("permotional_statment"),
                    "following_instructions"=> form_error("following_instructions"),
                    "working_independently"=> form_error("working_independently"),
                    "disturbing_others"=> form_error("disturbing_others"),
                    "does_next_work_in_class"=> form_error("does_next_work_in_class"),
                    "take_care_of_materials"=> form_error("take_care_of_materials"),
                    "completion_of_work"=> form_error("completion_of_work"),
                    "finished_work_on_time"=> form_error("finished_work_on_time"),
                    "puncatuality"=> form_error("puncatuality"),
                    "persional_cleanliness"=> form_error("persional_cleanliness"),
                    "assignments"=> form_error("assignments"),
                    "regularity"=> form_error("regularity"),
                    "ganeral_conduct"=> form_error("ganeral_conduct"),
                    "class_teacher_remarks"=> form_error("class_teacher_remarks"),
                    "class_teacher_name"=> form_error("class_teacher_name"),
                    "head_teacher_remarks"=> form_error("head_teacher_remarks"),
                    "school_resumes"=> form_error("school_resumes")
                );
                $array = array('status' => 'fail', 'error' => $errors);
                echo json_encode($array);
                return;
            }
            else
            {
                $data = array(
                    "s_id" => $this->input->post("s_id") ?? 0,
                    "session" => $this->setting_model->getCurrentSessionName(),
                    "class_id" => $student["class_id"],
                    "class" => $student["class"],
                    "terms" => $this->input->post("terms"),
                    "permotional_statment"=> $this->input->post("permotional_statment"),
                    "following_instructions"=> $this->input->post("following_instructions"),
                    "working_independently"=> $this->input->post("working_independently"),
                    "disturbing_others"=> $this->input->post("disturbing_others"),
                    "does_next_work_in_class"=> $this->input->post("does_next_work_in_class"),
                    "take_care_of_materials"=> $this->input->post("take_care_of_materials"),
                    "completion_of_work"=> $this->input->post("completion_of_work"),
                    "finished_work_on_time"=> $this->input->post("finished_work_on_time"),
                    "puncatuality"=> $this->input->post("puncatuality"),
                    "persional_cleanliness"=> $this->input->post("persional_cleanliness"),
                    "assignments"=> $this->input->post("assignments"),
                    "regularity"=> $this->input->post("regularity"),
                    "ganeral_conduct"=> $this->input->post("ganeral_conduct"),
                    "class_teacher_remarks"=> $this->input->post("class_teacher_remarks"),
                    "class_teacher_name"=> $this->input->post("class_teacher_name"),
                    "head_teacher_remarks"=> $this->input->post("head_teacher_remarks"),
                    "school_resumes"=> $this->input->post("school_resumes")
                );
                $this->db->insert("results",$data);
                $id = $this->db->insert_id();
                $subject = $this->input->post("subject");
                $assessment_0 = $this->input->post("assessment_0");
                $assessment_1 = $this->input->post("assessment_1");
                $assessment_2 = $this->input->post("assessment_2");
                $assessment_3 = $this->input->post("assessment_3");
                $exams = $this->input->post("exams");
                foreach($subject as $k => $v)
                {
                    $detail_data["r_id"]  =  $id;
                    $detail_data["subject"]  = $v;
                    $detail_data["assessment_0"]  = $assessment_0[$k] ?? 0;
                    $detail_data["assessment_1"]  = $assessment_1[$k] ?? 0;
                    $detail_data["assessment_2"]  = $assessment_2[$k] ?? 0;
                    $detail_data["assessment_3"]  = $assessment_3[$k] ?? 0;
                    $detail_data["exams"]  = $exams[$k] ?? 0;
                    $this->db->insert("result_details",$detail_data);
                }
                $array = array('status' => 'success', 'error' => '', 'message' => "Result Create Succussfully","insert_id" => $id);
                echo json_encode($array);
            }
        }
    }

    protected function sort_and_validate_marks()
    {
     // dd($this->input->post());
        // $subject = $this->input->post("subject");
        // $assessment_0 = $this->input->post("assessment_0");
        // $assessment_1 = $this->input->post("assessment_1");
        // $assessment_2 = $this->input->post("assessment_2");
        // $assessment_3 = $this->input->post("assessment_3");
        // $exams = $this->input->post("exams");
        // foreach($subject as $k => $v)
        // {
        //   if(isset($assessment_0))
        //   {
        //     if(empty($assessment_0[$k]))
        //     {
        //         return false;
        //     }
        //   } 
        //   if(isset($assessment_1))
        //   {
        //     if(empty($assessment_1[$k]))
        //     {
        //         return false;
        //     }
        //   } 
        //   if(isset($assessment_2))
        //   {
        //     if(empty($assessment_2[$k]))
        //     {
        //         return false;
        //     }
        //   } 
        //   if(isset($assessment_3))
        //   {
        //     if(empty($assessment_3[$k]))
        //     {
        //         return false;
        //     }
        //   } 
        //   if(isset($exams))
        //   {
        //     if(empty($exams[$k]))
        //     {
        //         return false;
        //     }
        //   } 
          
        // }
         return true;
            
    }
    public function print_terms($id)
    {
        $data['settings'] = $this->setting_model->getSetting();
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
            $data["result"]->result_details = $this->db->where("r_id",$id)->get("result_details")->result();
           
            $this->load->view('admin/generateresult/print_terms_reports',$data);
        }
    }

    public function boardcast()
    {
    if (!$this->rbac->hasPrivilege('gererate_result', 'can_view')) {
        access_denied();
    }
    $sessions = $this->setting_model->getsessions();
    $class = $this->class_model->get();
    $data['sessions'] = $sessions;
    $data['classlist'] = $class;
    $this->load->view('layout/header');
    $this->load->view('admin/generateresult/boardcast',$data);
    $this->load->view('layout/footer');
    }
    public function boardcast_report()
    {
    
        $subjects = $this->subject_model->get();
        $query1 = $this->db
            ->select("s_id, 
                      subject, 
                      terms,
                      SUM(CASE WHEN a.Terms = '1st Term' THEN (assessment_0)+(assessment_1)+(assessment_2)+(assessment_3)+(exams) ELSE 0 END) as Test_1,
                      SUM(CASE WHEN a.Terms = '2nd Term' THEN (assessment_0)+(assessment_1)+(assessment_2)+(assessment_3)+(exams) ELSE 0 END) as Test_2,
                      SUM(CASE WHEN a.Terms = '3rd Term' THEN (assessment_0)+(assessment_1)+(assessment_2)+(assessment_3)+(exams) ELSE 0 END) as Test_3")
            ->from("results a")
            ->join("result_details b", 'a.id = b.r_id')
            ->where("a.session", $this->input->post("sessions"))
            ->where("a.class_id", $this->input->post("class_id"))
            ->group_by("s_id, subject, terms")
            ->get_compiled_select();
        
        $query2_str = "SELECT students.*, s_id, ";
        foreach ($subjects as $subject) {
            $sub_name = str_replace(" ", "_", $subject["name"]);
            $query2_str .= "SUM(CASE WHEN subject = '" . $subject["name"] . "' AND terms = '1st Term' THEN Test_1 ELSE 0 END) as Test_1_" . $sub_name . ", ";
            $query2_str .= "SUM(CASE WHEN subject = '" . $subject["name"] . "' AND terms = '2nd Term' THEN Test_2 ELSE 0 END) as Test_2_" . $sub_name . ", ";
            $query2_str .= "SUM(CASE WHEN subject = '" . $subject["name"] . "' AND terms = '3rd Term' THEN Test_3 ELSE 0 END) as Test_3_" . $sub_name . ", ";
        }
        $query2_str .= "'' as t FROM ($query1) as a INNER JOIN students ON students.id = a.s_id GROUP BY a.s_id";
        
        $data["subjects"] = $subjects;
        $data["students"] = $this->db->query($query2_str)->result_array();
        

    // echo "<pre>";
    // print_R($data);
    $this->load->view('layout/header');
    $this->load->view('admin/generateresult/boardcast_report',$data);
    $this->load->view('layout/footer');
    }

    


    public function upload()
    {
        $img_name = $this->media_storage->fileupload("file", "./uploads/student_documents/result_doc/");
        $student = $this->Student_model->get($this->input->post("s_id"));
        $data = array(
            "s_id" => $this->input->post("s_id") ?? 0,
            "session" => $this->setting_model->getCurrentSessionName(),
            "class_id" => $student["class_id"],
            "class" => $student["class"],
            "terms" => $this->input->post("terms"),
            "Type" => 2,
            "file_url" => "uploads/student_documents/result_doc/".$img_name
        );
        $this->db->insert("results",$data);
        $id = $this->db->insert_id();
        $array = array('status' => 'success', 'error' => '', 'message' => "Result Create Succussfully","insert_id" => $id);
        echo json_encode($array);
    }
    public function edit($id)
    {

        
        $class = $this->class_model->get();
        $subject_result = $this->subject_model->get();
        $data['classlist'] = $class;
        $data['settings'] = $this->setting_model->getSetting();
        $data["subject_result"] = $subject_result;
        $data["terms"] = $this->db->select("terms")->from("results")
        ->where("s_id",$id)
        ->where("class_id",$data["student"]["class_id"])
        ->get()->result();
        $data["result"] = $this->db->where("id",$id)->get("results")->row();
        $data["result"]->result_details = $this->db->where("r_id",$id)->get("result_details")->result_array();
        $data["student"] = $this->Student_model->get($data["result"]->s_id);
        $this->load->view('layout/header');
        $this->load->view('admin/generateresult/edit',$data);
        $this->load->view('layout/footer');
 
    }

    public function update()
    {

        if (!$this->rbac->hasPrivilege('gererate_result', 'can_add')) {
            access_denied();
        }
        $student = $this->Student_model->get($this->input->post("s_id"));
        if($this->sort_and_validate_marks() == false)
        {
            $array = array('status' => 'fail', 'error' => ["result fields not be correct"], 'message' => "");
            echo json_encode($array);
            return;
        }
        else{
            $this->form_validation->set_rules('permotional_statment', "permotional statment",'trim|required|xss_clean');
            $this->form_validation->set_rules('following_instructions',"following instructions",'trim|required|xss_clean');
            $this->form_validation->set_rules('working_independently',"working independently",'trim|required|xss_clean');
            $this->form_validation->set_rules('disturbing_others',"disturbing others",'trim|required|xss_clean');
            $this->form_validation->set_rules('does_next_work_in_class',"does next work in class",'trim|required|xss_clean');
            $this->form_validation->set_rules('take_care_of_materials',"take care of materials",'trim|required|xss_clean');
            $this->form_validation->set_rules('completion_of_work',"completion of work",'trim|required|xss_clean');
            $this->form_validation->set_rules('finished_work_on_time',"finished work on time",'trim|required|xss_clean');
            $this->form_validation->set_rules('puncatuality',"puncatuality",'trim|required|xss_clean');
            $this->form_validation->set_rules('persional_cleanliness',"persional cleanliness",'trim|required|xss_clean');
            $this->form_validation->set_rules('assignments',"assignments",'trim|required|xss_clean');
            $this->form_validation->set_rules('regularity',"regularity",'trim|required|xss_clean');
            $this->form_validation->set_rules('ganeral_conduct',"ganeral conduct",'trim|required|xss_clean');
            $this->form_validation->set_rules('class_teacher_remarks',"class teacher remarks",'trim|required|xss_clean');
            $this->form_validation->set_rules('class_teacher_name',"class teacher name",'trim|required|xss_clean');
            $this->form_validation->set_rules('head_teacher_remarks',"head teacher remarks",'trim|required|xss_clean');
            $this->form_validation->set_rules('school_resumes',"school resumes",'trim|required|xss_clean');
            if ($this->form_validation->run() == false) 
            {
                $errors = array(
                    "terms" => form_error("terms"),
                    "permotional_statment"=> form_error("permotional_statment"),
                    "following_instructions"=> form_error("following_instructions"),
                    "working_independently"=> form_error("working_independently"),
                    "disturbing_others"=> form_error("disturbing_others"),
                    "does_next_work_in_class"=> form_error("does_next_work_in_class"),
                    "take_care_of_materials"=> form_error("take_care_of_materials"),
                    "completion_of_work"=> form_error("completion_of_work"),
                    "finished_work_on_time"=> form_error("finished_work_on_time"),
                    "puncatuality"=> form_error("puncatuality"),
                    "persional_cleanliness"=> form_error("persional_cleanliness"),
                    "assignments"=> form_error("assignments"),
                    "regularity"=> form_error("regularity"),
                    "ganeral_conduct"=> form_error("ganeral_conduct"),
                    "class_teacher_remarks"=> form_error("class_teacher_remarks"),
                    "class_teacher_name"=> form_error("class_teacher_name"),
                    "head_teacher_remarks"=> form_error("head_teacher_remarks"),
                    "school_resumes"=> form_error("school_resumes")
                );
                $array = array('status' => 'fail', 'error' => $errors);
                echo json_encode($array);
                return;
            }
            else
            {
                $data = array(
                    "permotional_statment"=> $this->input->post("permotional_statment"),
                    "following_instructions"=> $this->input->post("following_instructions"),
                    "working_independently"=> $this->input->post("working_independently"),
                    "disturbing_others"=> $this->input->post("disturbing_others"),
                    "does_next_work_in_class"=> $this->input->post("does_next_work_in_class"),
                    "take_care_of_materials"=> $this->input->post("take_care_of_materials"),
                    "completion_of_work"=> $this->input->post("completion_of_work"),
                    "finished_work_on_time"=> $this->input->post("finished_work_on_time"),
                    "puncatuality"=> $this->input->post("puncatuality"),
                    "persional_cleanliness"=> $this->input->post("persional_cleanliness"),
                    "assignments"=> $this->input->post("assignments"),
                    "regularity"=> $this->input->post("regularity"),
                    "ganeral_conduct"=> $this->input->post("ganeral_conduct"),
                    "class_teacher_remarks"=> $this->input->post("class_teacher_remarks"),
                    "class_teacher_name"=> $this->input->post("class_teacher_name"),
                    "head_teacher_remarks"=> $this->input->post("head_teacher_remarks"),
                    "school_resumes"=> $this->input->post("school_resumes")
                );

           
              $this->db->where("id",$this->input->post("result_id"));
              $this->db->update("results",$data);
              $this->db->reset_query();

              $subject = $this->input->post("subject");
              $assessment_0 = $this->input->post("assessment_0");
              $assessment_1 = $this->input->post("assessment_1");
              $assessment_2 = $this->input->post("assessment_2");
              $assessment_3 = $this->input->post("assessment_3");
              $exams = $this->input->post("exams");
              $this->db->where("r_id",$this->input->post("result_id"));
              $this->db->delete("result_details");
              $this->db->reset_query();


              foreach($subject as $k => $v)
              {
                  $detail_data["r_id"]  =  $this->input->post("result_id");
                  $detail_data["subject"]  = $v;
                  $detail_data["assessment_0"]  = $assessment_0[$k] ?? 0;
                  $detail_data["assessment_1"]  = $assessment_1[$k] ?? 0;
                  $detail_data["assessment_2"]  = $assessment_2[$k] ?? 0;
                  $detail_data["assessment_3"]  = $assessment_3[$k] ?? 0;
                  $detail_data["exams"]  = $exams[$k] ?? 0;
                  $this->db->insert("result_details",$detail_data);
              }
              $array = array('status' => 'success', 'error' => '', 'message' => "Result update Succussfully","insert_id" => $this->input->post("result_id"));
              echo json_encode($array);
            }
        }
    }
    public function delete($id)
    {
        $this->db->where("id",$id);
        $this->db->delete("results");
        
        $this->db->where("r_id",$id);
        $this->db->delete("result_details");
        
        return redirect($_SERVER['HTTP_REFERER']);
    }
}