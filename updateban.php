<?php
  include "connect.php";

  // $sttban = 2;
  // $trangthai = 0;

  $sttban = $_POST['sttban'];
  $trangthai = $_POST['trangthai'];
  $query = "UPDATE ban set trangthai = '$trangthai' where sttban = '$sttban';";
  if(mysqli_query($connect,$query)){
      echo "1";
    }else{
      echo "0";
  }
 

?>