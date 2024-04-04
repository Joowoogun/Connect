# :pushpin: CONNECT
> 풀캘린더 API를 활용한 공모전 정보 제공 및 업무 관리 서비스


</br>

## 1. 제작 기간 & 참여 인원
- 2024년 3월 18일 ~ 2024년 4월 2일
- 팀 프로젝트
- 팀장 : 노승우
- 팀원 : 김동완 주우건 조은해 정대주

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 17
  - Python 3.11
  - MySQL 8.0
  - Mybatis 3.0
  - BeautfulSoup
  - Tomcat
  - Fullcalendar API
  - 페이징
#### `Front-end`
  - HTML
  - CSS
  - JS

</br>

## 3. ERD 설계
![](https://github.com/2024-SMHRD-KDT-BigData-23/Connect/blob/master/MavenSample04_Final2/src/main/webapp/assets/images/connect%20ERD.png)


## 4. 핵심 기능
공모전 정보 제공과 동시에 업무관리서비스(BPS)를 제공합니다.
스크랩 기능이 존재하며 스크랩한 공모전은 todoList와 Calendar에 표시됩니다.
todoList와 Calendar는 서로 연동이 됩니다.
게시글 작성, 파일첨부 및 다운로드가 가능합니다.


<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![](https://github.com/2024-SMHRD-KDT-BigData-23/Connect/blob/master/MavenSample04_Final2/src/main/webapp/assets/images/connectsystemarchytect.png)

### 4.2. 사용자 요청
![](https://github.com/2024-SMHRD-KDT-BigData-23/Connect/blob/master/MavenSample04_Final2/src/main/webapp/assets/images/connetdongbedong.png)

- **동기 요청** :pushpin: [코드 확인](https://github.com/2024-SMHRD-KDT-BigData-23/Connect/blob/master/MavenSample04_Final2/src/main/webapp/WEB-INF/views/Scrap.jsp)
  - 스크랩 리스트에서 스크랩한 공모전을 클릭하여 데이터를 Controller을 통해 class 파일로 이동시키고 dao와 mapper를 통한 기능 실행후 상세정보 페이지로 이동합니다.

- **Ajax비동기 요청** :pushpin: [코드 확인]()
  - URL의 모양새인 경우, 컨텐츠를 등록하는 POST 요청을 비동기로 날립니다.

### 4.3. Controller and Service

![](https://github.com/2024-SMHRD-KDT-BigData-23/Connect/blob/master/MavenSample04_Final2/src/main/webapp/assets/images/connectController.png)

- **요청 처리** :pushpin: [코드 확인](https://github.com/2023-SMHRD-KDT-IOT-4/Repo/blob/94e1b3a93c48cc3fdb51d4468de151930705faa6/Middle_project12/src/main/webapp/WEB-INF/views/BoardContent.jsp#L20)
  - 사용자의 요청은 모두 Controller를 통해서 받아오고 기능 수행을 위해 Class로 보내줍니다

- **결과 응답** :pushpin: [코드 확인]()
  - request.getParameter을 통해 정보를 받아오고 쿼리문에 필요한 데이터를 담고 DAO에 있는 기능을 작동 시킵니다.
  - 기능 구현이 완료되면 필요한 데이터들을 Attribute를 통해 다시 JSP로 보내줍니다.

### 4.4. Repository

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_repo.png)

- **컨텐츠 저장** :pushpin: [코드 확인]()
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. 디자인 완성 전 기능을 완성해뒀지만 사용하지못함.
- 백그라운드 프론트 각각 나눠서 작업을 하다보니 기능이 먼저 완성된적이 있습니다.

- 하지만 완성된 디자인에서 페이징 기술이 들어간 API가 적용되어있어 기존의 코드를 사용해보려고 해도 사용할수 없었습니다.

- 그래서 기존 동기식 방식이었던 코드를 아예 버리고 새로운 비동기식 코드를 작성해서 적용하게 되었습니다.

<details>
<summary><b>기존 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 기존방식은 세션에 DocumentList 라는 Attribute에 저장해 </c foreach> 방식으로 출력하는식 이었다.
 * 세션에서 가져온 아이디를 메소드를 활용하여 List<DocumentVO> 안에 담아서 보낸다.
 */
public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
    MemberVO mvo = (MemberVO) session.getAttribute("profile");
    String userId = mvo.getuserId();
		DAO dao = new DAO();
		List<DocumentVO> list = dao.DocumentSelect(userId);
		request.setAttribute("DocumentList", list);
		return "Document";
	}
~~~

</div>
</details>

- 이 방식을 활용하면 아이디별 게시글 작성 수 대로 출력은 되었으나 페이징 기능을 구현하지않은 상태였다.
- 하지만 디자인팀에서 페이징 기능까지 구현된 api를 같이 보내서 사용해보려했지만 현재의 방법은론
- js로 따로 빼둔 api의 내부에 값을 넣을수 없기 때문에 사용이 불가능했다.
- 그래서 ajax내부의 succes쪽에 페이징 api를 넣고 json 값을 가져오는 방식으로 해결했다. 

<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">

~~~java
/**
 * MemberVO 안에 들어간 profile = 로그인한 계정의 정보
 * dao.DocumentSelect(userId) = dao에 있는 metod 에 userId 활용
 * new Gson() = json 자료를 활용하기위해 import
 * return = 비동기 통신이기 때문에 리턴값이 없음
 * out.print(json) 통신 성공시 succes 값에 들어갈 값을 넣어줌
 */
  @WebServlet("/documentListAjax")
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("uft-8");

		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("profile");
		String userId = mvo.getuserId();

		DAO dao = new DAO();
		List<DocumentVO> listvo = dao.DocumentSelect(userId);

		Gson gson = new Gson();
		String json = gson.toJson(listvo);

		PrintWriter out = response.getWriter();
		out.print(json);
		return;
	}
~~~




</div>
</details>

</br>

## 6. 그 외 트러블 슈팅
<details>
<summary>npm run dev 실행 오류</summary>
<div markdown="1">

- Webpack-dev-server 버전을 3.0.0으로 다운그레이드로 해결
- `$ npm install —save-dev webpack-dev-server@3.0.0`

</div>
</details>

<details>
<summary>vue-devtools 크롬익스텐션 인식 오류 문제</summary>
<div markdown="1">
  
  - main.js 파일에 `Vue.config.devtools = true` 추가로 해결
  - [https://github.com/vuejs/vue-devtools/issues/190](https://github.com/vuejs/vue-devtools/issues/190)
  
</div>
</details>

<details>
<summary>ElementUI input 박스에서 `v-on:keyup.enter="메소드명"`이 정상 작동 안하는 문제</summary>
<div markdown="1">
  
  - `v-on:keyup.enter.native=""` 와 같이 .native 추가로 해결
  
</div>
</details>

<details>
<summary> Post 목록 출력시에 Member 객체 출력 에러 </summary>
<div markdown="1">
  
  - 에러 메세지(500에러)
    - No serializer found for class org.hibernate.proxy.pojo.javassist.JavassistLazyInitializer and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationConfig.SerializationFeature.FAIL_ON_EMPTY_BEANS)
  - 해결
    - Post 엔티티에 @ManyToOne 연관관계 매핑을 LAZY 옵션에서 기본(EAGER)옵션으로 수정
  
</div>
</details>
    
<details>
<summary> 프로젝트를 git init으로 생성 후 발생하는 npm run dev/build 오류 문제 </summary>
<div markdown="1">
  
  ```jsx
    $ npm run dev
    npm ERR! path C:\Users\integer\IdeaProjects\pilot\package.json
    npm ERR! code ENOENT
    npm ERR! errno -4058
    npm ERR! syscall open
    npm ERR! enoent ENOENT: no such file or directory, open 'C:\Users\integer\IdeaProjects\pilot\package.json'
    npm ERR! enoent This is related to npm not being able to find a file.
    npm ERR! enoent

    npm ERR! A complete log of this run can be found in:
    npm ERR!     C:\Users\integer\AppData\Roaming\npm-cache\_logs\2019-02-25T01_23_19_131Z-debug.log
  ```
  
  - 단순히 npm run dev/build 명령을 입력한 경로가 문제였다.
   
</div>
</details>    

<details>
<summary> 태그 선택후 등록하기 누를 때 `object references an unsaved transient instance - save the transient instance before flushing` 오류</summary>
<div markdown="1">
  
  - Post 엔티티의 @ManyToMany에 영속성 전이(cascade=CascadeType.ALL) 추가
    - JPA에서 Entity를 저장할 때 연관된 모든 Entity는 영속상태여야 한다.
    - CascadeType.PERSIST 옵션으로 부모와 자식 Enitity를 한 번에 영속화할 수 있다.
    - 참고
        - [https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218](https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218)
   
</div>
</details>    

<details>
<summary> JSON: Infinite recursion (StackOverflowError)</summary>
<div markdown="1">
  
  - @JsonIgnoreProperties 사용으로 해결
    - 참고
        - [http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html](http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html)
        - [https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue](https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue)
        
</div>
</details>  
    
<details>
<summary> H2 접속문제</summary>
<div markdown="1">
  
  - H2의 JDBC URL이 jdbc:h2:~/test 으로 되어있으면 jdbc:h2:mem:testdb 으로 변경해서 접속해야 한다.
        
</div>
</details> 
    
<details>
<summary> 컨텐츠수정 모달창에서 태그 셀렉트박스 드랍다운이 뒤쪽에 보이는 문제</summary>
<div markdown="1">
  
   - ElementUI의 Global Config에 옵션 추가하면 해결
     - main.js 파일에 `Vue.us(ElementUI, { zIndex: 9999 });` 옵션 추가(9999 이하면 안됌)
   - 참고
     - [https://element.eleme.io/#/en-US/component/quickstart#global-config](https://element.eleme.io/#/en-US/component/quickstart#global-config)
        
</div>
</details> 

<details>
<summary> HTTP delete Request시 개발자도구의 XHR(XMLHttpRequest )에서 delete요청이 2번씩 찍히는 이유</summary>
<div markdown="1">
  
  - When you try to send a XMLHttpRequest to a different domain than the page is hosted, you are violating the same-origin policy. However, this situation became somewhat common, many technics are introduced. CORS is one of them.

        In short, server that you are sending the DELETE request allows cross domain requests. In the process, there should be a **preflight** call and that is the **HTTP OPTION** call.

        So, you are having two responses for the **OPTION** and **DELETE** call.

        see [MDN page for CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS).

    - 출처 : [https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o](https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o)
        
</div>
</details> 

<details>
<summary> 이미지 파싱 시 og:image 경로가 달라서 제대로 파싱이 안되는 경우</summary>
<div markdown="1">
  
  - UserAgent 설정으로 해결
        - [https://www.javacodeexamples.com/jsoup-set-user-agent-example/760](https://www.javacodeexamples.com/jsoup-set-user-agent-example/760)
        - [http://www.useragentstring.com/](http://www.useragentstring.com/)
        
</div>
</details> 
    
<details>
<summary> 구글 로그인으로 로그인한 사용자의 정보를 가져오는 방법이 스프링 2.0대 버전에서 달라진 것</summary>
<div markdown="1">
  
  - 1.5대 버전에서는 Controller의 인자로 Principal을 넘기면 principal.getName(0에서 바로 꺼내서 쓸 수 있었는데, 2.0대 버전에서는 principal.getName()의 경우 principal 객체.toString()을 반환한다.
    - 1.5대 버전에서 principal을 사용하는 경우
    - 아래와 같이 사용했다면,

    ```jsx
    @RequestMapping("/sso/user")
    @SuppressWarnings("unchecked")
    public Map<String, String> user(Principal principal) {
        if (principal != null) {
            OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) principal;
            Authentication authentication = oAuth2Authentication.getUserAuthentication();
            Map<String, String> details = new LinkedHashMap<>();
            details = (Map<String, String>) authentication.getDetails();
            logger.info("details = " + details);  // id, email, name, link etc.
            Map<String, String> map = new LinkedHashMap<>();
            map.put("email", details.get("email"));
            return map;
        }
        return null;
    }
    ```

    - 2.0대 버전에서는
    - 아래와 같이 principal 객체의 내용을 꺼내 쓸 수 있다.

    ```jsx
    UsernamePasswordAuthenticationToken token =
                    (UsernamePasswordAuthenticationToken) SecurityContextHolder
                            .getContext().getAuthentication();
            Map<String, Object> map = (Map<String, Object>) token.getPrincipal();

            String email = String.valueOf(map.get("email"));
            post.setMember(memberRepository.findByEmail(email));
    ```
        
</div>
</details> 
    
<details>
<summary> 랭킹 동점자 처리 문제</summary>
<div markdown="1">
  
  - PageRequest의 Sort부분에서 properties를 "rankPoint"를 주고 "likeCnt"를 줘서 댓글수보다 좋아요수가 우선순위 갖도록 설정.
  - 좋아요 수도 똑같다면..........
        
</div>
</details> 
    
</br>

## 6. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/
