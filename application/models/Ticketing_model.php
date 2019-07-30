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

            } elseif ($data['service_id'] == 4) {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('pharmacy', $data_service);
                return true;

            } elseif ($data['service_id'] == 5) {
                $data_service = array(
                    'ticket_no' => $data['ticket_no'],
                    'service_id' => $data['service_id']
                );
                $this->db->insert('accidents_emergencies', $data_service);
                return true;

            } elseif ($data['service_id'] == 6) {
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

    public function getInterArrivalTime($queue, $date)
    {

        /* $query = $this->db->query("SELECT
            TIMEDIFF(t1.arrival_time,t2.arriva_time ) as cust_intervals ,  FROM ".$queue." JOIN
            customers t1  JOIN customers t2  WHERE t1.index_ID=6 AND t2.index_ID= 3 AND t1.date =". $date." AND t2.date =".$date);
            return $query->result();*/

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
        // $date=date('Y-m-d');
         $this->db->from ($queue);
         $this->db-> JOIN ('customers',$queue.'.ticket_no= customers.ticket_no');
         $this->db->where ('customers.date','2019-07-23');
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