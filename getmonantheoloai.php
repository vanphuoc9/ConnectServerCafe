<?php
  include "connect.php";
   // load page thứ 1:  5 dữ liệu page thứ 2: 5 dữ liệu tiếp theo
  // phương thức GET bắt những giá trị trên thanh địa chỉ
  $page = $_GET['page'];
  $idloai = $_POST['idloai'];
  
  // biến này giới hạn giá trị dữ liệu về
  $space = 6;
    //  xác định vị trí đầu tiên
  // ví vụ lần đầu load từ 1->5 lần sau load từ 6->10
  $limit = ($page - 1) * $space;
  class monan{
  	function monan($id,$tenmon,$hinhmon,$motamon,$nguyenlieu,$cachlam,$idloai){
  		$this->id = $id;
  		$this->tenmon = $tenmon;
  		$this->hinhmon = $hinhmon;
  		$this->motamon = $motamon;
  		$this->nguyenlieu = $nguyenlieu;
  		$this->cachlam = $cachlam;
  		$this->idloai = $idloai;
  	}
  }
  $query = "SELECT * FROM monan where idloai = $idloai LIMIT $limit,$space";
  $data = mysqli_query($connect,$query);
  $mang = array();
  while($row = mysqli_fetch_assoc($data)){
      array_push($mang, new monan(
            $row['id'],
            $row['tenmon'],
            $row['hinhmon'],
            $row['motamon'],
            $row['nguyenlieu'],
            $row['cachlam'],
            $row['idloai']  
      
      ));
  }
  echo json_encode($mang);
?>