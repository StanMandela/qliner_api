<?php
/**
 * Created by PhpStorm.
 * User: 25479
 * Date: 09/07/2019
 * Time: 15:10
 */
require APPPATH . '/libraries/REST_Controller.php';
require 'vendor/oefenweb/statistics/src/Statistics.php';


use Oefenweb\Statistics\Statistics;
use Restserver\Libraries\REST_Controller;


class Insights extends REST_Controller
{

    private $customers = array();
    private $mean_service_times = array();
    function __construct()
    {
        parent::__construct();
        /*load model*/
        $this->load->model('insights_model');
    }

    public function authentication_post()
    {
        //true   //return error //get insights//false
        $post_data = file_get_contents("php://input");
        $decoded_post_data = json_decode($post_data);
        
        $email = $decoded_post_data->email;
        $password = $decoded_post_data->password;

        $status =$this->insights_model->authentications($email,$password);
        if ($status == true){
            $response = array(
                'status' => $status,

            );
        }elseif ($status == false){
            $response = array(
                'status' => $status,

            );
        }
        $this->response($response, REST_Controller::HTTP_OK);


    }

    /**
     * controllled by date
     */
    public function getInsights_post()
    {

        $post_data = file_get_contents("php://input");
        $decoded_post_data = json_decode($post_data);

        // $period = $this->input->post('peroid');
        $start_date = $decoded_post_data->start_date;
        $end_date = $decoded_post_data->end_date;


        //call all calculation methods
        $server_utilization = $this->calculateServerUtilization($start_date,$end_date);

        $response = array(
            'status' => 'true',
            'server_utilization' => $server_utilization,
            'customers' => $this->customers,
            'service_times' =>$this->mean_service_times,
            'queue_lengths' =>$this->queueLengthSingle($start_date,$end_date),
            'average_queue_length'=>$this->todayqueueLength(),
            'average_waiting_time'=>$this->average_waiting_time(),
            'average_service_time'=>$this->service_time_daily(),
            
        );

        //send data to front end
        $this->response($response, REST_Controller::HTTP_OK);



    }

    public function calculateAvgWaitingTime()
    {
        //algorithms
    }

    /**sever utilization = (arrival rate / service rate )* 100
     * service rates and number of customers are found here
     * @param $end_date
     * @param $start_date
     * @return array
     */
    public function calculateServerUtilization($start_date,$end_date)
    {
        //algorithms
        //method- lamba/miu
        $interarrival_details = $this->insights_model->systemArrivalTimes($start_date,$end_date);
        $server_utilizations = array();
        $diffs_customers = $interarrival_details['diffs_customers'];
        $customers = $interarrival_details['total_customers'];

        $cust_date = $start_date;
        $custs = array();
        $i =0;
        foreach ($customers as $customer){
            $custs[$i]['queue_length']= $customer;
            $custs[$i]['date']= $cust_date;
                 //increment date
            $instance_date = date('Y-m-d', strtotime("+1 day", strtotime($cust_date)));
            $cust_date = $instance_date;
            //increment counter
            $i++;
        }
        $this->customers = $custs;
        $j =0;
        $mean_service_time = array();
        foreach ($diffs_customers as $diffs_customer) {
            sscanf($diffs_customer['timedifference'], "%d:%d:%d", $hours, $minutes, $seconds);

            $time_seconds = $hours * 3600 + $minutes * 60 + $seconds;
            if($diffs_customer['customer'] == 0){
                $meaninterarrival =0;
                $arrivalRate =0;
            }
            else {
                $meaninterarrival = $time_seconds / ($diffs_customer['customer'] * 60); //in minutes
                $arrivalRate = 1 / $meaninterarrival; //lambda
            }
            //get service time of a particular date of all servers
            $service_times = $this->insights_model->service_time($start_date);
            $count = 0;
            $time = array();

            foreach ($service_times as $service) {
                sscanf($service->service_time, "%d:%d:%d", $hours, $minutes, $seconds);
                $time[$count] = $hours * 3600 + $minutes * 60 + $seconds;
                $count++;
            }
            if (count($time) != 0) {
                $mean_service_time = Statistics::mean($time); // in seconds
               // $mean_service_times[$start_date] = round(($mean_service_time / 60),2); // in minutes
                $mean_service_times[$j]['date']= $start_date;
                $mean_service_times[$j]['service_times'] = round(($mean_service_time / 60),2);
            }else{
                $mean_service_times[$j]['service_times'] =0;
                $mean_service_times[$j]['date']= $start_date;

            }
            if($mean_service_times[$j]['service_times'] == 0){
                $server_utilization=0;
                $server_utilizations[$j]['utilizations'] = $server_utilization;
                $server_utilizations[$j]['date']= $start_date;

            }else {
                $service_rate = 1 / $mean_service_times[$j]['service_times'];//miu

                $server_utilization = round(($arrivalRate / $service_rate)*100,2); //formula
                $server_utilizations[$j]['utilizations'] = $server_utilization;
                $server_utilizations[$j]['date']= $start_date;
            }
            $j++;

            //increment date

            $instance_date = date('Y-m-d', strtotime("+1 day", strtotime($start_date)));
            $start_date = $instance_date;

        }
        $this->mean_service_times = $mean_service_times; //minutes
        return $server_utilizations;
    }



    /** Litles law = Mean rate of arrival * average waiting time
     * @param $start_date
     * @param $end_date
     */
    public function queueLengthSystem($start_date, $end_date)
    {
        //algorithms

    }

    /**
     * @param $start_date
     * @param $end_date
     * @return mixed
     * @throws
     */
    public function queueLengthSingle($start_date, $end_date)
    {     $q_lengths= array();

        $i =0;
        date_default_timezone_set('Africa/Nairobi');
        $start_date = new DateTime($start_date);
        $end_date = new DateTime($end_date);

        $queues = $this->insights_model->queues();
        $date =$start_date->format('Y-m-d');


        $no_of_days = $end_date->diff($start_date);
        $day_diff = $no_of_days->format('%d');
        for ($i = 0; $i <= $day_diff; $i++) {
           $q_length[$date] = $this->insights_model->queuelengths($date,$queues);
            //increment date
            $instance_date = date('Y-m-d', strtotime("+1 day", strtotime($date)));
            //print_r($instance_date);
            // echo '</br>';
            $date = $instance_date;
         
        }
        return$q_length;
    }
    public function todayqueueLength(){
        $date= date('Y-m-d');

        $today_queue= $this->insights_model->today_queue($date);
        return $today_queue;

    }
    public function average_waiting_time(){
         $date= date('Y-m-d');

         $waiting_time=$this->insights_model->waiting_time($date);
         return $waiting_time;
    }

    public function service_time_daily()
    {
        //algorithms
        $date= date('Y-m-d');

        $service_time=$this->insights_model->average_today_servicetime($date);
         return $service_time;
    
    }

    public function avgWaitingTime($start_date,$end_date)
    {
        //algorithms

    }


}