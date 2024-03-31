<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>CONNECT</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/finalimglogo.png">
    <link href="assets/css/style.css" rel="stylesheet">
    <style>
        .logoimg{
            margin-top: 50px;
            margin-bottom: 70px;
        }
        .authincation-content, .auth-form{
            max-width: 750px !important;
            max-height: 480px !important;
            min-width: 750px !important;
            min-height: 480px !important;
            align-items: center;
           
        }
        .auth-form h4{
            font-weight: 500;
            line-height: 1.2;
            color: #3d4465;
            font-size: 30px;
            text-align: center;
            overflow: hidden; /* 이 부분은 텍스트가 한 글자씩 나타나게 하기 위해 필요합니다. */
            white-space: nowrap; /* 이 부분은 텍스트가 한 줄에 나타나게 합니다. */
            animation: typing 1s steps(40, end);
        }
        .btn {
            height: 70px !important;
            width: 100px;
            font-size: 20px;
            box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.7); /* 그림자 추가 */
        }
        .text-center{
            padding-left: 300px;
        }

        /* 아래는 텍스트가 흔들리는 효과를 주는 CSS 애니메이션입니다. */
        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }

        /* 페이드 아웃 애니메이션을 정의합니다. */
        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }
    </style>
</head>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                    <div class="authincation-content" id="authContent">
                        <div class="row no-gutters">
                                <div class="auth-form">
                                    <h4><span id="typedText"></span></h4>
                                    <form>
                                        <div class="logoimg">
                                            <img src="assets/images/finalimglogo.png" width="200px" height ="150px">
                                            <img src="assets/images/finalmainlogo.png" width="400px" height ="150px">
                                        </div>
                                        <div class="text-center">
                                            <button type="button" class="btn btn-primary btn-block" id="startButton">START</button>
                                        </div>
                                    </form>
                                </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!-- #/ container-fluid -->
    <!-- Common JS -->
    <script src="assets/vendor/global/global.min.js"></script>
    <!-- Custom script -->
    <script src="assets/vendor/quixnav/quixnav.min.js"></script>
    <script src="assets/js/quixnav-init.js"></script>
    <script src="assets/js/custom.min.js"></script>
    <script>
        // JavaScript를 사용하여 텍스트를 한 글자씩 입력하는 효과를 구현합니다.
        const text = "Welcome to CONNECT!";
        let index = 0;

        function type() {
            if (index < text.length) {
                document.getElementById('typedText').textContent += text.charAt(index);
                index++;
                setTimeout(type, 150);
            }
        }

        type();

        // 페이지 이동 및 페이드 아웃 처리를 담당하는 함수
        function fadeOutAndNavigate() {
            // authincation-content 요소를 페이드 아웃 시킴
            document.getElementById('authContent').style.animation = 'fadeOut 1s ease-in-out forwards';

            // 페이지 이동 시뮬레이션 (1초 후에 페이지 이동)
            setTimeout(function() {
                window.location.href = 'gopage-login.do'; // 페이지 이동
            }, 1000);
        }

        // "START" 버튼 클릭 시 페이지 이동과 페이드 아웃을 실행하는 이벤트 핸들러를 설정합니다.
        document.getElementById('startButton').addEventListener('click', fadeOutAndNavigate);
    </script>
</body>

</html>
