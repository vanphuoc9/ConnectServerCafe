<?php
  include "connect.php";

  $keyword = $_POST['KEYWORD'];
  class mon{
    function mon($mamon,$maloai,$ten,$hinh,$mota,$dongia){
      $this->mamon = $mamon;
      $this->maloai = $maloai;
      $this->ten = $ten;
      $this->hinh = $hinh;
      $this->mota = $mota;
      $this->dongia = $dongia;
    
    }
  }
  $query = "call TimKiemMon('$keyword');";
  $mang = array();
  $data = mysqli_query($connect,$query);
  while($row = mysqli_fetch_assoc($data)){
      array_push($mang, new mon(
            $row['MAMON'],
            $row['MALOAI'],
            $row['TEN'],
            $row['HINH'],
            $row['MOTA'],
            $row['DONGIA']  
      
      ));
  }
  echo json_encode($mang);
 

?>