<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>ConNect</title>
    <!-- Favicon icon -->
    ClickContestInfo<link rel="icon" type="image/png" sizes="16x16" href="assets/images/finalimglogo.png"> href="assets/images/ConNectlogo.png">
    <link href="assets/css/style.css" rel="stylesheet">

</head>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">Sign up your account</h4>
                                    <form action="Join.do">
                                    
                                    	<!--   프로필 사진  
                                    	<div class="box_profile" align="center" style="border-radius: 50%; overflow: hidden;">
    										<img class="profilepicture" width="150px" height="150px" style="border-radius: 50%;" src="https://news.nateimg.co.kr/orgImg/mw/2023/01/07/2023010709062327023_1.jpg">
										</div>-->
										
                                        <div class="form-group">
                                            <label><strong>Username</strong></label>
                                            <input type="text" class="form-control" name="userName" placeholder="이름을 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Userid</strong></label>
                                            <input type="text" class="form-control" name="userId" placeholder="아이디를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Password</strong></label>
                                            <input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Address</strong></label>
                                            <input type="text" class="form-control" name="address" placeholder="주소를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Email</strong></label>
                                            <input type="email" class="form-control" name="email" placeholder="hello@example.com">
                                        </div>
                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-block">Sign me up</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Already have an account? <a class="text-primary" href="gopage-login.do">Sign in</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="assets/vendor/global/global.min.js"></script>
    <script src="assets/js/quixnav-init.js"></script>
    <!--endRemoveIf(production)-->
</body>

</html>