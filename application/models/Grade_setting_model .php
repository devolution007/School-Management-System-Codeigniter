<?php
class Grade_setting_model extends CI_Model {

    public function __construct()
    {
        $this->load->database();
    }

    public function get_grade_settings($term = FALSE)
    {
        if ($term === FALSE) {
            $query = $this->db->get('grade_settings');
            return $query->result_array();
        }

        $query = $this->db->get_where('grade_settings', array('term' => $term));
        return $query->result_array();
    }

    public function set_grade_settings($data)
    {
        return $this->db->insert('grade_settings', $data);
    }
}
