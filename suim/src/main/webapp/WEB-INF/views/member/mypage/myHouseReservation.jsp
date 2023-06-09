<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/user/mypage.css" rel="stylesheet" />
<%@ include file="/WEB-INF/views/common/include.jsp"%>

<style>
    body {
        background-color: #f8f9fa;
    }
    
    .table-container {
        max-width: 1320px;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
    }
    
    th {
        text-align: center;
        vertical-align: middle;
        padding: 10px 5px;
    }
    
    th.houseTitle-th {
        text-align: left;
    }

    td {
        padding: 8px;
        text-align: center;
        vertical-align: middle;        
    }
    
    
    .small {
        font-size: 12px;
    }
     .reserveNo-cell{
        width : 50px;
    }
    .houseTitle-th {
        width: 250px;
    }
    .rezDate-cell{
        width : 150px;
    }
    
    .rezHour-cell{
        width : 150px;
    }
    .memberId-cell{
        width : 150px;
    }
    .rezRequestDate-cell{
    	width : 150px;
    }
     .rezStatus-cell{
        width : 100px;
    }
     .rezStatusBtn-cell{
        width : 200px;
    }
    
    .table thead th {
        border-top: 1px solid #666;
    }
    
    .text-right {
        text-align: right;
    }
     .rez-confirm, .rez-cancel {
	        background-color: #FA6B6F;
	        color: white;
	        padding: 10px 20px;
	        border: none;
	        border-radius: 5px;
	        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.4);
	        font-weight: bold;
	        cursor: pointer;
	        transition: background-color 0.3s ease;
	        width: 70px;
	        height: 25px;
	        font-size: 13px;
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        padding : 5px 10px;
	    }
	 .button-container button:disabled {
	        opacity: 0.6;
	        cursor: not-allowed;
	    }
	
	    .button-container button:not(:disabled):hover {
	        background-color: rgb(216, 69, 9);
	    }   
	    .button-container {
		  display: flex; /* 가로로 나란히 정렬 */
		  gap: 10px; /* 버튼 사이 간격 */
		  justify-content: center; /* 가로 가운데 정렬 */
		}  
		.form-container form {
		  display: inline; /* 인라인 요소로 설정하여 가로로 나란히 배치 */
		}
			    	
    
    </style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<%@ include file="/WEB-INF/views/member/mypage/mypage-header.jsp"%>
	
	<div class="table-container" style="margin-top: 5px;">
		<table class="table">
			<thead>
				<tr>
					<th scope="col" class="reserveNo-cell"></th>
					<th scope="col" class="houseTitle-th text-center">쉐어하우스 이름</th>
                    <th scope="col" class="rezDate-cell">예약 일</th>
                    <th scope="col" class="rezHour-cell">예약 시간</th>
                    <th scope="col" class="memberId-cell">예약자 ID</th>
                    <th scope="col" class="rezRequestDate-cell">예약 신청일</th>
					<th scope="col" class="rezStatus-cell">예약 상태</th>
					<th scope="col" class="rezStatusBtn-cell">예약 상태 변경</th>
				</tr>
			</thead>
			<tbody>
				  <c:forEach var="r" items="${ list }">
                    	<tr>
                    		<td class="reserveNo-cell">${ r.rezNo }</td>
            				<td class="houseTitle-th">${ r.houseName }</td>
                    		<td class="rezDate-cell">${ r.rezDate }</td>
                    		<td class="rezHour-cell">${ r.rezHour }</td>
                    		<td class="memberId-cell">${ r.memberId }</td>
                    		<td class="rezRequestDate-cell">${ r.rezRequestDate }</td>
							<td class="rezStatus-cell">${ r.rezStatus }</td>
                    		<td class="rezStatusBtn-cell">
                    			<c:if test="${ r.rezStatus eq '예약신청' }">
	                    			<div class="button-container">
	                    				<form action="/confirmRez.rez" method="GET">
	                    					<input type="hidden" name="houseNo" value="${r.houseNo}">
										  	<input type="hidden" name="rno" value="${r.rezNo}">
										  	<button type="submit" class="rez-confirm">예약 확인</button>
										</form>
										 <button type="submit" class="rez-cancel" onclick="rezCancelPopup(${r.rezNo}, '${r.houseName}')">예약 취소</button>
									</div>
                    			</c:if>
                    			<c:if test="${ r.rezStatus eq '예약확정' }">
	                    			<div class="button-container">
	                    				<form action="/confirmRez.rez" method="GET">
										  	<input type="hidden" name="rno" value="${r.rezNo}">
										  	<button type="submit" class="rez-confirm" disabled>예약 확인</button>
										</form>
										  	<button type="submit" class="rez-cancel" onclick="rezCancelPopup(${r.rezNo}, '${r.houseName}')">예약 취소</button>
									</div>
                    			</c:if>
                    			<c:if test="${ r.rezStatus eq '예약취소' }">
	                    			<div class="button-container">
	                    				<form action="/confirmRez.rez" method="GET">
										  	<input type="hidden" name="rno" value="${r.rezNo}">
										  	<button type="submit" class="rez-confirm" disabled>예약 확인</button>
										</form>
										  	<button type="submit" class="rez-cancel" onclick="rezCancelPopup(${r.rezNo}, '${r.houseName}')" disabled>예약 취소</button>
									</div>
                    			</c:if>
                    		</td>
                    	</tr>
                  </c:forEach>
			</tbody>
		</table>
	</div>
	
	<c:if test="${ not empty conMsg }">
		<script>
				alert('${ conMsg }');
		</script>
			<c:remove var="conMsg" scope="session" />
	</c:if>
	
	<script>
		function rezCancelPopup(rezNo, houseName) {
		
			var popupUrl = "rezCancel.rez?value=" + encodeURIComponent(rezNo) + "&value2=" + encodeURIComponent(houseName);
									        
			var width = 500;
			var height = 500;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;
			var popup = window.open(popupUrl, "popup", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
		}
	</script>
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>