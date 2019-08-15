<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// require 'vendor/oefenweb/statistics/src/Statistics.php';


use Oefenweb\Statistics\Statistics;

class Insights_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();

        $this->load->database();

    }
    public function authentications($email,$password){
        $this->db->select('email,password');
        $this->db->from('manager');
        $this->db->where('email',$email);
        $this->db->where('password',$password);
        $no = $this->db->get()->num_rows();

        if(empty($no)){
            return "false";
        }elseif (!empty($no)){
            return "true";
        }

    }

    public function getCustomersIds($date)
    {
        $this->db->select('index_ID');
        $this->db->from('customers');
        $this->db->where('date', $date);

        $customers = $this->db->get()->result();
        $cust = array();
        $count = 0;
        foreach ($customers as $customer) {
            $cust[$count] = $customer->index_ID;
            $count++;
        }
        //  print_r($cust);
        $no_of_cust = count($cust);

        $return = array(
            'count' => $no_of_cust,
            'cust' => $cust
        );
        //print_r($count);
        return $return;
    }

    public function systemArrivalTimes($start, $end)//done
    {
        $start_date = new DateTime($start);
        $end_date = new DateTime($end);
        $no_of_days = $end_date->diff($start_date);
        $day_diff = $no_of_days->format('%d');
        $date = $start;
        $all_time_diffs = array();
        //$time_diff = array();
        $totalNoCustomers = array();
        for ($i = 0; $i <= $day_diff; $i++) {
            $return = $this->getCustomersIds($date);
            $customers = $return['cust'];
            if (empty($customers)) {
                $first_person = 0;
                $last_person = 0;
            } else {
                $first_person = array_shift($customers);
                $last_person = array_pop($customers);
            }
            $totalNoCustomers[$i] = $return['count'];
            $query = $this->db->query("SELECT
            TIMEDIFF(t2.arrival_time,t1.arrival_time ) as cust_intervals  FROM 
            customers t1  JOIN customers t2  WHERE t1.index_ID= $first_person AND t2.index_ID= $last_person");
            if ($query->num_rows() == 0) {
                $time_diff = '00:00:00';
            } else {
                $time_diff = $query->row()->cust_intervals;
            }

            $all_time_diffs[$i]['timedifference'] = $time_diff;
            $all_time_diffs[$i]['customer']=$totalNoCustomers[$i];

            //increment date
            $instance_date = date('Y-m-d', strtotime("+1 day", strtotime($date)));
            //print_r($instance_date);
            // echo '</br>';
            $date = $instance_date;




        }

        $return_array = array(
            'diffs_customers' => $all_time_diffs,
            'total_customers' => $totalNoCustomers
        );
        //print_r($return_array);
        return $return_array;
    }

    public function getInterArrivalTime($queue, $date)
    {

        // 1. Number of customers of that queue
        $this->db->select('*');
        $this->db->from($queue);
        $this->db->join('customers', $queue . '.ticket_no = customers.ticket_no');
        $this->db->where('customers.date', $date);
        $query = $this->db->get();
        $num = $query->num_rows();
        // 2. The last persons arrival time
        $this->db->select('*');
        $this->db->from($queue);
        $this->db->join('customers', $queue . '.ticket_no = customers.ticket_no');
        $this->db->where('customers.date', $date);
        $this->db->order_by($queue . '.index_ID', 'DESC');
        $query = $this->db->get()->row();
        $arrival_time_last = new DateTime($query->arrival_time);


        // 3. The first persons arrival time
        $this->db->select('*');
        $this->db->from($queue);
        $this->db->join('customers', $queue . '.ticket_no = customers.ticket_no');
        $this->db->where('customers.date', $date);
        $this->db->order_by($queue . '.index_ID', 'ASC');
        $query = $this->db->get()->row();
        $arrival_time_first = new DateTime($query->arrival_time);


        //  4. The calc
        $time_difference = $arrival_time_last->diff($arrival_time_first);
        $result = $time_difference->format('%h:%i:%s ');

        sscanf($result, "%d:%d:%d", $hours, $minutes, $seconds);

        $time_seconds = $hours * 3600 + $minutes * 60 + $seconds;
        $mean_time = $time_seconds / ($num * 60); //in minutes


        return $mean_time;

    }
    public function  queues(){
        $this->db->select('service_Name');
        $this->db->from('service_types');
        $queues = $this->db->get()->result();
        return $queues;
    }
    public function today_queue($date){

        $this->db->select('*');
        $this->db->from('customers');
        $this->db->where('customers.date', $date);
        $today_queue=$this->db->get()->num_rows();
        return $today_queue;

    }
    public function waiting_time($date){

        //1. getting the service start time of the last person
        $this->db->select('TIMEDIFF (service_start_time,arrival_time) as waiting_time');
        $this->db->from('customers');
        $this->db->where('customers.date', $date);
        $this->db->where('status_id',1);

        $query = $this->db->get()->result();
        //print_r($query);
        $count = 0;
        foreach($query as $query){
            $waiting_time= $query->waiting_time;
            sscanf($waiting_time, "%d:%d:%d", $hours, $minutes, $seconds);
            $time_seconds[$count] = $hours * 3600 + $minutes * 60 + $seconds;
            $count++;
        }
        $mean_waiting_time=Statistics::mean($time_seconds);
        // in seconds
        $mean_waiting_time = $mean_waiting_time / 60 ;

        return $mean_waiting_time;

    }
    public function average_service_time($date,$queue){

        $this->db->select('TIMEDIFF(service_completion_time,service_start_time) as service_time');
        $this->db->from('customers');
        $this->db->where('customers.date', $date);
        //$this->db->where($queue.'.index_ID',);
        $average_service_time = $this->db->get()->result();
        //$service_time=$query->service_time;
        return $average_service_time;




    }

    public function queueLengths($date,$queues)

    {
        $qlengths = array();
        $i =0;
        foreach($queues as $queue) {
         //   print_r($queue);

            $this->db->select($queue->service_Name.'.ticket_no');
            $this->db->from($queue->service_Name);
            $this->db->join('customers', 'customers.ticket_no =' . $queue->service_Name . '.ticket_no');
            $this->db->where('customers.date', $date);
            $qlength = $this->db->get()->num_rows();
            $qlengths[$i]['service_name'] = $queue->service_Name;
            $qlengths[$i]['length'] = $qlength;


          /*  //increment date
            $instance_date = date('Y-m-d', strtotime("+1 day", strtotime($date)));
            //print_r($instance_date);
            // echo '</br>';
            $date = $instance_date;*/
    $i++;

        }
        return $qlengths;
    }
    public function average_today_servicetime($date){
         //1. getting the service start time of the last person
         $this->db->select('TIMEDIFF (service_completion_time,service_start_time) as service_time');
         $this->db->from('customers');
         $this->db->where('customers.date', $date);
         $this->db->where('status_id',1);

         $query = $this->db->get()->result();
         //print_r($query);
         $count = 0;
         foreach($query as $query){
         $today_service_time= $query->service_time;
         sscanf($today_service_time, "%d:%d:%d", $hours, $minutes, $seconds);
         $time_seconds[$count] = $hours * 3600 + $minutes * 60 + $seconds;
             $count++;
         }
         $mean_service_time=Statistics::mean($time_seconds);
         // in seconds
         $mean_service_time = $mean_service_time / 60 ;


         return $mean_service_time;

    }

    public function service_time($date)
    {
        $this->db->select('TIMEDIFF(service_completion_time,service_start_time) as service_time');
        $this->db->from('customers');
        $this->db->where('customers.date', $date);
        //$this->db->where($queue.'.index_ID',);
        $service_times = $this->db->get()->result();
        //$service_time=$query->service_time;
        return $service_times;


    }

    public function getWaitingTimes()// done
    {
        $this->db->select('TIMEDIFF (service_start_time,arrival_time) as waiting_time');
        $this->db->from($queue);
        $this->db->JOIN('customers', $queue . '.ticket_no= customers.ticket_no');
        $this->db->where('customers.date', $date);
        $this->db->order_by($queue . '.index_ID= 29', 'ASC');
        $query = $this->db->get()->row();
        $waiting_time = $query->service_time;
        print_r($waiting_time);


    }
}