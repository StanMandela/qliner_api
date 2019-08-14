<?php
/**
 * Created by PhpStorm.
 * User: 25479
 * Date: 30/07/2019
 * Time: 11:02
 */

require APPPATH . '/libraries/REST_Controller.php';
require 'vendor/oefenweb/statistics/src/Statistics.php';

use Oefenweb\Statistics\Statistics;
use Restserver\Libraries\REST_Controller;
include("application/controllers/Notification.php");


class service extends REST_Controller
{


    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->model('queue_model');
        $this->load->model('ticketing_model');
        $this->load->model('service_model');
        date_default_timezone_set('Africa/Nairobi');



    }

    public function serverInstance_post()
    {
        $post_data = file_get_contents("php://input");
        $decoded_post_data = json_decode($post_data);
        $service_id = $decoded_post_data->service_id;
        $service_name = $this->ticketing_model->get_service_abbr($service_id)->service_Name;
        $customers = $this->queue_model->getItems($service_name);
        if(!empty($customers)) {
            $first_customer = $customers[0];
            $first_customer_details = $this->service_model->getCustomerDetails($first_customer->ticket_no);
            $this->service_model->changeCustomerStatus($first_customer->ticket_no, 3);

            //mark service start time
            $time = date("H:i:s");
            $this->service_model->updateServiceStartTime($first_customer->ticket_no,$time);
            $mobile = $first_customer_details->mobile_no;
            //compose message
            $message = "Ticket no " . $first_customer->ticket_no . " Your service is starting now at " . $service_name;
            //send notification of service
            // \notification::sendMessage($mobile,$message);

            $response = array(

                "status" => true,
                "customers" => $customers
            );
        }else{
            $response = array(

                "status" => false,

            );
        }





        $this->response($response, REST_Controller::HTTP_OK);
    }
    public function nextCustomer_post(){
        $post_data = file_get_contents("php://input");
        $decoded_post_data = json_decode($post_data);
        $current = $decoded_post_data->current;
        $next = $decoded_post_data->next;

        $service_id =$decoded_post_data->service_id;
        $service_name = $this->ticketing_model->get_service_abbr($service_id)->service_Name;
        //CLEAR SERVED CUSTOMER
        $currentCustomerDetails = $this->service_model->getCustomerDetails($current);
        $this->service_model->changeCustomerStatus($current,1);
        $service_stop = date("H:i:s");
        $this->service_model->updateServiceStopTime($current,$service_stop);

        //ENGAGE NEXT CUSTOMER
        if (!empty($next) || $next != "none") {// string none is set in front end
            //get customer details esp mobile
            $next_customer_Details = $this->service_model->getCustomerDetails($next);
            $mobile = $next_customer_Details->mobile_no;
            $time = date("H:i:s");
            //mark service time
            $this->service_model->updateServiceStartTime($next_customer_Details->ticket_no, $time);

            //compose message
            $message = "Ticket no " . $next . " Your service is starting now at " . $service_name;
            //send notification of service
             \notification::sendMessage($mobile,$message);
            //mark service status of previous customer to completed
            $this->service_model->changeCustomerStatus($next, 3);

            //GET NEXT ITEMS
            $nextFiveCustomers = $this->queue_model->getItems($service_name);
            $response = array(

                "status" => true,
                "customers" => $nextFiveCustomers
            );
        }else{
            $response = array(

                "status" => false,
                //"customers" => $nextFiveCustomers
            );
        }



        $this->response($response, REST_Controller::HTTP_OK);
    }

}