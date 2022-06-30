<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인 처리</title>
  <meta charset="utf-8">
  <!-- css 파일 -->
  <link href="/css/login.css" rel="Stylesheet" type="text/css">
</head>
<body>
<div class="container">
	<div id="tabContents01" class="tabLogin">
	<h2>로그인</h2>
  <form class="form-horizontal" 
        action="/member/login"
        method="post">
    <input type="hidden" name="rurl" value="${param.rurl}">    
    <input type="hidden" name="contentsno" value="${param.contentsno}">  
    <input type="hidden" name="nPage" value="${param.nPage}"> 
    <label for="id">아이디(이메일)</label>
   	<div class="form-group">
	    <input type="text" class="form-control" id="id" placeholder="ID를 입력해주세요." name="id" required="required" value='${c_id_val}'>
	      <!-- <button type="button" class="asdf" style="display: none;">삭제</button> -->
	    <div class="input-group-btn">
	    </div>    
    </div>
    <label for="passwd">비밀번호</label>
    <div class="form-group">          
      <input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd" required="required">  
    </div>
    <div class="form-group">        
      <div class="checkbox">
        <label>
        <c:choose>
        <c:when test="${c_id =='Y'}">
        	<input type="checkbox" name="c_id" value="Y" checked="checked"> Remember ID
        </c:when>
        <c:otherwise>
          <input type="checkbox" name="c_id" value="Y" > 아이디 저장
        </c:otherwise>
        </c:choose>
        </label>
      </div>
    </div>
    <div class="btnArea">
        <button type="submit" class="btnDefault btnL action">로그인</button>
    </div>
    <div class="loginBtns">
      <a role="button" class="btLink btLine" onclick="location.href='findid'" >아이디 찾기</a>
      <a role="button" class="btLink btLine" onclick="location.href='findpw'">패스워드 찾기</a>
      <a role="button" class="btLink btLine colPur" onclick="location.href='agree'">회원가입</a>
    </div>
  </form>
  </div>
</div>
</body>
</html>