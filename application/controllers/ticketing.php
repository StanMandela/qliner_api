<?php
/**
 * Created by PhpStorm.
 * User: Cyrus Muchiri
 * Date: 09/07/2019
 * Time: 15:06
 */

namespace ticketing;

use Restserver\Libraries\REST_Controller;

class ticketing extends REST_Controller
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
    }

    /**
     *
     */
    public function addCustomer_post()
    {
            //get service chosen
            //get mobile number
            //get current time

            //generate ticket number
            //store values to db

            //send message
            //Calculate ....

            //compose message

            //send

    }
    public function getLengthOfQueue(){

    }
    public function calculateAvgWaitingTime(){

    }
    public function getCurrentTime(){

    }

}