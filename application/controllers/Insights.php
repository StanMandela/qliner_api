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
    public function authentication_post(){
        //true
            //get insights

        //false
            //return error
    }

    /**
     * controllled by date
     */
    public function getInsights_get(){
        //call all calculation methods
            $server_utilization = $this->calculateServerUtilization();
        //send data to front end
       

    }
    public function calculateAvgWaitingTime(){
        //algorithms
    }
    /**
     * @param
     * @return 
     */
    public  function calculateServerUtilization(){
        //algorithms
        //method- lamba/miu
        $interarrival_details=$this->insights_model->systemArrivalTimes();
        $timedifference= $interarrival_details['time_diff'];
        $totalnoCustomers=$interarrival_details['total_customers'];
         $meaninterarrival= $timedifference/$totalnoCustomers;
         $arrivalRate= 1/$meaninterarrival; //lambda
         


    }
    public function calculateServerRate(){
        //algorithms

    }
    public function queueLength(){
        //algorithms

    }
    public function arrivalRates(){
        //algorithms

    }
    public function avgWaitingTime(){
        //algorithms

    }


}