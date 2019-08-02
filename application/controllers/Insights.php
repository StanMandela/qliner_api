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
    function __construct()
    {
        parent::__construct();
        /*load model*/
        $this->load->model('insights_model');
    }

    public function authentication_post()
    {
        //true
        //get insights

        //false
        //return error
    }

    /**
     * controllled by date
     */
    public function getInsights_get()
    {
       // $period = $this->input->post('peroid');
        $start_date = $this->input->get('start_date');
        $end_date = $this->input->get('end_date');

        //call all calculation methods
        $server_utilization = $this->calculateServerUtilization($start_date,$end_date);

        $response = array(
            'status' => 'true',
            'server_utilization' => $server_utilization,

        );

        //send data to front end
        $this->response($response, REST_Controller::HTTP_OK);



    }

    public function calculateAvgWaitingTime()
    {
        //algorithms
    }

    /**
     * @param $end
     * @param $start
     * @return
     */
    public function calculateServerUtilization($start_date,$end_date)
    {
        //algorithms
        //method- lamba/miu
        $interarrival_details = $this->insights_model->systemArrivalTimes($start_date,$end_date);
        $server_utilizations = array();
        $diffs_customers = $interarrival_details['diffs_customers'];
        $customers = $interarrival_details['total_customers'];
        $j =0;
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

            }else{
                $mean_service_time =0;
            }
            if ($mean_service_time == 0) {
                echo " zero";
                // throw new Exception();
            }
            $mean_service_time = $mean_service_time / 60; // in minutes
            if($mean_service_time == 0){
                $service_rate = 0;
                $server_utilization=0;
            }else {
                $service_rate = 1 / $mean_service_time;//miu

                $server_utilization = $arrivalRate / $service_rate;
                $server_utilizations[$j] = $server_utilization;
                $j++;
            }
            //increment date

            $instance_date = date('Y-m-d', strtotime("+1 day", strtotime($start_date)));
            $start_date = $instance_date;

        }
        return $server_utilizations;
    }

    public function calculateServerRate()
    {
        //algorithms


    }

    public function queueLength()
    {
        //algorithms

    }

    public function arrivalRates()
    {
        //algorithms

    }

    public function avgWaitingTime()
    {
        //algorithms

    }


}