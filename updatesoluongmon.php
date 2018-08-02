<?php
  include "connect.php";

  // $sttban = 2;
  // $trangthai = 0;
  $mand = $_POST['MAND'];
  $mamon = $_POST['MAMON'];
  $sttban = $_POST['STTBAN']; 
  $sohd = $_POST['SOHD'];
  $thoigian = $_POST['THOIGIAN'];
  $trangthai = $_POST['TRANGTHAI'];
  $soluong = $_POST['SOLUONG'];
  // $sohd = 17;
  $query = "call CapNhatSoLuongMon('$mand','$mamon','$sttban','$sohd','$thoigian','$trangthai','$soluong');";
  if(mysqli_query($connect,$query)){
      echo "1";
    }else{
      echo "0";
  }
 

?>