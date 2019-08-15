<?php
/**
 * Created by PhpStorm.
 * User: 25479
 * Date: 10/08/2019
 * Time: 06:45
 */

defined('BASEPATH') OR exit('No direct script access allowed');

class Service_model extends  CI_Model
{
    public function __construct()
    {
        parent::__construct();

        $this->load->database();

    }
    public function getCustomerDetails($ticket_no){
        $this->db->select('*');
        $this->db->from('customers');
        $this->db->where('ticket_no', $ticket_no);

        $customer_Details = $this->db->get()->row();
        return $customer_Details;

    }

    /**
     * @param $ticket_no
     * @param $status
     */
    public  function changeCustomerStatus($ticket_no, $status){
        $data  = array(
            'status_id' =>   $status
        );

        $this->db->where('ticket_no',$ticket_no);
        $this->db->update('customers',$data);
    }

    /**
     * @param $ticket_no
     * @param $time
     */
    public function updateServiceStartTime($ticket_no, $time){
        $data  = array(
            'service_start_time' =>   $time
        );

        $this->db->where('ticket_no',$ticket_no);
        $this->db->update('customers',$data);
    }
    public function updateServiceStopTime($ticket_no,$time){
        $data  = array(
            'service_completion_time' =>   $time
        );

        $this->db->where('ticket_no',$ticket_no);
        $this->db->update('customers',$data);
    }

}