<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: 25479
 * Date: 31/07/2019
 * Time: 22:31
 */

class Queue_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();

        $this->load->database();

    }
    public function index($queue){
        $date = date('Y-m-d');
        $this->db->select($queue.'.ticket_no,customers.mobile_no');
        $this->db->from($queue);
        $this->db->join('customers', 'customers.ticket_no = '.$queue.'.ticket_no');
        $this->db->where('customers.date',$date);
        $this->db->limit(2);

        $customers = $this->db->get()->result();
        return $customers ;
    }
}