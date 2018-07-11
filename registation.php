<?php
	include "connect.php";

	/*Array respone*/

	$response = array();
	
	$ten = $_POST['TEN'];
	$email = $_POST['EMAIL'];
	$matkhau = $_POST['MATKHAU'];
	// $ten = "yenthai";
	// $email = "yenThaiKim@gmail.com";
	// $matkhau = "12344";


	$sqlCheck = "Select EMAIL From nguoidung Where EMAIL = '$email' ";
	$resultCheck = mysqli_query($connect, $sqlCheck);
// kiem tra tai khoan da ton tai chua
	if(mysqli_num_rows($resultCheck) != 0){
		$response["success"] = 0;
		$response["message"] = "Tài khoản đã có người sử dụng !";
	}else{
		$sqlInsertAccount = "Insert into nguoidung (TEN,EMAIL,MATKHAU) VALUES ('$ten','$email','$matkhau')";
		$resultInsertAccount = mysqli_query($connect,$sqlInsertAccount);
		if($resultInsertAccount){

				$response["success"] = 1;
				$response["message"] = "Đăng ký tài khoản thành công!";
		}else{
			
			$response["success"] = 0;
			$response["message"] = "Đăng ký tài khoản không thành công!";


		}
	}
	//return json
	echo json_encode($response);






?>