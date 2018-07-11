<?php
 include "connect.php";
 // id món ăn
 $id = $_POST['id'];
 class tienich{
  	function tienich($idtienich,$vido,$kinhdo,$chude,$chuthich,$video,$id){
  		$this->idtienich = $idtienich;
  		$this->vido = $vido;
  		$this->kinhdo = $kinhdo;
  		$this->chude = $chude;
  		$this->chuthich = $chuthich;
  		$this->video = $video;
  		$this->id = $id;
  	}
  }
  $query = "SELECT * FROM tienich where id = $id";
  $data = mysqli_query($connect,$query);
  $mang = array();
  while($row = mysqli_fetch_assoc($data)){
      array_push($mang, new tienich(
            $row['idtienich'],
            $row['vido'],
            $row['kinhdo'],
            $row['chude'],
            $row['chuthich'],
            $row['video'],
            $row['id']  
      
      ));
  }
  echo json_encode($mang);

?>