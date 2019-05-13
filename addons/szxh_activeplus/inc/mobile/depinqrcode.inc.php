<?php 
$str = '290d4B1x3/9mcn6whx7HrzqT78AdZUwZ7K2kNuKLstNt1quJQYUzRAxeIGkwbVR/AgDV73K+vs5GnOP6105Ojlm7EZDSAsWF81b0OqNogSz+SSGOUciYExrYL6ZSSc+KXkpjF1L0xqaRAw';

if(empty($str)) {
    return $this->result(100, '二维码无效');
}

$key = md5('pinqrcode.inc.php');
$data = authcode($str, 'DECODE', $key);

if(empty($data)) {
    return $this->result(100, '二维码无效');
}

if(empty($data['order_sn']) || empty($data['wechat_id'])) {
    return $this->result(100, '二维码无效');
}

// todo something

var_dump($str);