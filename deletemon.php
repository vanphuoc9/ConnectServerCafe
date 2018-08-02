<?php
  include "connect.php";

  // $sttban = 2;
  // $trangthai = 0;

  $mamon = $_POST['MAMON'];
  $sohd = $_POST['SOHD'];
  $sttban = $_POST['STTBAN']; 
  
  // $sohd = 17;
  $query = "call XoaMon('$mamon','$sohd','$sttban');";
  if(mysqli_query($connect,$query)){
      echo "1";
    }else{
      echo "0";
  }
 

?>