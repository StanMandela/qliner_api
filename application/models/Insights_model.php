<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Insights_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();

        $this->load->database();

    }
    public function getCustomersIds(){
        $date = date('Y-m-d');
        $this->db->select ('index_ID');
            $this->db->from ('customers');
            $this ->db ->where('date',$date);

            $customers = $this->db->get()->result();
            $cust = array();
            $count =0 ;
            foreach($customers as $customer){
                $cust[$count] = $customer->index_ID;
                $count++;
            }
          //  print_r($cust);
          
             return $cust;
    }
    public function systemArrivalTimes(){
        $customers = $this->getCustomersIds();
        $first_person = array_shift($customers);
        $last_person = array_pop($customers);
        $totalNoCustomers= count($customers);
        $date = date('Y-m-d');
        $query = $this->db->query("SELECT
            TIMEDIFF(t1.arrival_time,t2.arrival_time ) as cust_intervals  FROM 
            customers t1  JOIN customers t2  WHERE t1.index_ID= $last_person AND t2.index_ID= $first_person");
            $time_diff = $query->row()->cust_intervals;
            
            $return_array = array(
                'time_diff' => $time_diff,
                'total_customers' => $totalNoCustomers
            );
            return $return_array;
    }
    public function getInterArrivalTime($queue, $date)
    {

          // 1. Number of customers of that queue
        $this->db->select('*');
        $this->db->from($queue);
        $this->db->join('customers',$queue.'.ticket_no = customers.ticket_no');
        $this->db->where('customers.date',$date);
        $query = $this->db->get();
        $num = $query ->num_rows();
        // 2. The last persons arrival time
        $this->db->select('*');
        $this->db->from($queue);
        $this->db->join('customers',$queue.'.ticket_no = customers.ticket_no');
        $this->db->where('customers.date',$date);
        $this->db->order_by($queue.'.index_ID', 'DESC');
        $query = $this->db->get()->row();
        $arrival_time_last = new DateTime($query->arrival_time);



        // 3. The first persons arrival time
        $this->db->select('*');
        $this->db->from($queue);
        $this->db->join('customers',$queue.'.ticket_no = customers.ticket_no');
        $this->db->where('customers.date',$date);
        $this->db->order_by($queue.'.index_ID', 'ASC');
        $query = $this->db->get()->row();
        $arrival_time_first = new DateTime($query->arrival_time);


        //  4. The calc
       $time_difference = $arrival_time_last->diff($arrival_time_first);
       $result = $time_difference->format('%h:%i:%s ');

        sscanf($result, "%d:%d:%d", $hours, $minutes, $seconds);

        $time_seconds = $hours * 3600 + $minutes * 60 + $seconds;
        $mean_time = $time_seconds / ($num*60); //in minutes


      return $mean_time;

    }
    public function service_time($queue){
        
        $this->db->select('TIMEDIFF(service_completion_time,service_start_time) as service_time');
        $date=date('Y-m-d');
        $this->db->from ($queue);
        $this->db-> JOIN ('customers',$queue.'.ticket_no= customers.ticket_no');
        $this->db->where ('customers.date',$date);
        //$this->db->where($queue.'.index_ID',);
       $service_times = $this->db->get()->result();
       //$service_time=$query->service_time;
     //  print_r($service_times);
       return $service_times;
   
       
   }

   public function getWaitingTimes()
   {
       $this->db->select('TIMEDIFF (service_start_time,arrival_time) as waiting_time');
       $this->db->from($queue);
       $this->db-> JOIN ('customers',$queue.'.ticket_no= customers.ticket_no');
       $this->db->where ('customers.date',2019-07-23);
       $this->db->order_by($queue.'.index_ID= 29', 'ASC');
      $query = $this->db->get()->row();
      $waiting_time=$query->service_time;
      print_r ($waiting_time);


   }
}