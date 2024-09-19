<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>브리더 등록</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/breederRegistration.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/breederControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/mypage/breederRegistration.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/mypage/searchZip.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		
		<section id="mypage_breeder">
			<div id="mypage_l">
				<div id="breeder_control">
					<span>브리더</span>
					<a href="/mypage/breeder_regist" class="btn_div"><div id="control_mbr">등록 / 수정</div></a>
					<a href="/mypage/inquiry_lists" class="btn_div <c:if test="${mpos ==0 }">general_member</c:if>"><div id="control_mbi">문의 내역</div></a>
				</div>
			</div>
				
			<div id="mypage_r">
				<div id="mbr">
					<div id="mbr_t">
						<a href="/mypage"><div id="first_name">마이페이지</div></a>
						<a href="/mypage/my_coupon_lists"><div id="second_name">브리더 등록</div></a>
					</div>
					<div id="mbr_m">
						<form id="breaders_info_form" method="POST" action="/mypage/breederInsert">
							<div id="mgtNo_div">
								<div class="dealers_info_div">인허가번호</div>
								<div id="mgtNo_insert_area">
									<input id="mgtNo_input" type="number" name="mgtNo">
									<div id="mgtNo_btn" class="btn_div">인허가번호 확인</div>
								</div>
								
							</div>
							<div id="dealers_info_area">
								<div id="apvPermYmd_area" class="dealers_info_div_area">
									<div class="dealers_info_div">인허가일자</div>
									<input id="apvPermYmd_input" type="text" name="apvPermYmd" readonly>
								</div>
								<div id="apvCancelYmd_area" class="dealers_info_div_area">
									<div class="dealers_info_div">인허가취소일자</div>
									<input id="apvCancelYmd_input" type="text" name="apvCancelYmd" readonly>
								</div>
								<div id="bplcNm_area" class="dealers_info_div_area">
									<div class="dealers_info_div">사업장명</div>
									<input id="bplcNm_input" type="text" name="bplcNm">
								</div>
								<div id="siteTel_area" class="dealers_info_div_area">
									<div class="dealers_info_div">소재지 번호</div>
									<input id="siteTel_input" type="text" name="siteTel">
								</div>
								<div id="rdnPostNo_area" class="dealers_info_div_area">
									<div class="dealers_info_div">우편번호</div>
									<div id="rdnPostNo_insert_area">
										<input id="address_no" type="number" name="rdnPostNo">
										<div id="address_btn" class="btn_div">우편번호 검색</div>
									</div>
								</div>
								<div id="rdnWhlAddr_area" class="dealers_info_div_area">
									<div class="dealers_info_div">전체주소</div>
									<input id="address_f" type="text" name="rdnWhlAddr">
								</div>
								<div id="rdnWhlAddrdetail_area" class="dealers_info_div_area">
									<div class="dealers_info_div">상세주소</div>
									<input id="address_s" type="text" name="rdnWhlAddrdetail">
								</div>
								
							</div>
							<div id="breaders_info_submit"class="<c:if test="${mpos ==0 }">btn_div</c:if><c:if test="${mpos !=0 }">hidden_div</c:if>">등록</div>
							<div id="breaders_update_btn"class="<c:if test="${mpos !=0 }">btn_div</c:if><c:if test="${mpos ==0 }">hidden_div</c:if>">수정</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>