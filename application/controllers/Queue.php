<?php
/**
 * Created by PhpStorm.
 * User: 25479
 * Date: 09/07/2019
 * Time: 15:08
 */
use Restserver\Libraries\REST_Controller;

class queue extends REST_Controller
{
function __construct($config = 'rest')
{
    parent::__construct($config);
}
public function setQueueDiscipline_post(){

}
Public function nextInQueue_get(){

}
public function LIFO(){

}
public function FIFO(){

}
public function Others(){

}

}