$(document).ready(function() {
    console.log("notice board 들어옴");
	
    $.ajax({
        url: "documentListAjax",
        type: 'get',
        dataType: 'json',
        success: function(res) {
            console.log("documentListAjax 성공쪽 콘솔");
            console.log(res.length);
            for (let i = 0; i < res.length; i++) {
                console.log(res[i].userId);
            }
            // 총 게시글 수
            let totalPage = res.length;
            // 한 페이지 당 출력되는 게시글 갯수
            let page_num = 5;
            // 한번에 출력될 수 있는 최대 블록 수
            // ex ) [1][2][3][4][5] -> 블록
            let block_num = 5;
            // 블록의 총 수를 계산한다.
            let total_block = totalPage % page_num == 0 ? totalPage / page_num : Math.ceil(totalPage / page_num);
            // 현재 블록 위치를 알려준다
            let current_block = 1;
            /*
            게시글 데이터를 담고 있는 객체 배열
            번호 : data[게시글 번호].notice_num
            제목 : data[게시글 번호].title
            작성자 : data[게시글 번호].writer
            작성일 : data[게시글 번호].date_created
            조회 : data[게시글 번호].Lookkup_num
            좋아요 : data[게시글 번호].like
            */
            let data = [];

            // 게시글 데이터를 최신순으로 정렬하여 data에 추가한다.
            res.sort((a, b) => new Date(b.writeDate) - new Date(a.writeDate)).forEach((item, index) => {
                let postTitle = `${item.postTitle}`;
                let userId = `${item.userId}`;
                let writeDate = `${item.writeDate}`;

                data[index] = {
                    notice_num: index + 1, // 인덱스는 0부터 시작하지만 게시글 번호는 1부터 시작하는 경우
                    title: postTitle,
                    writer: userId,
                    date_created: writeDate,
                    fileIdx: item.fileIdx // 파일 인덱스 추가
                };
            });

            // 게시글 데이터 출력하기
            // 매개변수 : 선택 블럭 
            function post_data_print(block) {
                // 초기화
                // 게시글 title 제외하고 모두 제거
                let post_list = document.querySelectorAll(".data_row");
                post_list.forEach(function(item) {
                    item.remove();
                })

                // 게시글 출력 공간
                let notice_board = document.querySelector(".board_list");
                // 출력 첫 페이지 번호
                let start = (block - 1) * page_num;
                for (let i = start; i < totalPage && i < start + page_num; i++) {
                    let post = document.createElement("ul");
                    post.className = "board_row data_row";

                    let classname = ["noticeboardnum", "noticeboardtitle", "noticeboardwriter", "noticeboarddate"];

                    let post_data = [data[i].notice_num, data[i].title, data[i].writer, data[i].date_created];

                    for (let j = 0; j < classname.length; j++) {
                        let li = document.createElement("li");
                        li.className = classname[j];
                        // 게시글 제목에 링크 추가
                        if (j === 1) {
                            let link = document.createElement("a");
                            link.href = "documentView.do?fileIdx=" + data[i].fileIdx + "&work=view"; // 링크 수정
                            // 각 게시글의 페이지 주소로 수정 필요
                            link.textContent = post_data[j];
                            li.appendChild(link);
                        } else {
                            li.textContent = post_data[j];
                        }
                        post.appendChild(li);
                    }
                    notice_board.appendChild(post);
                }
            }
            // 블럭 출력하기
            // 매개변수 : 가장 앞에 오는 블럭
            function block_print(front_block) {
                /*
                1. 이전, 다음 블럭 속성 처리
                2. 기존 블럭 모두 삭제
                3. 범위 안의 블럭 생성 및 추가
                */
                current_block = front_block;

                // 이전으로 갈 블럭이 없으면
                if (front_block <= 1) {
                    document.querySelector(".before_move").style.visibility = "hidden";
                } else {
                    document.querySelector(".before_move").style.visibility = "visible";
                }

                // 다음으로 갈 블럭이 없으면
                if (front_block + block_num >= total_block) {
                    document.querySelector(".next_move").style.visibility = "hidden";
                } else {
                    document.querySelector(".next_move").style.visibility = "visible";
                }

                // 블럭을 추가할 공간
                let block_box = document.querySelector(".block");
                // 기존 블럭 모두 삭제
                block_box.replaceChildren();

                // front_block부터 total_block 또는 block_num까지 생성 및 추가
                for (let i = front_block; i <= total_block && i < front_block + block_num; i++) {
                    // 버튼을 생성한다.
                    let button = document.createElement("button");
                    button.textContent = i;
                    // 버튼을 클릭하면 게시글이 변경되는 이벤트 추가
                    button.addEventListener("click", function(event) {
                        post_data_print(i)
                    });
                    // 블럭에 추가한다.
                    block_box.appendChild(button);
                }
            }

            function before() {
                block_print(current_block - block_num);
            }

            function next() {
                block_print(current_block + block_num);
            }

            // 화면 로드 시 실행되는 이벤트
            // 게시글 데이터 출력하기
            post_data_print(1);

            // 블럭 출력하기
            block_print(1);
        },
        error: function() {
            console.error("documentListAjax 에러 쪽 콘솔.");
        }
    });
});
