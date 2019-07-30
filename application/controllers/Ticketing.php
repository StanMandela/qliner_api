<?php
/**
 * Created by PhpStorm.
 * User: Cyrus Muchiri
 * Date: 09/07/2019
 * Time: 15:06
 */
include("application/controllers/Notification.php");
require APPPATH . '/libraries/REST_Controller.php';
require 'vendor/oefenweb/statistics/src/Statistics.php';


use Oefenweb\Statistics\Statistics;
use Restserver\Libraries\REST_Controller;


class ticketing extends REST_Controller
{

    private $service_rate =0 ;
    function __construct()
    {
        parent::__construct();
        /*load model*/
        $this->load->model('ticketing_model');
    }

    /**
     *
     */
    public function addCustomer_post()
    {
        //get params ( service time and mobile
        $post_data = file_get_contents("php://input");
        $decoded_post_data = json_decode($post_data);
        $service_id = $decoded_post_data->service_id;
        $mobile = $decoded_post_data->mobile;

        //get current time
        date_default_timezone_set('Africa/Nairobi');
        $date = date('Y-m-d');
        $time = date('H:i:s');

        //get service name
        $service_abbr = $this->ticketing_model->get_service_abbr($service_id)->abbrev;
        $service_name = $this->ticketing_model->get_service_abbr($service_id)->service_Name;

        //set priority levels
        $priority_level = 2;
        if ($service_id == 5) {
            $priority_level = 1;
        }

        //generate ticket number
        $previous_id = $this->ticketing_model->get_prev_id($service_name);
        $padded_string = str_pad($previous_id + 1, 3, "0", STR_PAD_LEFT);
        $ticket_no = $service_abbr . $padded_string;

        //store values to db
        $data = array(
            'ticket_no' => $ticket_no,
            'mobile_no' => $mobile,
            'date' => $date,
            'arrival_time' => $time,
            'service_id' => $service_id,
            'status_id' => 2,
            'priority_level' => $priority_level
        );

        try {
            //send values to model
            $status = $this->ticketing_model->insert_new_customer($data);

            //Calculate length of queue , waiting time , approx_service time
            $ticketNo = $ticket_no;
            $aheadInQueue = $this->getLengthOfQueue($service_name);
            $waitingTime = $this->calculateExpectedWaitingTime($aheadInQueue,$this->service_rate);
            $approxServiceTime = $this->approxServiceTime($waitingTime);

            //compose message
            $message = "Your ticket number is " . $ticketNo . ". Number of people ahead in queue " . $aheadInQueue . ". Approximate waiting time will be " . $waitingTime . ". Possible service time will be approximately at " . $approxServiceTime;
            //send

            // \Notification::sendMessage($mobile, $message);

            $response = array(

                "status" => true,
               // "result" => 'Customer added successfully, Message sent successfully'
                "result" =>$message
            );
        } catch (Exception $e) {
            $response = array(

                "status" => false,
                "result" => $e
            );
        }

        $this->response($response, REST_Controller::HTTP_OK);
    }

    /**
     * @param service_name
     * For M/M/1, Length of queue = p^2 / (1-p) where p = utilization of server
     * @return float|int
     */
    public function getLengthOfQueue($service_name)
    {
        $mean_inter_arrival_time = $this->mean_interArrivalTime_single($service_name);  //done
        $arrival_rate = 1 / $mean_inter_arrival_time; //lambda
        echo "arrival_rate"; print_r($arrival_rate);
        $mean_service_time = 2; //TODO : calculate service time
        $service_rate = 1 / $mean_service_time;
        $this->service_rate = $service_rate; // set global service rate to value of local
        $p = $arrival_rate / $service_rate;
        $length = ($p * $p) / (1 - $p);
        echo " Length"; print_r($length);
        return $length;
    }

    /**
     * Calculates interarrival time for a single queue M/M/1
     * @param $queue
     * @return float
     */
    public function mean_interArrivalTime_single($queue)
    {
        $date = date('Y-m-d');
        $interarrivaltime = $this->ticketing_model->getInterArrivalTime($queue, $date);
        echo "interarrivaltime";
        print_r($interarrivaltime);
        return $interarrivaltime;
    }


    /**
     * Calculates expected waiting time of a particular customer
     * Wq = Lq / lambda.  That is Waiting time = Length of queue / mean service rate
     * @param $length
     * @param $service_rate
     * @return float
     */
    public function calculateExpectedWaitingTime($length,$service_rate)
    {
        $expected_waiting_time = $length / $service_rate;
        return $expected_waiting_time;
    }


    /**
     * @param $waiting_time
     * @return false|string
     */
    public function approxServiceTime($waiting_time)
    {
        $time = date('h:i:s');
        $approx_service_time = date('h:i:s', strtotime($time) +strtotime($waiting_time));
        return $approx_service_time;
    }
    /**
     * Calculate interarrival time for the whole system M/M/c
     * @param $date
     * @return float
     */
    public function interArrivalTime_System($date)
    {
        //for one service M/M/1


        //for multiple service M/M/C


        return 8.0;
    }

}