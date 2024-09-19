<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>그린아이 분석 결과</title>
</head>
<body>
    <h2>그린아이 분석 결과</h2>
	
   	<p>성인물일 확률: ${greenVo.adult}%</p>
    <p>일반 이미지일 확률: ${greenVo.normal}%</p>
    <p>포르노일 확률: ${greenVo.porn}%</p>
    <p>성적 이미지일 확률: ${greenVo.sexy}%</p>
	
	<p>*해당 분석 결과에 따라 부적잘한 이미지로 판정될 경우 게시글이 삭제될 수 있습니다.</p>
</body>
</html>