<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 정보 수정</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/editInfo.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/mypage/editInfo.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/mypage/searchZip.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		
		<section id="edit_info">
			<form id="edit_info_area" method="POST" action="/mypage/update">
				<div id="edit_t">
					<div id="edit_t_l">
						<div id="edit_t_img_area"><img id="edit_img" src="<c:url value='/project_images/${memVO.profile_image }'/>"></div>
						<input type="hidden" name="profileImage" id="profileImage" value="${memVO.profile_image }">
						<div id="edit_img_btn"class="ei_cursor_pointer btn_div">이미지 변경</div>
						 <input type="file" id="imageInput" style="display: none;" accept="image/*">
					</div>
					<div id="edit_t_r">
						<div id="my_nickname_area">닉네임 :<div id="edit_nickname"> ${memVO.memNickName } </div><img id="edit_icon" src=""></div>
						
						<div id="mypet_area">
							<div>반려동물</div>
							<c:if test="${not empty petList}">
								<div class="mypet_lists">
								    <c:forEach var="pet" items="${petList}" begin="0" end="${fn:length(petList) - 1}">
								    	<div class="mypet_list">
									    	<div class="myPet_Ctg">${pet.petCtgName }</div>
									    	<div class="myPet_Name with-divider">${pet.petName}</div>
									    	<div class="representative_pet <c:if test="${pet.representative eq false}">div_display_none</c:if>">대표</div>
								    	</div>
								    </c:forEach>
							    </div>
							</c:if>
						</div>
					</div>
				</div>
				<div id="edit_b">
					<div id="info_nickname_area">
						<div class="info_config_div">닉네임</div>
						<div class="info_text_area">
							<div id="info_nickname_text_area">
								<input id="nickname_text_area"type="text" data-nickname="${memVO.memNickName}" name="memNickName" value="${memVO.memNickName}">
								<div id="nickname_check_btn" class="ei_cursor_pointer btn_div">중복 확인</div>
							</div>
						</div>
					</div>
					<div id="info_my_area">
						<div class="info_config_div">집사 정보</div>
						<div class="info_text_area">
							<div id="info_birth_area" class="info_text_list">
								<div class="info_config_name">생일</div>
								<input id="birth_year" class="birth_inner_text"type="text"  readonly value=${year }>
								<span>년</span>
								<input id="birth_month" class="birth_inner_text" type="text" readonly value=${month }>
								<span>월</span>
								<input id="birth_day" class="birth_inner_text" type="text" readonly value=${day }>
								<span>일</span>
							</div>
							<div id="info_address_address"  class="info_text_list">
								<div class="info_config_name">주소</div>
								<div id="address_no_area">
									<input type="text" id="address_no" name="memZipcode" value=${memVO.memZipcode }>
									<div id="address_btn" class="ei_cursor_pointer btn_div">주소 찾기</div>
								</div>
								<input type="text" id="address_f" class="address_inner_text" name="memAddress1" placeholder="기본주소" value="${memVO.memAddress1}"><br>
								<input type="text" id="address_s" class="address_inner_text" name="memAddress2"placeholder="상세주소" value="${memVO.memAddress2}">
							</div>
							<div id="info_phone_area"  class="info_text_list">
								<div class="info_config_name">연락처</div>
								<input id="phone_num" class="info_phone_text" type="text" name="memHP"maxlength="11" value="${memVO.memHP }">
							</div>
							<div id="pet_img_filter_lists">
								<div class="info_config_name">이미지 필터</div>
								<input type="checkbox" class="img_filter_list" name="filtering" value="1" <c:if test="${fn:contains(memVO.filtering, '1')}">checked</c:if>>개
								<input type="checkbox" class="img_filter_list" name="filtering" value="2" <c:if test="${fn:contains(memVO.filtering, '2')}">checked</c:if>>고양이
								<input type="checkbox" class="img_filter_list" name="filtering" value="3" <c:if test="${fn:contains(memVO.filtering, '3')}">checked</c:if>>기타 포유류
								<input type="checkbox" class="img_filter_list" name="filtering" value="4" <c:if test="${fn:contains(memVO.filtering, '4')}">checked</c:if>>파충류/양서류
								<input type="checkbox" class="img_filter_list" name="filtering" value="5" <c:if test="${fn:contains(memVO.filtering, '5')}">checked</c:if>>어류
								<input type="checkbox" class="img_filter_list" name="filtering" value="6" <c:if test="${fn:contains(memVO.filtering, '6')}">checked</c:if>>조류
								<input type="checkbox" class="img_filter_list" name="filtering" value="7" <c:if test="${fn:contains(memVO.filtering, '7')}">checked</c:if>>설치류
								<input type="checkbox" class="img_filter_list" name="filtering" value="8" <c:if test="${fn:contains(memVO.filtering, '8')}">checked</c:if>>절지류/곤충
							</div>
						</div>
					</div>
					<div id="info_mypet_area">
				    <div class="info_config_div">반려동물</div>
				    <div class="info_text_area">
				        <c:forEach var="i" begin="0" end="2">
				            <c:choose>
				                <c:when test="${i lt fn:length(petList)}">
				                    <c:set var="pet" value="${petList[i]}" />
				                    <div class="info_pet_area">
				                        <div class="pet_name_area">
				                            <input type="radio" name="rep_pet_radio" class="pet_radio" <c:if test="${pet.representative eq true}">checked</c:if>>
				                            <select class="pet_species" name="petVOs[${i}].petCtgNo">
				                                <option value="0">종</option>
				                                <option value="1" <c:if test="${pet.petCtgNo eq 1}">selected</c:if>>개</option>
				                                <option value="2" <c:if test="${pet.petCtgNo eq 2}">selected</c:if>>고양이</option>
				                                <option value="3" <c:if test="${pet.petCtgNo eq 3}">selected</c:if>>기타 포유류</option>
				                                <option value="4" <c:if test="${pet.petCtgNo eq 4}">selected</c:if>>파충류/양서류</option>
				                                <option value="5" <c:if test="${pet.petCtgNo eq 5}">selected</c:if>>어류</option>
				                                <option value="6" <c:if test="${pet.petCtgNo eq 6}">selected</c:if>>조류</option>
				                                <option value="7" <c:if test="${pet.petCtgNo eq 7}">selected</c:if>>설치류</option>
				                                <option value="8" <c:if test="${pet.petCtgNo eq 8}">selected</c:if>>절지류/곤충</option>
				                            </select>
				                            <input type="text" class="pet_name" name="petVOs[${i}].petName" value="${pet.petName}">
				                            <div class="pet_cancel_btn btn_div">취소</div>
				                            <div class="representative_pet <c:if test="${pet.representative eq false}">div_display_none</c:if>">대표</div>
				                        </div>
				                        <div class="pet_birth_area">
				                            <div class="info_pet_birth_div">생일</div>
				                            <div class="pet_birth_text">
				                                <input type="text" name="petVOs[${i}].birthYear" class="pet_birth_year" value="${pet.birth.split('-')[0] }" oninput="this.value = this.value.replace(/[^0-9]/g, '')"   >
				                                <span>년</span>
				                                <input type="text" name="petVOs[${i}].birthMonth" class="pet_birth_month" value="${pet.birth.split('-')[1] }" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
				                                <span>월</span>
				                                <input type="text" name="petVOs[${i}].birthDay" class="pet_birth_day" value="${pet.birth.split('-')[2] }" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
				                                <span>일</span>
				                            </div>
				                        </div>
				                    </div>
				                </c:when>
				
				                <c:otherwise>
				                    <div class="info_pet_area div_display_none">
				                        <div class="pet_name_area">
				                            <input type="radio" name="rep_pet_radio" class="pet_radio">
				                            <select class="pet_species" name="petVOs[${i}].petCtgNo">
				                                <option value="0" selected>종</option>
				                                <option value="1">개</option>
				                                <option value="2">고양이</option>
				                                <option value="3">기타 포유류</option>
				                                <option value="4">파충류/양서류</option>
				                                <option value="5">어류</option>
				                                <option value="6">조류</option>
				                                <option value="7">설치류</option>
				                                <option value="8">절지류/곤충</option>
				                            </select>
				                            <input type="text" class="pet_name" name="petVOs[${i}].petName" placeholder="반려동물 이름">
				                            <div class="pet_cancel_btn btn_div">취소</div>
				                            <div class="representative_pet div_display_none">대표</div>
				                        </div>
				                        <div class="pet_birth_area">
				                            <div class="info_pet_birth_div">생일</div>
				                            <div class="pet_birth_text">
				                                <input type="text" name="petVOs[${i}].birthYear" class="pet_birth_year" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
				                                <span>년</span>
				                                <input type="text" name="petVOs[${i}].birthMonth" class="pet_birth_month" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
				                                <span>월</span>
				                                <input type="text" name="petVOs[${i}].birthDay" class="pet_birth_day" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
				                                <span>일</span>
				                            </div>
				                        </div>
				                    </div>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				
				        <div class="info_pet_addition">
				            <div id="info_pet_addition_btn" class="info_pet_addition_btn ei_cursor_pointer btn_div">추가하기</div>
				            <div class="info_pet_addition_text">반려동물은 총 3마리까지 등록 가능합니다.</div>
				        </div>
				    </div>
				</div>
					
				</div>
				<div id="edit_regis_btn" class="btn_div">수정</div>
			</form>
		</section>
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>