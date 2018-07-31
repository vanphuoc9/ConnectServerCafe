<?php
    include "connect.php";
    // // đưa json giỏ hàng lên server
    $mand = $_POST['mand'];
    $mamon = $_POST['mamon'];
    $sttban = $_POST['sttban'];
    $sohd = $_POST['sohd'];
    $thoigian = $_POST['thoigian'];
    $trangthai = $_POST['trangthai'];
    $soluong = $_POST['soluong'];

    // $mand = 4;
    // $mamon = 3;
    // $sttban = 2;
    // $sohd = 17;
    // $thoigian = '2018-01-01';
    // $trangthai = 0;
    // $soluong = 10;

    $query ="INSERT into `ct_dm`(mand,mamon,sttban,sohd,thoigian,trangthai,soluong) values('$mand','$mamon','$sttban','$sohd','$thoigian','$trangthai','$soluong');";
    $Dta = mysqli_query($connect,$query);
   

    if($Dta){
        echo "1";
    }else{
        echo "0";
    }
?>
