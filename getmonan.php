<?php
    include "connect.php";
    $query = "SELECT * FROM monan";
    $data = mysqli_query($connect,$query);
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