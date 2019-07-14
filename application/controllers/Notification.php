<?php
/**
 * Created by PhpStorm.
 * User: Cyrus Muchiri
 * Date: 09/07/2019
 * Time: 15:07
 */
use AfricasTalking\SDK\AfricasTalking;
class notification extends R
{
function __construct()
{
}

public function sendMessage($receipient, $message){
    $options['to'] = $receipient;
    $options['message'] = $message;
    $options['from'] = '';
}
}