<?php
  include "connect.php";
  $query = "SELECT * FROM loaimon";
  $data = mysqli_query($connect, $query);
  class Loaimon{
  	function Loaimon($idloai, $tenloai,$hinhloai){
  		$this->idloai = $idloai;
  		$this->tenloai = $tenloai;
  		$this->hinhloai = $hinhloai;
  	}
  }
  // Khởi tạo mảng để đổ dữ liệu vào
  $arrloai = array();
  while($row = mysqli_fetch_assoc($data)){
  	array_push($arrloai, new Loaimon(
       $row['MALOAI'],
       $row['TENLOAI'],
       $row['HINH']
  	));
  }
  // đổ mảng về JSON
  echo json_encode($arrloai);


?>