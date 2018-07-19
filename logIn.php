<?php
	include "connect.php";

	$response = array();
	$email = $_POST['EMAIL'];
	$matkhau = $_POST['MATKHAU'];
	//$xacnhan = 1;


	$sqlCheck = "Select EMAIL From nguoidung Where EMAIL = '$email' ";
	$resultCheck = mysqli_query($connect, $sqlCheck);
// kiem tra tai khoan da ton tai chua
	if(mysqli_num_rows($resultCheck) != 0){
		$sqlCheckLogin = "select * from nguoidung where email = '$email' and matkhau = '$matkhau' limit 1 ";
		$resultCheckLogin = mysqli_query($connect, $sqlCheckLogin);
		$row=$resultCheckLogin->fetch_assoc();
		// lấy quyền
		$quyen = $row['QUYEN'];
		$xacnhan = $row['XACNHAN'];
		$mand = $row['MAND'];

		if(mysqli_num_rows($resultCheckLogin) !=0){
			if($xacnhan !=0){
				$response["success"] = 1;
				$response["message"] = "Đăng nhập tài khoản thành công!";
			// trả quyền về
				$response["quyen"] = $quyen;
				$response["mand"] = $mand;

			}else{
				$response["success"] = 0;
				$response["message"] = "Tài khoản của bạn chưa được xác nhận!!";
			}
		}else{
			$response["success"] = 0;
			$response["message"] = "Đăng nhập không thành công!!";
		}
	}else{
		$response["success"] = 0;
		$response["message"] = "Tài khoản không tồn tại!";
	
	}
	echo json_encode($response);

?>