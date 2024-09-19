<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>내 쿠폰함</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/market/marketCouponList.css'/>">
    </head>
    <body>
        <section id="mypage_market">
            <div id="mypage_r">
                <div id="mcl">
                    <div id="mcl_m">
                        <c:if test="${not empty coupon_list}">
                            <c:forEach var="coupon" items="${coupon_list}">
                                <c:choose>
                                    <c:when test="${coupon.valid_items == '반려동물용품'}">
                                        <c:set var="couponTypeR" value="pet_coupon_R" />
                                        <c:set var="couponTypeL" value="pet_coupon_L" />
                                    </c:when>
                                    <c:when test="${coupon.valid_items == '굿즈'}">
                                        <c:set var="couponTypeR" value="goods_coupon_R" />
                                        <c:set var="couponTypeL" value="goods_coupon_L" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="couponTypeR" value="all_coupon_R" />
                                        <c:set var="couponTypeL" value="all_coupon_L" />
                                    </c:otherwise>
                                </c:choose>

                                <div class="mcl_coupon ${couponTypeR}">
                                    <div class="left-section ${couponTypeL}">
                                       <span>DISCOUNT</span>
                                    </div>
                                    <div class="right-section">
                                       <div class="mcl_discount">${coupon.discount_percent}&nbsp%</div>
                                       <div class="mcl_expiration">
                                           유효기한<br>
                                           <span class="mcl_exp_date">
                                               <c:choose>
                                                   <c:when test="${coupon.valid_until == null}">
                                                       무제한
                                                   </c:when>
                                                   <c:otherwise>
                                                       ${coupon.valid_until}
                                                   </c:otherwise>
                                               </c:choose>
                                           </span>
                                       </div>
                                       <div class="mcl_use_availabe">
                                           <span>품목</span>
                                           <span class="mcl_availabe">${coupon.valid_items}</span>
                                       </div>
                                       <div class="mcl_actions">
										    <a href="javascript:void(0)" 
										    onclick="selectCoupon(${coupon.coupon_id}, 
										    ${coupon.discount_percent})">사용하기</a>
										</div>
                                    </div>
                                </div> 
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>

        <script>
     // 쿠폰 선택 시 호출되는 함수
        function selectCoupon(couponId, discountRate) {
    // 부모 창과의 상호작용이 가능한지 확인
		    if (window.opener && !window.opener.closed) {
		        try {
		            // 부모 창의 applyCoupon 함수를 호출하고 할인율과 쿠폰 ID를 전달
		            window.opener.applyCoupon(discountRate, couponId);
		        } catch (e) {
		            console.error("Error calling applyCoupon on opener: ", e);
		        }
		    } else {
		        console.error("Parent window is not available.");
		    }
		
		    // 팝업 창 닫기
		    window.close();
		}
        </script>
    </body>
</html>
