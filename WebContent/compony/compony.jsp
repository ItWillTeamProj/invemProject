<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<style type="text/css">
fieldset {
  min-width: 0;
  padding: .35em .625em .75em;
  margin: 0 2px;
  border:1px solid silver;
  text-align:center;
}
</style>
<body>
	<fieldset style="margin-left: 20px; margin-top: 20px; border-color: #6db92a;background-color:white;">
		<div id="map" style="width:80%;height:400px; margin-left: 73px; margin-top: 30px; ">
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=15a5af24f7b923277e0ae9f79ca9fa03"></script>
			<script type="text/javascript">
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.4987181,127.0311479,18.75), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(37.4987358,127.0315562,18.75); 
		
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
		
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			</script>
		</div>
		<div><br><br>
			<h2>찾아오시는 길</h2><br>
			<a href="https://map.naver.com/v5/search/%EC%82%BC%EC%9B%90%ED%83%80%EC%9B%8C/place/18786244?c=14140162.8975259,4508869.4706479,14,0,0,0,dh">상세보기</a>
			<fieldset style="margin-left: 150px; margin-right: 150px; border-radius: 0.5em; margin-top: 20px; border-color: #6db92a;background-color:white;">
				<span>삼원타워 기업,빌딩</span><br>
				<span>서울특별시 강남구 테헤란로 124</span><br>
				<span>삼원타워지번역삼동 823</span><br>
				<span>4층 ItWill</span>
			</fieldset>
		</div>
	</fieldset>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>