<?php
  include "connect.php";

  // $sttban = 2;
  // $trangthai = 0;
  $sohd = $_POST['SOHD'];
  $soban = $_POST['STTBAN'];
  $tthd = $_POST['TTHOADON'];
  $ttban = $_POST['TTBAN'];
  // $sohd = 17;
  $query = "call CapNhatTrangThaiHoaDon('$sohd','$soban','$tthd','$ttban');";
  if(mysqli_query($connect,$query)){
      echo "1";
    }else{
      echo "0";
  }
 

?>