<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>ConNect</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/finalimglogo.png">
<link rel="stylesheet"
	href="assets/vendor/owl-carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/vendor/owl-carousel/css/owl.theme.default.min.css">
<link href="assets/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<a href="goindex.do" class="brand-logo"> <img class="logo-abbr"
				src="assets/images/finalimglogo.png" alt="" width="40px"
				height="40px"> <img class="logo-compact"
				src="assets/images/finalmainlogo.png" alt=""> <img
				class="brand-title" src="assets/images/finalmainlogo.png" alt=""
				height="40px">
			</a>

			<div class="nav-control">
				<div class="hamburger">
					<span class="line"></span><span class="line"></span><span
						class="line"></span>
				</div>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">
						<div class="header-left">
							<div class="search_bar dropdown">
								<span class="search_icon p-3 c-pointer" data-toggle="dropdown">
									<i class="mdi mdi-magnify"></i>
								</span>
								<div class="dropdown-menu p-0 m-0">
									<form>
										<input class="form-control" type="search"
											placeholder="Contest Search" aria-label="Search">
									</form>
								</div>
							</div>
						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="SelectScrapAll.do" role="button"> <!-- data-toggle="dropdown" -->
									<img class="scrapright" src="assets/images/allpagescrap.png"
									height="10px" width="10px"> <!--  <div class="pulse-css"></div> -->
							</a>

								<div>
									<!-- 프로필 이미지 img -->
									<!-- <img src="./images/memberprofileimg/1.png" width = "30px" height = "30px" style="border-radius: 15px; margin-right: 10px;"> -->
									<!-- 프로필 닉네임 -->
									<span style="color: #593BDB; font-weight: 700;">${GetProfile.userId}</span>
								</div> <!-- 프로필 드롭다운 --></li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">

									<!-- 변경한 이미지 img --> <img class="mdi mdi-account"
									src="assets/images/memberprofileimg/1.png" width="30px"
									height="30px" style="border-radius: 15px; margin-right: 10px;">
									<!-- 원래 드롭다운 i태그 --> <!-- <i class="mdi mdi-account"></i> -->




							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="Mypage.do" class="dropdown-item"> <i
										class="icon-user"></i> <span class="ml-2">MyPage </span>
									</a> <a href="gopage-login.do" class="dropdown-item"> <i
										class="icon-key"></i> <span class="ml-2">Logout </span>
									</a>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="quixnav">
			<div class="quixnav-scroll">
				<ul class="metismenu" id="menu">
					<li class="nav-label first">MENU</li>

					<li><a href="goindex.do" aria-expanded="false"><img
							src="assets/images/contesttab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">CONTEST</span></a></li>
					<li><a href="goQuickView.do" aria-expanded="false"><img
							src="assets/images/quickviewtab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">QUICK
								VIEW</span></a></li>
					<li><a href="fullCalendar.do" aria-expanded="false"><img
							src="assets/images/calendartab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">CALENDAR</span></a></li>
					<li><a href="SelectTodoAll.do" aria-expanded="false"><img
							src="assets/images/todotab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">TO
								DO</span></a></li>
					<li><a href="documentSelect.do" aria-expanded="false"><img
							src="assets/images/documenttab.png" width="30px" height="30px"
							style="margin-right: 5px;"><span class="nav-text">DOCUMENT</span></a></li>

				</ul>
			</div>


		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid" id="mypageheader">
				<div class="row page-titles mx-0">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
							<h4>MyPage</h4>
							<p class="mb-0">회원정보를 조회 및 수정할 수 있습니다.</p>
						</div>
					</div>
					<!-- <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">App</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Profile</a></li>
                    </ol>
                </div> -->
				</div>
				<!-- row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="profile">
							<div class="profile-head">
								<div class="photo-content">
									<div class="cover-photo"></div>
									<!-- <div class="profile-photo">
                                    <img src="images/profile/profile.png" class="img-fluid rounded-circle" alt="">
                                </div> -->
									<div class="file-wrapper flie-wrapper-area">
										<div id="preview">
											<!-- 기본 이미지 -->
											<img src="assets/images/mypageprofile.png" alt="기본 이미지">
										</div>
										<div class="float-left">
											<input type="file" name="file" id="file"
												class="upload-box upload-plus" accept="image/*"
												style="color: #F7FAFC;">
											<div class="file-edit-icon">
												<button class="preview-edit">
													<img src="assets/images/addprofile.png" alt="">
												</button>
												<button class="preview-de">
													<img src="assets/images/delprofile.png" alt="">
												</button>
											</div>
										</div>

									</div>

								</div>
								<div class="profile-info">
									<div class="row justify-content-center">
										<div class="col-xl-8">
											<div class="row">
												<div class="col-xl-4 col-sm-4 border-right-1 prf-col">
													<div class="profile-name">
														<h4 class="text-primary">이름</h4>
														<p>${GetProfile.userName}</p>
													</div>
												</div>
												<div class="col-xl-4 col-sm-4 border-right-1 prf-col">
													<div class="profile-email">
														<h4 class="text-muted">이메일</h4>
														<p>${GetProfile.email}</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">회원 정보 수정</h4>
							</div>
							<div class="card-body">
								<div class="form-validation">
									<form class="form-valide" action="UpdateMypage.do" method="post"
										novalidate="novalidate">
										<div class="row">
											<div class="col-xl-12" style="margin-left: 300px">
												<div class="form-group row">
													<label class="col-lg-2 col-form-label" for="val-username">UserId
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" id="val-username"
															value="${GetProfile.userId}" disabled /> <input
															type="hidden" name="userId" value="${GetProfile.userId}">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label" for="val-email">Email
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="text" class="form-control" id="val-email"
															name="UpdateEmail" placeholder="변경할 이메일을 입력하세요."
															value="${GetProfile.email}">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label" for="val-password">Password
														<span class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<input type="password" class="form-control"
															id="val-password" name="UpdatePassword"
															placeholder="변경할 비밀번호를 입력하세요">
													</div>
												</div>
												<!--<div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-confirm-password">Confirm Password <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="password" class="form-control" id="val-confirm-password" name="val-confirm-password" placeholder="..and confirm it!">
                                                </div>
                                            </div> -->
												<div class="form-group row">
													<label class="col-lg-2 col-form-label"
														for="val-suggestions">Address <span
														class="text-danger">*</span>
													</label>
													<div class="col-lg-6">
														<textarea class="form-control" id="val-suggestions"
															name="UpdateAddress" rows="5" style="resize: none;"
															placeholder="변경할 주소를 입력하세요">${GetProfile.address}</textarea>
													</div>
												</div>
											</div>
											<div class="col-xl-12" style="margin-left: 200px">
												<div class="form-group row">
													<div class="col-lg-8 ml-auto">
														<button type="submit" class="btn btn-primary">Submit</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>



			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a>
					2019
				</p>
				<p>
					Distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a>
				</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->

	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="assets/vendor/global/global.min.js"></script>
	<script src="assets/js/quixnav-init.js"></script>
	<script src="assets/js/custom.min.js"></script>


	<!-- Vectormap -->
	<script src="assets/vendor/raphael/raphael.min.js"></script>
	<script src="assets/vendor/morris/morris.min.js"></script>


	<script src="assets/vendor/circle-progress/circle-progress.min.js"></script>
	<script src="assets/vendor/chart.js/Chart.bundle.min.js"></script>

	<script src="assets/vendor/gaugeJS/dist/gauge.min.js"></script>

	<!--  flot-chart js -->
	<script src="assets/vendor/flot/jquery.flot.js"></script>
	<script src="assets/vendor/flot/jquery.flot.resize.js"></script>

	<!-- Owl Carousel -->
	<script src="assets/vendor/owl-carousel/js/owl.carousel.min.js"></script>

	<!-- Counter Up -->
	<script src="assets/vendor/jqvmap/js/jquery.vmap.min.js"></script>
	<script src="assets/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
	<script src="assets/vendor/jquery.counterup/jquery.counterup.min.js"></script>


	<script src="assets/js/dashboard/dashboard-1.js"></script>

	<script>
		// 기본 이미지 URL
		const defaultImageURL = "assets/images/mypageprofile.png";

		function handleFileSelect(event) {
			var input = this;
			if (input.files && input.files.length) {
				var reader = new FileReader();
				this.enabled = false;
				reader.onload = function(e) {
					$("#preview").html(
							[ '<img class="thumb" src="', e.target.result,
									'" title="', escape(e.name), '"/>' ]
									.join(''));
				};
				reader.readAsDataURL(input.files[0]);
			}
		}

		$('#file').change(handleFileSelect);

		$('.file-edit-icon')
				.on(
						'click',
						'.preview-de',
						function() {
							// 이미지를 기본 이미지로 대체
							$("#preview")
									.html(
											'<img class="thumb" src="' + defaultImageURL + '" title="기본 이미지"/>');
							$("#file").val(""); // 파일 input을 비움
						});

		$('.preview-edit').click(function() {
			$("#file").click(); // 파일 input 클릭
		});
	</script>
	<script>
		// 파일 input 요소
		const fileInput = document.getElementById('#file');
		// 미리보기를 나타내는 요소
		const preview = document.getElementById('#preview');

		// 파일 선택 시 이벤트 처리
		fileInput.addEventListener('change', function(event) {
			const file = event.target.files[0];
			const reader = new FileReader();
			// 파일을 읽어들인 후 미리보기 업데이트
			
			$.ajax({
            url: "MypagePicture",
            data: sendData,
            type: 'get',
            dataType: 'json',
            success: function(res) {
                console.log("드래그 연동 성공");
            },
            error: function() {
                console.log("데이터 전송 실패!");
            }
        	});
			
			reader.onload = function(e) {
				const imageURL = e.target.result;
				preview.innerHTML = `<img src="${imageURL}" alt="선택한 이미지">`;
			};

			reader.readAsDataURL(file);
		});
		
		
		
	</script>

</body>

</html>