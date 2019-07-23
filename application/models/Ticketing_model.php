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
        if (empty($result)) {
            return 0;
        } else {
            $prev_id = $result->index_ID;

            return $prev_id;
        }
    }
    /**
     * @param $service_id
     * @return mixed
     */
    public function get_service_abbr($service_id)
    {
        $this->db->select('abbrev,service_Name');
        $this->db->from('service_types');
        $this->db->where('service_ID', $service_id);
        $query = $this->db->get();
        $abbr = $query->row();
        return $abbr;
    }


    public function insert_new_customer($data)
    {

        if ($this->db->insert('customers ', $data)) {
            if ($data['service_id'] == 1) {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('enquiries', $data_service);
                return true;
            } elseif ($data['service_id'] == 2) {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('consultation', $data_service);
                return true;

            } elseif ($data['service_id'] == 3) {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('paediatrics', $data_service);
                return true;

            }
            elseif ($data['service_id'] == 4) {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('pharmacy', $data_service);
                return true;

            }
            elseif ($data['service_id'] == 5) {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('accidents_emergencies', $data_service);
                return true;

            }
            elseif ($data['service_id'] == 6) {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('laboratory', $data_service);
                return true;

            }


        } else {
            return false;
        }

    }

    public function getWaitingTimes()
    {
        $this->db->select('arrival_time , start_time');
        $this->db->from('customers');
        $this->db->where();


    }
}