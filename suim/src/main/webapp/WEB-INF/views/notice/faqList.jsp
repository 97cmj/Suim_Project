<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	 <!-- 부트스트랩 -->
            <link href="/resources/css/common/styles.css" rel="stylesheet" />
            <!-- 폰트어썸 icon -->
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <!-- Core theme CSS (includes Bootstrap)-->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- TypeIt CDN -->
            <script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>
            <!-- jQuery CDN -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <!-- 1:1문의 js -->
            <script src="js/chatbot.js"></script>
              
            <!-- 공지사항 css -->
            <link href="/resources/css/notice/notice.css" rel="stylesheet" />
            
<style>
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            .main {
                flex: 1;
                margin-top : 90px;
            }
            footer {
                margin-top: auto;
            }

        </style>
</head>
<body>
<!-- 헤더 부분-->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- 헤더 부분 끝 -->
   
    <!-- 자주 묻는 질문 리스트 (Content) 영역 -->
    <div id="faq" class="container main">
    <form action="faqList.no">
        <div class="col-lg-12">
    
    
            <div class="table-wrapper">
                <div id="faq_header" class="table-title">
                    자주 묻는 질문
                </div>
            
                <div id="nListSearch" class="search-box">
                    <form>
                        <input type="text" placeholder="지역명, 주변명 입력">
                        <button type="submit">
                            <i class="fa fa-search" style="color : rgb(249,88,10)"></i>
                        </button>
                    </form>
                </div>
                
                <table id="faq-table" class="table">
                    <tbody>

                        <!-- 
                            .table-header 는
                            #faq-table 의 네비게이션바 역할
                        -->
                        <tr class="table-header">
                            <th>
                                분류
                            </th>
                            <th>
                                자주 묻는 질문 주제
                            </th>
                            <th>
                                <div>조회수</div>
                            </th>
                        </tr>

                        <!-- 본격 faq 목록들 -->
                        <tr id="faq_table_body">

                            <tr class="table-row detail_faq" style="background-color:none;">
                                <td class="detail_Category">[회원가입]</td>
                                <td class="faqTitle">
                                    <a href="./faqDetail.html">회원가입은 어떻게 하나요?</a>
                                </td>
                                <td class="page_views">{26} 회</td>
                            </tr>

                            <tr class="table-row detail_faq" style="background-color:none;">
                                <td class="detail_Category">[계약관련]</td>
                                <td class="faqTitle">
                                    <a href="">이 방의 판매자와 대화하고 싶어요</a>
                                </td>
                                <td class="page_views">{26} 회</td>
                            </tr>
                        
                            <tr class="table-row detail_faq" style="background-color:none;">
                                <td class="detail_Category">[신고 문의]</td>
                                <td class="title">
                                    <a href="">계약 사기를 당했어요</a>
                                </td>
                                <td class="page_views">{26} 회</td>
                            </tr>

                            <tr class="table-row detail_faq" style="background-color:none;">
                                <td class="detail_Category">[이벤트 문의]</td>
                                <td class="faqTitle">
                                    <a href="">이벤트 당첨자는 공지사항에서 확인할 수 있나요?</a>
                                </td>
                                <td class="page_views">{25} 회</td>
                            </tr>

                            <tr class="table-row detail_faq" style="background-color:none;">
                                <td class="detail_Category">[채팅 문의]</td>
                                <td class="faqTitle">
                                    <a href="">채팅 기록은 나중에 확인 가능한가요?</a>
                                </td>
                                <td class="page_views">{20} 회</td>
                            </tr>

                            <tr class="table-row detail_faq" style="background-color:none;">
                                <td class="detail_Category">[로그인 문의]</td>
                                <td class="faqTitle">
                                    <a href="">아이디와 비밀번호를 까먹었어요</a>
                                </td>
                                <td class="page_views">{25} 회</td>
                            </tr>
                        </tr>
                    </tbody>
                </table>
                
                <!-- 페이지네이션 영역 시작 -->
                <div class="pagination" >
                    <a href="#" class="previous">이전</a>
                    <a href="#" class="page-link active">1</a>
                    <a href="#" class="page-link">2</a>
                    <a href="#" class="page-link">3</a>
                    <a href="#" class="page-link">4</a>
                    <a href="#" class="page-link">5</a>
                    <a href="#" class="next">다음</a>
                </div>
                
                <!-- 페이지네이션 영역 끝 -->

            </div>
        </div>
    </form>
    </div>
<!-- 본문 영역 종료-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
      <script src="js/scripts.js"></script>
</body>
</html>