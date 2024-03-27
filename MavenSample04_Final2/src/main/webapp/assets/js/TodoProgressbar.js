$(document).ready(function() {
		    // 페이지 로드시 실행
		    updateProgressBar();

		    // 5초마다 한 번씩 업데이트
		    setInterval(function() {
		        updateProgressBar();
		    }, 1000); // 1초마다 갱신

		    function updateProgressBar() {
		        // 전체 항목의 총 갯수
		        let totalCount = $("#Todo .list-group-item").length + $("#InProgress .list-group-item").length + $("#Done .list-group-item").length;
				console.log(totalCount);
		        // Done 항목의 갯수
		        let doneCount = $("#Done .list-group-item").length;

		        // 퍼센티지 계산
		        let percentage = (doneCount / totalCount) * 100;
				
		        // 프로그래스바 업데이트
		        let dasharray = `${percentage}, 100`;
		        $("#todoProgress").css("stroke-dasharray", dasharray , "; stroke-dashoffset: 0;");
		        $(".progressbar-text").text(`${percentage.toFixed(0)}%`);
		    }
		});