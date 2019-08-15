<?php
/**
 * Created by PhpStorm.
 * User: 25479
 * Date: 09/07/2019
 * Time: 15:08
 */
require APPPATH . '/libraries/REST_Controller.php';
require 'vendor/oefenweb/statistics/src/Statistics.php';


use Oefenweb\Statistics\Statistics;
use Restserver\Libraries\REST_Controller;

class queue extends REST_Controller
{


    function __construct($config = 'rest')
{
    parent::__construct($config);
    $this->load->model('queue_model');

}
Public function index_get(){
    $accidents_emergencies = $this->queue_model->index('accidents_emergencies');
    $laboratory =$this->queue_model->index('laboratory');
    $paediatrics= $this->queue_model->index('paediatrics');
    $pharmacy = $this->queue_model->index('pharmacy');
    $consultation = $this->queue_model->index('consultation');
    $enquiries =  $this->queue_model->index('enquiries');

    $response = array(
        "status" =>true,
        "accidents_emergencies" =>$accidents_emergencies,
        "laboratory" =>$laboratory,
        "paediatrics" =>$paediatrics,
        "pharmacy" =>$pharmacy,
        "consultation" =>$consultation,
        "enquiries" =>$enquiries
    );
    $this->response($response, REST_Controller::HTTP_OK);

}
Public function Queue_get(){
    $post_data = file_get_contents("php://input");
    $decoded_post_data = json_decode($post_data);
}
public function LIFO(){

}
public function FIFO(){

}
public function Others(){

}

}