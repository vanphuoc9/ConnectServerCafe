<?php
  include "connect.php";

  $trigia = $_POST['trigia'];
  // $trigia = 12;
  $query = "INSERT into hoadon(trigia) values('$trigia');";
  if(mysqli_query($connect,$query)){
        $id = $connect->insert_id; // trả ra mã đơn hàng
        echo $id;
    }else{
      echo "unsuccess";
  }
 

?>