<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 이모지</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commMyEmoji.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/mypage/commMyEmoji.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
	
		<section id="mypage_comm">
			<div id="mypage_l">
				<div id="comm_control">
					<span>커뮤니티</span>
					<a href="/mypage/bookmark_post" class="btn_div"><div id="control_mej">북마크 게시글</div></a>
					<a href="/mypage/bookmark_gallery" class="btn_div"><div id="control_mej">북마크 갤러리</div></a>
					<a href="/mypage/my_post_commnet" class="btn_div"><div id="control_mpc">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji" class="btn_div"><div id="control_mi">내 이모지 관리</div></a>
					<a href="/mypage/my_block_list" class="btn_div"><div id="control_bl">차단 목록</div></a>
				</div>
			</div>
			
			<div id="mypage_r">
			
			<div id="mej">
				<div id="mej_t">
					<a href="/mypage"><div id="first_name">마이페이지</div></a>
					<a href="/mypage/my_emoji"><div id="second_name">내 이모지</div></a>
				</div>
				
				<div id="mej_favorites" class="mej_content_area">
					<div id="mej_favorites_t">
						<div id="mej_favorites_name" class="mej_list_more_name">이모지 즐겨찾기</div>
					</div>
					<div id="mej_favorites_b">
						<table id="mej_favorites_table">
						    <c:if test="${not empty emj_f_List}">
						        <c:set var="count" value="0" />
						        <tr>
						            <c:forEach var="emj_f" items="${emj_f_List}">
						                <td class="mej_favorites_td">
						                    <div class="mej_favorites_mdiv">
						                        <div class="mej_favorites_cancel" data-emjno ="${emj_f.purchaseId }"><i class="fa-duotone fa-solid fa-xmark"></i></div>
						                        <div class="mej_favorites_img emj_div" ><img class="emj_img" src="<c:url value='/emoji_images/${emj_f.emoImg}'/>" alt="Emoji Image"></div>
						                        <div class="mej_favorites_info">
						                            <div class="mej_favorites_name inner_text_div">${emj_f.emoName}</div>
						                            <div class="mej_favorites_prod inner_text_div">제작자 ${emj_f.emojiMemId}</div>
						                            <div class="mej_favorites_count">사용 횟수 ${emj_f.useCount}회</div>
						                        </div>
						                    </div>
						                </td>
						                <c:set var="count" value="${count + 1}" />
						                <c:if test="${count % 5 == 0}">
						                    </tr><tr>
						                </c:if>
						            </c:forEach>
						            
						            <!-- 남은 셀을 빈 셀로 채우기 -->
						            <c:if test="${count < 10}">
						                <c:forEach var="i" begin="${count + 1}" end="10">
						                    <td class="mej_favorites_td">
						                        <div class="mej_favorites_mdiv">
						                            <div class="mej_favorites_img"><img src="" ></div>
						                            <div class="mej_favorites_info">
						                                <div class="mej_favorites_name">이름</div>
						                                <div class="mej_favorites_prod">제작자</div>
						                                <div class="mej_favorites_count">사용 횟수</div>
						                            </div>
						                        </div>
						                    </td>
						                    <c:if test="${i % 5 == 0}">
						                        </tr><tr>
						                    </c:if>
						                </c:forEach>
						            </c:if>
						        </tr>
						    </c:if>
					        <c:if test="${empty emj_f_List}">
						        <tr>
						            <c:forEach var="i" begin="1" end="10">
						                <td class="mej_favorites_td">
						                    <div class="mej_favorites_mdiv">
						                        <div class="mej_favorites_img"><img src="" ></div>
						                        <div class="mej_favorites_info">
						                            <div class="mej_favorites_name">이름</div>
						                            <div class="mej_favorites_prod">제작자</div>
						                            <div class="mej_favorites_count">사용 횟수</div>
						                        </div>
						                    </div>
						                </td>
						                <c:if test="${i % 5 == 0}">
						                    </tr><tr>
						                </c:if>
						            </c:forEach>
						        </tr>
						    </c:if>
						</table>
					</div>
				</div>
				
				
				
				
				<div id="mej_made" class="mej_content_area">
					<div id="mej_made_t" class="mej_list_more">
						<div id="mej_made_name" class="mej_list_more_name">내가 만든 이모지</div>
						<a href="/mypage/my_emoji/made"><div id="mej_made_more">+ 더보기</div></a>
					</div>
					<div id="mej_made_b" class="mej_list_total">
						<div class="mej_list_div" class="mej_list_div">
							<div class="mej_div_no">바로가기</div>
							<div class="mej_div_title">제목</div>
							<div class="mej_div_date">등록일</div>
							<div class="mej_div_preview">미리보기</div>
							<div class="mej_div_check">승인여부</div>
							<div class="mej_div_favorites">즐겨찾기</div>
						</div>
						<c:set var="listSize" value="${fn:length(emj_e_List)}" />
						<c:set var="maxSize" value="3" />
						
						<c:forEach var="emj_e" items="${emj_e_List }" begin="0" end="${listSize < maxSize ? listSize - 1 : maxSize - 1}">
						    <div class="mej_list_post">
						        <div class="mej_list_no">${emj_e.emoNo }</div>
						        <div class="mej_list_title">${emj_e.emoName }</div>
						        <div class="mej_list_date">${emj_e.emoDate }</div>
						        <div class="spacer"></div>
						        <div class="mej_img_preview emj_div"><img class="emj_img" src="<c:url value='/emoji_images/${emj_e.emoImg}'/>" alt="Emoji Image"></div>
						        <div class="spacer"></div>
						        <div class="mej_list_check">${emj_e.approvalStatus }</div>
						        <div class="mej_list_favorites my_favorites_btn" data-emj-check ="${emj_e.approvalStatus }"  data-emo-no="${emj_e.purchaseId}">즐겨찾기</div>
						    </div>
						</c:forEach>
					</div>
				</div>
				
				<div id="mej_purchased" class="mej_content_area">
					<div id="mej_purchased_t" class="mej_list_more">
						<div id="mej_purchased_name" class="mej_list_more_name">자주 사용하는 이모지</div>
						<a href="/mypage/my_emoji/have"><div id="mej_purchased_more">+ 더보기</div></a>
					</div>
					<div id="mej_purchased_b" class="mej_list_total">
						<div class="mej_list_div">
							<div class="mej_div_no">바로가기</div>
							<div class="mej_div_title">제목</div>
							<div class="mej_div_date">구매일</div>
							<div class="mej_div_preview">미리보기</div>
							<div class="mej_div_check">사용 횟수</div>
							<div class="mej_div_favorites">즐겨찾기</div>
						</div>
						<c:forEach var="emj_p" items="${emj_p_List }" end="4" >
							<div class="mej_list_post">
						        <div class="mej_list_no">${emj_p.emoNo }</div>
						        <div class="mej_list_title">${emj_p.emoName }</div>
						        <div class="mej_list_date">${emj_p.purchaseDate }</div>
						        <div class="spacer"></div>
						        <div class="mej_img_preview emj_div"><img class="emj_img" src="<c:url value='/emoji_images/${emj_p.emoImg}'/>" alt="Emoji Image"></div>
						        <div class="spacer"></div>
						        <div class="mej_list_nou">${emj_p.useCount }</div>
						        <div class="mej_list_favorites purch_favorites_btn" data-emo-no="${emj_p.purchaseId}">즐겨찾기</div>
						    </div>
						</c:forEach>
					</div>
				</div>
				
			</div>
			
			</div>
			
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>