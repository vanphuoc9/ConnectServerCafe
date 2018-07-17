<?php
  include "connect.php";
  $query = "SELECT * FROM ban";
  $data = mysqli_query($connect, $query);
  class Ban{
  	function Ban($sttban, $trangthai){
  		$this->sttban = $sttban;
  		$this->trangthai = $trangthai;
  	}
  }
  // Khởi tạo mảng để đổ dữ liệu vào
  $arrloai = array();
  while($row = mysqli_fetch_assoc($data)){
  	array_push($arrloai, new Ban(
       $row['STTBAN'],
       $row['TRANGTHAI']
  	));
  }
  // đổ mảng về JSON
  echo json_encode($arrloai);


?>