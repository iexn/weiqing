<?php 
global $_W, $_GPC;
$active_id = $_GPC['pid'];
$oid = $_GPC['oid'];
$et = $_GPC['et'];

checkauth();

if(empty($active_id)) {
    message('未选择活动');
}

if(!empty($_W['fans'])) {
    $openid = $_W['fans']['openid'];
    $nickname = $_W['fans']['tag']['nickname'];
    $avatar = $_W['fans']['tag']['avatar'];
} else {
    // message('用户信息获取异常，请重新进入活动');
    return message('用户信息获取异常，请重新进入活动');
}

// 活动信息
$active = logic('Active')->getActive($active_id);
if($active === false) {
    message(logic()->getMessage());
}

if($active['design_status'] != 2) {
    return message('未找到相关分享内容');
}

$src = tomedia($active['cover']);
$src_bottom = WEB_RESOURCE. "/images/sharebottom_80_30.png";

if(strpos($src, '.') !== false) {
    $ss = explode('.', $src);
    $suffix = $ss[count($ss) - 1];
} else {
    $suffix = 'jpg';
}
switch($suffix) {
    case 'jpg':
    case 'jpeg':
        $img = imagecreatefromjpeg($src);
    break;
    case 'png':
        $img = imagecreatefrompng($src);
    break;
}

$ix = imagesx($img);
$iy = imagesy($img);


$img_bottom = imagecreatefrompng($src_bottom);
$ibx = imagesx($img_bottom);
$iby = imagesy($img_bottom);

$dom = new DOMDocument('1.0', 'UTF-8');


$qrcode = imagecreatefrompng('http://'.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'].substr(purl('qrcode', ['pid'=>$active_id, 'oid'=>$oid]), 11));
$qx = imagesx($qrcode);
$qy = imagesy($qrcode);

imagecopyresized($img_bottom, $qrcode, 80, 30, 0, 0, 100, 100, $qx, $qy);

$newimg = imagecreatetruecolor($ix, $iy + $ix / ($ibx / $iby));

imagecopyresized($newimg, $img, 0, 0, 0, 0, $ix, $iy, $ix, $iy);
imagecopyresized($newimg, $img_bottom, 0, $iy + 1, 0, 0, $ix, $ix / ($ibx / $iby), $ibx, $iby);

switch($suffix) {
    case 'jpg':
    case 'jpeg':
        header('Content-type: image/jpeg');
        imagejpeg($newimg);
    break;
    case 'png':
        header('Content-type: image/png');
        imagepng($newimg);
    break;
}

imagedestroy($newimg);

return;














$src = tomedia($active['design_img']);
if(empty($src)) {
    return message('未找到相关分享内容');
}
$data = json_decode($active['design'], true) ?: [];

if(strpos($src, '.') !== false) {
    $ss = explode('.', $src);
    $suffix = $ss[count($ss) - 1];
} else {
    $suffix = 'jpg';
}
switch($suffix) {
    case 'jpg':
    case 'jpeg':
        $img = imagecreatefromjpeg($src);
    break;
    case 'png':
        $img = imagecreatefrompng($src);
    break;
}

imagesavealpha($img, true);


$ix = imagesx($img);
$iy = imagesy($img);

$dom = new DOMDocument('1.0', 'UTF-8');

foreach ($data as $item) {
    $left   = $ix * $item['x'];
    $top    = $iy * $item['y'];
    $width  = $ix * ($item['ex'] - $item['x']);
    $height = $iy * ($item['ey'] - $item['y']);
    $name   = $item['name'];

    if(!isset($name)) {
        continue;
    }

    $dom->loadHTML(mb_convert_encoding($name, 'HTML-ENTITIES', 'UTF-8'));

    $red = 0;
    $green = 0;
    $blue = 0;
    $size = 12;
    $font = _ROOT_.'/template/resource/ttf/simsun.ttf'; // 必须为绝对路径

    // 图片
    $spans = $dom->getElementsByTagName('span');
    $imgs  = $dom->getElementsByTagName('img');
    if($spans->length > 0) {
        $styles = explode(';', $spans[0]->getAttribute('style'));

        foreach ($styles as $style) {
            list($key, $value) = explode(':', trim($style));
            $key = trim($key);
            $value = trim($value);

            switch($key) {
                case 'color': 
                    if(strpos($value, 'rgb') !== false) {
                        list($red, $green, $blue) = explode(',', substr($value, 4, -1));
                    } else {
                        $red   = dechex(substr($value, 1, 3));
                        $green = dechex(substr($value, 3, 5));
                        $blue  = dechex(substr($value, 5, 7));
                    }
                break;
                case 'font-size':
                    $size = substr($value, 0, -2);
                break;
                case 'font-family': 
                    if(strpos($value, '宋体') !== false) {
                        $font = str_replace('simsun', 'simsun', $font);
                    } else if(strpos($value, '楷体') !== false) {
                        $font = str_replace('simsun', 'simkai', $font);
                    } else if(strpos($value, '黑体') !== false) {
                        $font = str_replace('simsun', 'simhei', $font);
                    } else if(strpos($value, '幼圆') !== false) {
                        $font = str_replace('simsun', 'youyuan', $font);
                    }
                break;
                case 'font-weight':
                    if($value == 'bold') {
                        $font = str_replace('.ttf', '_bd.ttf', $font);
                    }
                break;
            }
        }

        // 获取具体文字
        $name = trim($name);
        
        if(strpos($name, '姓名') !== false) {
            $name = $nickname;
        } else if(strpos($name, '活动名称') !== false) {
            $name = $active['title'];
        }

        // 超出宽度换行显示
        $wrap = img_wordWrap($size, 0, $font, $name, $width);

        // 文字实际位置
        $arr = imagettfbbox($size, 0, $font, $name);
        $text_width  = $arr[2] - $arr[0]; // 文字占用宽度
        $text_height = $arr[1] - $arr[7]; // 文字占用高度
        $final_left  = $left + ($width - $text_width) / 2;
        $final_top   = $top + ($height - $text_height) / 2 + $size;

        $color = imagecolorallocate($img, $red, $green, $blue);

        // 写入文字
        imagettftext($img, $size, 0, $final_left, $final_top, $color, $font, $name);

    } else if($imgs->length > 0) {
        $name = '图片';

        $qrcode = imagecreatefrompng('http://'.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'].substr(purl('qrcode', ['pid'=>$active_id]), 11));
        $qx = imagesx($qrcode);
        $qy = imagesy($qrcode);

        if($qx / $qy > $width / $height) {
            $final_left = $left;
            $final_top = $top + ($width - $qx) / 2;
            $height = $width;
        } else {
            $final_left = $left + ($height - $qy) / 2;
            $final_top = $top;
            $width = $height;
        }

        imagecopyresized($img, $qrcode, $final_left, $final_top, 0, 0, $width, $height, $qx, $qy);
    }

    
    
}

header('Content-type: image/jpeg');
imagejpeg($img);
imagedestroy($img);


function img_wordWrap($fontsize,$angle,$font,$string,$width,$flag=true) {
        $y = 0;
        $content = "";
        if($flag){
            $words = explode(" ",$string);
            foreach ($words as $key=>$value) {
                $teststr = $content." ".$value;
                $testbox = imagettfbbox($fontsize, $angle, $font, $teststr);
                //判断拼接后的字符串是否超过预设的宽度
                if(($testbox[2] > $width)) {
                    $content .= "\n";
                }
                $content .= $value." ";
                
            }
                
        }else{
            //将字符串拆分成一个个单字 保存到数组 letter 中
            for ($i=0;$i<mb_strlen($string);$i++) {
                $letter[] = mb_substr($string, $i, 1);
            }
             
            foreach ($letter as $l) {
                $teststr = $content." ".$l;
                $testbox = imagettfbbox($fontsize, $angle, $font, $teststr);
                // 判断拼接后的字符串是否超过预设的宽度
                 
                if (($testbox[2] > $width) && ($content !== "")) {
                
                    $content .= "\n";   
                }
                $content .= $l;
                
                
            }
            
        }
         
        
        $data['content']=$content;
        $y = $testbox[3];
        $data['y']=$y;
        
        return $data;
}