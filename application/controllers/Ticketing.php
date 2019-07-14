<?php
/**
 * Created by PhpStorm.
 * User: Cyrus Muchiri
 * Date: 09/07/2019
 * Time: 15:06
 */
require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class ticketing extends REST_Controller
{
    function __construct()
    {
        parent::__construct();
    }

    /**
     *
     */
    public function addCustomer_post()
    {
            //get params ( service time and mobile
              //  $service = $this->input->post('service_id');
              //  $mobile = $this->input->post('mobile');
            //get current time
                date_default_timezone_set('Africa/Nairobi');
                $date = date('Y-m-d');
                $time = date('H:i:s');
            //generate ticket number


            //store values to db



            //send message
            //Calculate ....
        $ticketNo = "T001";
        $currentPos= 4;
        $waitingTime = "3Hrs";
        $approxServiceTime= "14:54";


            //compose message
            $message = "Your ticket number is " .$ticketNo. ". Your current position in queue is " .$currentPos. ". Approximate waiting time is " . $waitingTime . ". Approxiamte service time is ".$approxServiceTime;
            echo $message;
            //send

        $response = array(

                "status" => true,
                "result" => $message
        );

        $this->response($response,REST_Controller::HTTP_OK);
    }
    public function getLengthOfQueue(){

    }
    public function calculateAvgWaitingTime(){

    }
    public function getCurrentTime(){

    }

}