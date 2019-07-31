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
        //call all calculation methods
        $server_utilization = $this->calculateServerUtilization();
        $server_rate = array(
            'server1'=> 2,
            'server2'=>3
        );
        $response = array(
            'status' => 'true',
            'server_utilization' => $server_utilization,
            'waiting_times' => 0,
            'server_rate' => $server_rate
        );

        //send data to front end
        $this->response($response, REST_Controller::HTTP_OK);



    }

    public function calculateAvgWaitingTime()
    {
        //algorithms
    }

    /**
     * @param
     * @return
     */
    public function calculateServerUtilization()
    {
        //algorithms
        //method- lamba/miu
        $interarrival_details = $this->insights_model->systemArrivalTimes();
        $timedifference = $interarrival_details['time_diff'];
        $totalnoCustomers = $interarrival_details['total_customers'];
        sscanf($timedifference, "%d:%d:%d", $hours, $minutes, $seconds);

        $time_seconds = $hours * 3600 + $minutes * 60 + $seconds;
        $meaninterarrival = $time_seconds / ($totalnoCustomers * 60); //in minutes
        $arrivalRate = 1 / $meaninterarrival; //lambda

        $service_times = $this->insights_model->service_time();

        $count = 0;
        $time = array();
        foreach ($service_times as $service) {
            sscanf($service->service_time, "%d:%d:%d", $hours, $minutes, $seconds);
            $time[$count] = $hours * 3600 + $minutes * 60 + $seconds;
            $count++;
        }
        $mean_service_time = Statistics::mean($time); // in seconds
        if ($mean_service_time == 0) {
            echo " zero";
            // throw new Exception();
        }
        $mean_service_time = $mean_service_time / 60; // in minutes
        $service_rate = 1 / $mean_service_time;//miu

        $server_utilization = $arrivalRate / $service_rate;
        return $server_utilization;
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