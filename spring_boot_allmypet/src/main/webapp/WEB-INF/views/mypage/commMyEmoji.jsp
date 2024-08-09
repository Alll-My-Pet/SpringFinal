<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>북마크 페이지</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commMyEmoji.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<section id="mypage_comm">
			<div id="mypage_l">
				<div id="comm_control">
					<span>커뮤니티</span>
					<a href="/mypage/bookmark_post"><div id="control_mej">북마크 게시글</div></a>
					<a href="/mypage/bookmark_gallery"><div id="control_mej">북마크 갤러리</div></a>
					<a href="/mypage/my_post_commnet"><div id="control_mpc">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji"><div id="control_mi">내 이모지 관리</div></a>
					<a href="/mypage/my_block_list"><div id="control_bl">차단 목록</div></a>
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
					<!-- 추후 c:foreach 로 가능할지 봐야 할 부분 tr별로 5개씩 가능할 꺼로 보임-->
					<div id="mej_favorites_b">
						<table id="mej_favorites_table">
							<tr class="mej_favorites_tr">
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
							</tr>
							<tr class="mej_favorites_tr">
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
								<td class="mej_favorites_td">
									<div class="mej_favorites_mdiv">
										<div class="mej_favorites_cancel"><i class="fa-duotone fa-solid fa-xmark"></i></div>
										<div class="mej_favorites_img"><img src=""></div>
										<div class="mej_favorites_info">
											<div class="mej_favorites_name">이름</div>
											<div class="mej_favorites_prod">제작자</div>
											<div class="mej_favorites_count">사용 횟수</div>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				
				
				
				<div id="mej_made" class="mej_content_area">
					<div id="mej_made_t" class="mej_list_more">
						<div id="mej_made_name" class="mej_list_more_name">내가 만든 이모지</div>
						<a href="#"><div id="mej_made_more">+ 더보기</div></a>
					</div>
					<div id="mej_made_b" class="mej_list_total">
						<div class="mej_list_div" class="mej_list_div">
							<div class="mej_div_no">게시글 번호</div>
							<div class="mej_div_title">제목</div>
							<div class="mej_div_date">등록일</div>
							<div class="mej_div_preview">미리보기</div>
							<div class="mej_div_check">승인여부</div>
							<div class="mej_div_favorites">즐겨찾기</div>
						</div>
						<div class="mej_list_post">
					        <div class="mej_list_no">게시글 번호</div>
					        <div class="mej_list_title">제목</div>
					        <div class="mej_list_date">등록일</div>
					        <div class="spacer"></div>
					        <div class="mej_img_preview">사진</div>
					        <div class="spacer"></div>
					        <div class="mej_list_check">승인여부</div>
					        <div class="mej_list_favorites">즐겨찾기</div>
					    </div>
						<div class="mej_list_post">
					        <div class="mej_list_no">게시글 번호</div>
					        <div class="mej_list_title">제목</div>
					        <div class="mej_list_date">등록일</div>
					        <div class="spacer"></div>
					        <div class="mej_img_preview">사진</div>
					        <div class="spacer"></div>
					        <div class="mej_list_check">승인여부</div>
					        <div class="mej_list_favorites">즐겨찾기</div>
					    </div>
						<div class="mej_list_post">
					        <div class="mej_list_no">게시글 번호</div>
					        <div class="mej_list_title">제목</div>
					        <div class="mej_list_date">등록일</div>
					        <div class="spacer"></div>
					        <div class="mej_img_preview">사진</div>
					        <div class="spacer"></div>
					        <div class="mej_list_check">승인여부</div>
					        <div class="mej_list_favorites">즐겨찾기</div>
					    </div>
					</div>
				</div>
				
				<div id="mej_purchased" class="mej_content_area">
					<div id="mej_purchased_t" class="mej_list_more">
						<div id="mej_purchased_name" class="mej_list_more_name">자주 사용하는 이모지</div>
						<a href="#"><div id="mej_purchased_more">+ 더보기</div></a>
					</div>
					<div id="mej_purchased_b" class="mej_list_total">
						<div class="mej_list_div">
							<div class="mej_div_no">게시글 번호</div>
							<div class="mej_div_title">제목</div>
							<div class="mej_div_date">구매일</div>
							<div class="mej_div_preview">미리보기</div>
							<div class="mej_div_check">사용 횟수</div>
							<div class="mej_div_favorites">즐겨찾기</div>
						</div>
					<!-- 추후 c:foreach 로 변환 -->
						<div class="mej_list_post">
					        <div class="mej_list_no">게시글 번호</div>
					        <div class="mej_list_title">제목</div>
					        <div class="mej_list_date">구매일</div>
					        <div class="spacer"></div>
					        <div class="mej_img_preview">사진</div>
					        <div class="spacer"></div>
					        <div class="mej_list_nou">사용횟수</div>
					        <div class="mej_list_favorites">즐겨찾기</div>
					    </div>
					    <div class="mej_list_post">
					        <div class="mej_list_no">게시글 번호</div>
					        <div class="mej_list_title">제목</div>
					        <div class="mej_list_date">구매일</div>
					        <div class="spacer"></div>
					        <div class="mej_img_preview">사진</div>
					        <div class="spacer"></div>
					        <div class="mej_list_nou">사용횟수</div>
					        <div class="mej_list_favorites">즐겨찾기</div>
					    </div><div class="mej_list_post">
					        <div class="mej_list_no">게시글 번호</div>
					        <div class="mej_list_title">제목</div>
					        <div class="mej_list_date">구매일</div>
					        <div class="spacer"></div>
					        <div class="mej_img_preview">사진</div>
					        <div class="spacer"></div>
					        <div class="mej_list_nou">사용횟수</div>
					        <div class="mej_list_favorites">즐겨찾기</div>
					    </div><div class="mej_list_post">
					        <div class="mej_list_no">게시글 번호</div>
					        <div class="mej_list_title">제목</div>
					        <div class="mej_list_date">구매일</div>
					        <div class="spacer"></div>
					        <div class="mej_img_preview">사진</div>
					        <div class="spacer"></div>
					        <div class="mej_list_nou">사용횟수</div>
					        <div class="mej_list_favorites">즐겨찾기</div>
					    </div><div class="mej_list_post">
					        <div class="mej_list_no">게시글 번호</div>
					        <div class="mej_list_title">제목</div>
					        <div class="mej_list_date">구매일</div>
					        <div class="spacer"></div>
					        <div class="mej_img_preview">사진</div>
					        <div class="spacer"></div>
					        <div class="mej_list_nou">사용횟수</div>
					        <div class="mej_list_favorites">즐겨찾기</div>
					    </div>
				    	<!-- 추후 변경  -->
					</div>
				</div>
				
			</div>
			
			</div>
			
		</section>
	</body>
</html>