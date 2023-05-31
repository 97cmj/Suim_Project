<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<head>
<meta charset="UTF-8">

	    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
        <link rel="stylesheet" href="/resources/css/board/board.css">
		<link href="/resources/css/user/signup.css" rel="stylesheet" />
        <!-- 나중에 한번에 include 할 부분 -->
        <!-- 부트스트랩 -->
        <link href="/resources/css/common/styles.css" rel="stylesheet" />
        <!-- 폰트어썸 icon -->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- reset.css  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <!-- 부트스트랩 자바스크립트 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- 타입잇 자바스크립트 -->
        <script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- 1:1문의 채팅 -->
        <script src="/resources/js/common/chatbot.js"></script>
        <!-- 게시판 js -->
        <script src="/resources/js/board/board.js"></script>
        <!-- 나중에 한번에 include 할 부분 -->

	<style>
        .content {
            width:80%;
            margin:auto;
        }
        .innerOuter { 
            width:100%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        table * {margin:5px;}
        table {width:100%;}
    </style>       
        

        
<title>자유게시판</title>

		<%@ include file="/WEB-INF/views/common/include.jsp" %>
		

</head>	


<body>	    
	 <jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="content">
        <br><br>
        <div class="innerOuter">
            <br><br>
            <h2>게시판 상세보기</h2>
            <br>

            <a class="btn btn-secondary" style="float:right; background-color: rgb(250, 107, 111);" href="list.bo">목록으로</a>
            <br><br>

            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ b.boardTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ b.memberId }</td>
                    <th>작성일</th>
                    <td>${ b.boardDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                        <a href="" download="">파일명.jpg</a>
                    </td>
                    <th>조회수</th>
                    <td>
                        ${ b.boardView }
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${ b.boardContent }</p></td>
                </tr>
            </table>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
		                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
		                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
            </div>
            <br><br>

            <!-- 댓글 기능은 나중에 ajax 배우고 나서 구현할 예정! 우선은 화면구현만 해놓음 -->
		            <table id="replyArea" class="table" align="center">
                <thead>
                	<c:choose>
                		<c:when test="${ empty loginUser }">
                			<!-- 로그인 전 -->
                			<tr>
		                        <th colspan="2">
		                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용 바랍니다.</textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
		                    </tr>
                		</c:when>
                		<c:otherwise>
                			<!-- 로그인 후 -->
		                	<tr>
		                        <th colspan="2">
		                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
		                    </tr>
                		</c:otherwise>
                	</c:choose>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">0</span>)</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <br><br>

      </div>
    	       <form id="postForm" action="" method="post">
	            	<input type="hidden" name="bno" value="${ b.boardNo }">
	            	<input type="hidden" name="filePath" value="${ b.changeName }">
	            </form>
    
    <script>
    function postFormSubmit(num) {
    	
    	// 해당 form 태그 선택 후 action 속성값을 각각 부여 후 곧바로 submit 시키기
    	if(num == 1) { // 수정하기 버튼을 클릭했을 경우
    		$("#postForm").attr("action", "updateForm.bo").submit();
    	} else { // 삭제하기 버튼을 클릭했을 경우
    		$("#postForm").attr("action", "delete.bo").submit();
    	}
    }
    
    </script>
    

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	

</body>
</html>