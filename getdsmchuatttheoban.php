<?php
  include "connect.php";
  $sttban = $_POST['STTBAN'];
  class giohang{
    function giohang($mamon,$ten,$dongia,$hinh,$soluong){
      $this->mamon = $mamon;
      $this->ten = $ten;
      $this->dongia = $dongia;
      $this->hinh = $hinh;
      $this->soluong = $soluong;
    
    }
  }
  // $query = "SELECT `ct_dm`.mamon, mon.ten, mon.dongia*`ct_dm`.soluong as dongia, mon.hinh, `ct_dm`.soluong from `ct_dm` join mon on `ct_dm`.mamon = mon.mamon where trangthai = 0 and sttban = '$sttban';";
    $query = "SELECT `ct_dm`.mamon, mon.ten, mon.dongia*sum(`ct_dm`.soluong) as dongia, mon.hinh, sum(`ct_dm`.soluong) as soluong 
from `ct_dm` join mon on `ct_dm`.mamon = mon.mamon where trangthai = 0 and sttban = '$sttban' group by mamon;";
  $data = mysqli_query($connect,$query);
  $mang = array();
  while($row = mysqli_fetch_assoc($data)){
      array_push($mang, new giohang(
            $row['mamon'],
            $row['ten'],
            $row['dongia'],
            $row['hinh'],
            $row['soluong']  
      ));
  }
  echo json_encode($mang);
?>