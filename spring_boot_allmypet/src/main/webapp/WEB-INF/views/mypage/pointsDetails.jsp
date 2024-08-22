<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>포인트 내역</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/pointsDetails.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/mypage/pointDetails.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		
		<section id="mp_points_details">
			<div id="mp_pd_area">
				<div id="mp_pd_t">
					<div id="mp_pd_t_l">
						<div id="mp_pd_name_area">현재 포인트</div>
						<div id="mp_pd_point_area">
							<img id="mp_pd_point_img" src="<c:url value='/image/point.png'/>">
							<div id="mp_pd_point_total">${memVO.point } P</div>
						</div>
					</div>
					<div id="mp_pd_t_r">
						<div id="mp_pd_total_btn" class="btn_div">월간 전체 내역 보기</div>
						<div id="mp_pd_plus_btn" class="mp_pd_btn btn_div">월간 적립 내역 보기</div>
						<div id="mp_pd_minus_btn" class="mp_pd_btn btn_div">월간 사용 내역 보기</div>
					</div>
				</div>
				<div id="mp_pd_m">
					<div id="mp_pd_month_area">
						<div id="mp_pd_month_left_btn" class="month_arrow_btn mp_cursor_pointer btn_div">◀</div>
						<div id="mp_pd_month_num_area">
							<div id="mp_pd_month_num">${Month }</div>
							<div>월</div>
						</div>
						<div id="mp_pd_month_right_btn" class="month_arrow_btn mp_cursor_pointer btn_div">▶</div>
					</div>
					<div id="mp_pd_tbc">
						<div id="pd_tbc_plus_area">
							<div>총 적립 포인트 : </div>
							<div id="pd_tbc_plus">${positive } P</div>
						</div>
						<div id="pd_tbc_minus_area">
							<div>총 사용 포인트 : </div>
							<div id="pd_tbc_minus">${negative } P</div>
						</div>
					</div>
					<div id="mp_pd_point_history">
						<c:if test="${not empty pointList }">
							<c:forEach var="pointInfo" items="${pointList }"  >
								<c:set var="pointClass" value="${pointInfo.point_change > 0 ? 'mp_point_plus' : 'mp_point_minus'}" />
								<c:set var="pointSign" value="${pointInfo.point_change > 0 ? '+' : ''}" />
								<div class="mp_point_history_div ${pointClass}">
								    <div class="point_class">${pointInfo.reason}</div>
								    <div class="point_date">${pointInfo.change_date}</div>
								    <div class="point_count">${pointSign}${pointInfo.point_change}</div>                            
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div id="mp_pd_b">
					<div id="mp_pd_b_t">포인트 모으는 팁 <i class="fa-regular fa-lightbulb"></i></div>
					<div id="mp_pd_b_m">
						<ul>
						  <li> 로그인하여 일일 미션을 달성해보세요! </li>
						  <li> 게시글 작성 후 베스트 양육팁으로 선정되거나 핫게시글 선정, 정보게시판에 선정될 경우에는 추가 포인트가 지급됩니다! </li>
						  <li> 이달의 갤러리, 베스트 이모지로 선정될 경우에도 추가 포인가 있어요. </li>
						</ul>
					</div>
					<div id="mp_pd_b_b">
						<div id="mp_pd_b_title">포인트 사용처 <img id="mp_pd_b_im" src="<c:url value='/image/point.png'/>"></div>
						<ul>
							<li> 1000P 이상부터는 올마이펫 마켓에서 사용 가능 합니다!</li>
							<li> 이모지페이지에서 이모지를 구입 해 보세요!</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>