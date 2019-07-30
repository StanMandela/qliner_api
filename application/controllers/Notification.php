<?php
/**
 * Created by PhpStorm.
 * User: Cyrus Muchiri
 * Date: 09/07/2019
 * Time: 15:07
 */

include_once 'AfricasTalkingGateway.php';

//use AfricasTalking\SDK\AfricasTalking;
class Notification
{
function __construct()
{

}

public static function sendMessage($receipient,$message){
    $username = 'sandbox'; // use 'sandbox' for development in the test environment
    $apikey   = '07a60b1f8c5ee89ca3c6e6a4c9ef8a58af11761853bf6d30a892ddfcd77d9dcb'; // use your sandbox app API key for development in the test environment
    $gateway = new AfricasTalkingGateway($username, $apikey, "sandbox");
    $result =$gateway->sendMessage($receipient, $message);

}
}