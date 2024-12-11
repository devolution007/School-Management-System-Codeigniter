<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Subject_model extends MY_Model {

    public function __construct() {
        parent::__construct();
    }

        public function get($id = null) {

        $subject_condition = 0;
        $userdata = $this->customlib->getUserData();

        $role_id = $userdata["role_id"];


        if (isset($role_id) && ($userdata["role_id"] == 2) && ($userdata["class_teacher"] == "yes")) {
            if ($userdata["class_teacher"] == 'yes') {



                $my_classes = $this->teacher_model->my_classes($userdata['id']);


                if (!empty($my_classes)) {
                    $subject_condition = 0;
                } else {
                    $subject_condition = 1;
                    $my_subjects = $this->teacher_model->get_examsubjects($userdata['id']);
                }
            }
        }
        
        if ($id != null) {
            $this->db->select()->from('subjects');
            $this->db->where('id', $id);
            $query = $this->db->get();
             return $query->row_array();
        } else {
           
            if ($subject_condition == 1 && !empty($my_subjects)) {
                 $this->db->select()->from('subjects');
                $this->db->where_in('subjects.id', $my_subjects);
                $this->db->order_by('id');
                 $query = $this->db->get();
                return $query->result_array(); 
            }elseif($subject_condition == 1 && empty($my_subjects)){
               
             return array();
            }else{
                 $this->db->select()->from('subjects');
                 $this->db->order_by('id');
                 $query = $this->db->get();
                 return $query->result_array(); 
            }
            
        }
        
       
    }

    public function remove($id) {
        $this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well
        //=======================Code Start===========================
        $this->db->where('id', $id);
        $this->db->delete('subjects');
        $message = DELETE_RECORD_CONSTANT . " On subjects id " . $id;
        $action = "Delete";
        $record_id = $id;
        $this->log($message, $record_id, $action);
        //======================Code End==============================
        $this->db->trans_complete(); # Completing transaction
        /* Optional */
        if ($this->db->trans_status() === false) {
            # Something went wrong.
            $this->db->trans_rollback();
            return false;
        } else {
            //return $return_value;
        }
    }

    public function add($data) {
        $this->db->trans_start(); # Starting Transaction
        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well
        //=======================Code Start===========================
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('subjects', $data);
            $message = UPDATE_RECORD_CONSTANT . " On subjects id " . $data['id'];
            $action = "Update";
            $record_id = $data['id'];
            $this->log($message, $record_id, $action);
            //======================Code End==============================

            $this->db->trans_complete(); # Completing transaction
            /* Optional */

            if ($this->db->trans_status() === false) {
                # Something went wrong.
                $this->db->trans_rollback();
                return false;
            } else {
                //return $return_value;
            }
        } else {
            $this->db->insert('subjects', $data);
            $id = $this->db->insert_id();
            $message = INSERT_RECORD_CONSTANT . " On subjects id " . $id;
            $action = "Insert";
            $record_id = $id;
            $this->log($message, $record_id, $action);
            //======================Code End==============================

            $this->db->trans_complete(); # Completing transaction
            /* Optional */

            if ($this->db->trans_status() === false) {
                # Something went wrong.
                $this->db->trans_rollback();
                return false;
            } else {
                //return $return_value;
            }
            return $id;
        }
    }

    function check_data_exists($data) {
        $this->db->where('name', $data['name']);
        $query = $this->db->get('subjects');
        if ($query->num_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    function check_code_exists($data) {
        $this->db->where('code', $data['code']);
        $query = $this->db->get('subjects');
        if ($query->num_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    public function getSubjectTeacher(){
        
        $query = $this->db->query('SELECT subject_teacher.*,subjects.name as subjects, CONCAT(staff.name, " ", staff.employee_id, " ", staff.surname) as teacher_name FROM `subject_teacher`
         INNER JOIN subjects on subjects.id=subject_teacher.subject_id 
         INNER JOIN staff on staff.id=subject_teacher.staff_id 
         GROUP BY subject_teacher.subject_id ORDER by length(subjects.name), subjects.name');
        $result = $query->result_array();
        return $result;
    }
    public function delete($id){
        return $this->db->where('id',$id)->delete('subject_teacher');
    }
    public function teacherSubject($id=0){
        $this->db->select('subjects.*');
        $this->db->from('subjects');
        $this->db->join('subject_teacher', 'subject_teacher.subject_id = subjects.id');
        $this->db->where('subject_teacher.staff_id', $id);
        $this->db->group_by('subject_teacher.subject_id');
        return $this->db->get()->result_array();

    }

}