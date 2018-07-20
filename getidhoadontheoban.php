<?php
  include "connect.php";
  $thanhtoan = $_POST['THANHTOAN']; // chưa thanh toán
  $trangthaiban = $_POST['TRANGTHAIBAN']; // 
  $sttban = $_POST['STTBAN'];;
  $response = array();
  $query = "SELECT distinct SOHD from `ct_dm` join ban on `ct_dm`.STTBAN = ban.STTBAN
where `ct_dm`.TRANGTHAI = '$thanhtoan' and ban.TRANGTHAI = '$trangthaiban' and `ct_dm`.STTBAN = '$sttban' limit 1;";
  $data = mysqli_query($connect, $query);
  $row = $data->fetch_assoc();
  $mahoadon = $row['SOHD'];

  $response['mahd'] = $mahoadon;

  // Khởi tạo mảng để đổ dữ liệu vào
  
  // đổ mảng về JSON
  echo json_encode($response);


?>