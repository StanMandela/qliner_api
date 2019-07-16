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
        /*load model*/
        $this->load->model('ticketing_model');
    }

    /**
     *
     */
    public function addCustomer_get()
    {
        //get params ( service time and mobile
        $service = $this->input->get('service_id');
        $mobile = $this->input->get('mobile');

        //get current time
        date_default_timezone_set('Africa/Nairobi');
        $date = date('Y-m-d');
        $time = date('H:i:s');

        //generate ticket number
        $previous_id = $this->ticketing_model->get_prev_id('Buy');
        $padded_string = str_pad($previous_id, 4, "0", STR_PAD_LEFT);
        $ticket_no = $service . $padded_string;

        //store values to db
        $data = array(
            'ticket_no' => $ticket_no,
            'mobile_no' => $mobile,
            'date'=>$date,
            'arrival_time'=>$time,
            'service_id'=> $service,
            'status_id'=> 2,
            'priority_level'=>2
        );
        $status = $this->ticketing_model->insert_new_customer($data);
        echo $status;

               //send message
                    //Calculate ....
                $ticketNo = $ticket_no;
                $aheadInQueue = $this->getLengthOfQueue();
                $waitingTime = $this->calculateAvgWaitingTime();
                $approxServiceTime=$this->approxServiceTime();


                    //compose message
                $message = "Your ticket number is " .$ticketNo. ". Number of people ahead in queue " .$aheadInQueue. ". Approximate waiting time will be " . $waitingTime . ". Possible service time will be approximately at ".$approxServiceTime;
                echo $message;
                //send

                $response = array(

                        "status" => true,
                        "result" => $message
                );

                $this->response($response,REST_Controller::HTTP_OK);
    }

    public function getLengthOfQueue()
    {
        return 40;
    }

    public function calculateAvgWaitingTime()
    {
return "3 hrs";
    }


    public function approxServiceTime(){
        return '04:10 am';
    }

}