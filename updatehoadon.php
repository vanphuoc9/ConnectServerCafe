<?php
  include "connect.php";

  // $sttban = 2;
  // $trangthai = 0;
  $sohd = $_POST['SOHD'];
  // $sohd = 17;
  $query = "call CapNhatHoaDon('$sohd');";
  if(mysqli_query($connect,$query)){
      echo "1";
    }else{
      echo "0";
  }
 

?>