<?php
  include "connect.php";
   // load page thứ 1:  5 dữ liệu page thứ 2: 5 dữ liệu tiếp theo
  // phương thức GET bắt những giá trị trên thanh địa chỉ
  $page = $_GET['page'];
  $idloai = $_POST['idloai'];

  // $page = 1;
  // $idloai = 1;
  
  // biến này giới hạn giá trị dữ liệu về
  $space = 4;
    //  xác định vị trí đầu tiên
  // ví vụ lần đầu load từ 1->5 lần sau load từ 6->10
  $limit = ($page - 1) * $space;
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
  $query = "SELECT * FROM mon where maloai = $idloai LIMIT $limit,$space";
  $data = mysqli_query($connect,$query);
  $mang = array();
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