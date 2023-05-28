<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어하우스 쉼</title>
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
</head>
<body>
	<header>
	        <nav class="navbar navbar-expand-lg navbar-light fixed-top header_wrap" id="mainNav">
	            <div class="header container px-4 px-lg-5">
	                <a class="navbar-brand" href="#page-top"><img class="logo" src="/resources/img/common/sim5.png"></a>
	                
	                <ul class="nav nav-pills navi">
	                    
	                        <li class="nav-item"><a href="#" class="nav-link nav-text">방 찾기</a></li>
	                        <li class="nav-item">
	                            <a href="#" class="nav-link nav-text">쉼</a>
	                            <ul>
	                                <li><a href="">쉼 소개</a></li>
	                            </ul>
	                        </li>
	                        <li class="nav-item">
	                            <a href="#" class="nav-link nav-text">커뮤니티</a>
	                            <ul>
	                                <li><a href="">자유게시판</a></li>
	                                <li><a href="">입주후기</a></li>
	                                <li><a href="">사람구해요</a></li>
	                            </ul>
	                        </li>
	                        <li class="nav-item">
	                            <a href="#" class="nav-link nav-text">로그인</a>
	                        </li>
	                        <li class="nav-item">
	                            <a href="#" class="nav-link nav-text">고객센터</a>
	                            <ul>
	                                <li><a href="">공지사항</a></li>
	                                <li><a href="">자주 묻는 질문</a></li>
	                            </ul>
	                        </li>
	                </ul>
	                
	                    <!-- 햄버거 메뉴 -->
	                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
	                            <span class="navbar-toggler-icon"></span>
	                    </button>
	                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	                        <div class="offcanvas-header">
	                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">&nbsp;&nbsp;&nbsp;&nbsp;로그인 해주세요.</h5>
	                            <button type="button" class="btn-close text-reset"
	                                data-bs-dismiss="offcanvas" aria-label="Close"></button>
	                        </div>
	                        <div class="offcanvas-body">
	
	                            <div class="user-button">
	                                <button type="button"
	                                    style="width: 150px; margin-right: 20px; margin-left: 20px;"
	                                    class="btn btn-success btn-lg">로그인</button>
	                                <button type="button" style="width: 150px;"
	                                    class="btn btn-outline-success btn-lg">회원가입</button>
	                            </div>
	
	                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3 pb-2">
	                                <li class="nav-item offcanvas-text m-4">
	                                    <a class="side-black" aria-current="page" href="#">방 찾기</a>
	                                </li>
	                                <li class="nav-item dropdown m-4">
	                                    <a class="side-black" href="#" id="offcanvasNavbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">셰어하우스 쉼</a>
	                                        <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown1">
	                                           <li><a class="dropdown-item" href="#">쉼 소개</a></li>
	                                        </ul> 
	                                </li>
	                                <li class="nav-item dropdown m-4"><a class="side-black" href="#" id="offcanvasNavbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티 </a>
	                                    <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown2">
	                                        <li><a class="dropdown-item" href="#">자유게시판</a></li>
	                                        <li><a class="dropdown-item" href="#">사람구해요</a></li>
	                                        <li><a class="dropdown-item" href="#">입주 후기 </a></li>                                            
	                                    </ul>
	                                </li>
	                                <li class="nav-item dropdown m-4"><a class="side-black" href="#" id="offcanvasNavbarDropdown3" role="button" data-bs-toggle="dropdown" aria-expanded="false">고객센터 </a>
	                                    <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown3">
	                                        <li><a class="dropdown-item" href="#">공지사항</a></li>
	                                        <li><a class="dropdown-item" href="#">자주 묻는 질문</a></li>                        
	                                    </ul>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	            </div>
	        </nav>
	    </header>