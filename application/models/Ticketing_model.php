<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ticketing_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();

        $this->load->database();

    }

    public function get_prev_id($table_name)
    {
        $this->db->select('index_ID');
        $this->db->from($table_name);
        $this->db->order_by('index_ID', 'DESC');
        $query = $this->db->get();
        $result = $query->row();
        $prev_id = $result->index_ID;

        return $prev_id;
    }

    public function insert_new_customer($data)
    {

        if ($this->db->insert('customers ', $data)) {
            if ($data['service_id'] == 'R') {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('Return ', $data_service);
                return true;
            } elseif ($data['service_id'] == 'S') {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('Sell ', $data_service);
                return true;

            } elseif ($data['service_id'] == 'B') {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('Buy ', $data_service);
                return true;

            }


        } else {
            return false;
        }

    }


}