<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="avilityVal.txt" var="avility" charEncoding="utf-8"></c:import>
<c:set var="myArray" value="${fn:split(avility,',')}" />
<table id="avility">
	<colgroup>
		<col width="40%">
		<col width="30%">
		<col width="30%">
	</colgroup>
	<tr>
		<th>구분</th>
		<th>1레벨 수치</th>
		<th>18레벨 수치</th>
	</tr>
	<tr>
		<td>${myArray[0]}</td>
		<td>${aList[0].attack}</td>
		<td>${aList[1].attack}</td>
	</tr>
	<tr>
		<td>${myArray[1]}</td>
		<td>${aList[0].a_speed}</td>
		<td>${aList[1].a_speed}</td>
	</tr>
	<tr>
		<td>${myArray[2]}</td>
		<td>${aList[0].health}</td>
		<td>${aList[1].health}</td>
	</tr>
	<tr>
		<td>${myArray[3]}</td>
		<td>${aList[0].mana}</td>
		<td>${aList[1].mana}</td>
	</tr>
	<tr>
		<td>${myArray[4]}</td>
		<td>${aList[0].h_regeneration}</td>
		<td>${aList[1].h_regeneration}</td>
	</tr>
	<tr>
		<td>${myArray[5]}</td>
		<td>${aList[0].m_regeneration}</td>
		<td>${aList[1].m_regeneration}</td>
	</tr>
	<tr>
		<td>${myArray[6]}</td>
		<td>${aList[0].defense}</td>
		<td>${aList[1].defense}</td>
	</tr>
	<tr>
		<td>${myArray[7]}</td>
		<td>${aList[0].m_defense}</td>
		<td>${aList[1].m_defense}</td>
	</tr>
	<tr>
		<td>${myArray[8]}</td>
		<td>${aList[0].speed}</td>
		<td>${aList[1].speed}</td>
	</tr>
	<tr>
		<td>${myArray[9]}</td>
		<td>${aList[0].crossroad}</td>
		<td>${aList[1].crossroad}</td>
	</tr>
</table>