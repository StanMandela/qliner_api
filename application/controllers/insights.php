<?php
/**
 * Created by PhpStorm.
 * User: 25479
 * Date: 09/07/2019
 * Time: 15:10
 */

namespace Queueing;


use Restserver\Libraries\REST_Controller;

class insights extends REST_Controller
{
    public function authentication_post(){
        //true
            //get insights

        //false
            //return error
    }
    public function getInsights_get(){
        //call all calculation methods

        //send data to front end

    }
    public function calculateAvgWaitingTime(){
        //algorithms
    }
    public  function calculateServerUtilization(){
        //algorithms

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