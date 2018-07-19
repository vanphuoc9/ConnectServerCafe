<?php
    include "connect.php";
    // đưa json giỏ hàng lên server
    // $json = '[{"mand":2,"mamon":5,"sttban":6,"sohd":1,"thoigian":"2018-07-01 02:22:00","trangthai":0,"soluong":1}]';
    
    $json = $_POST['jsonChitietdonhang'];
    // lấy dữ liệu trong JSON
    $data = json_decode($json,true);
    // truyền dữ liệu trong biến $data sẽ căn cứ vào key
    // đối với mỗi key sẽ trả ra giá trị trong biến $value
    foreach ($data as $key => $value) {
        $mand = $value['mand'];
        $mamon = $value['mamon'];
        $sttban = $value['sttban'];
        $sohd = $value['sohd'];
        $thoigian = $value['thoigian'];
        $trangthai = $value['trangthai'];
        $soluong = $value['soluong'];

        $query ="INSERT into `ct_dm`(mand,mamon,sttban,sohd,thoigian,trangthai,soluong) values('$mand','$mamon','$sttban','$sohd','$thoigian','$trangthai','$soluong');";
        $Dta = mysqli_query($connect,$query);
    }

    if($Dta){
        echo "1";
    }else{
        echo "0";
    }
?>