<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인 처리</title>
  <meta charset="utf-8">
  <!-- link href="/css/login2.css" rel="Stylesheet" type="text/css"> -->
</head>
<body>
<!-- 
<script type="text/javascript" src="https://static-www.jejupass.com/resource/PC/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://static-www.jejupass.com/resource/PC/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://static-www.jejupass.com/resource/PC/js/swiper.min.js"></script>
<script type="text/javascript" src="https://static-www.jejupass.com/resource/PC/js/p_selectbox.js"></script>
<script type="text/javascript" src="https://static-www.jejupass.com/resource/PC/js/jquery.scrollbar.min.js"></script>
<script type="text/javascript" src="https://static-www.jejupass.com/resource/PC/js/p_common.js"></script>
<script type="text/javascript" src="https://static-www.jejupass.com/resource/PC/js/moment.min.js"></script>
<script type="text/javascript" src="https://static-www.jejupass.com/resource/js/jquery.cookie.js"></script>
<script type="text/javascript" src="https://static-www.jejupass.com/resource/js/store.modern.min.js"></script>
<script type="text/javascript" src="https://api.jejupass.com/display/js/jpp.js"></script>
<script type="text/javascript" src="https://api.jejupass.com/display/js/jpp.extend.js"></script>
<script type="text/javascript" src="https://api.jejupass.com/display/js/jpp.sso.js"></script>
 -->
<div class="container">
	<div id="tabContents01" class="tabContentWrap tabOn">
		<h2 class="hidden">회원 로그인</h2>
			<fieldset class="signFrm">
				<legend>휴대폰 본인인증</legend>
				<div class="inpFrm inpDeleteAni"><!-- input value값 있을 때 삭제버튼 출력 -->
					<label for="inp_id" class="titLab">아이디(이메일)</label>
					<div class="inpA"><!-- value="croh@jejupass.co.kr" -->
						<input type="text" class="inpL" id="inp_id" maxlength="320" placeholder="E-mail을 입력해주세요." title="E-mail을 입력해주세요." onfocusout="emailValidity(this.value); return false;">
						<button type="button" class="btIco icDel" style="display: none;">삭제</button>
					</div>
					<!--<p class="txtInfo">E-mail을 입력해주세요.</p>-->
					<p class="txtErr" style="display: none" idTxtErr>이메일 형식이 맞지 	않습니다.</p>
				</div>
				<div class="inpFrm inpDeleteAni">
					<label for="inp_pwd" class="titLab">비밀번호</label>
					<div class="inpA"><!-- value="Abc12#$!A" -->
						<input type="password" class="inpL" id="inp_pwd" maxlength="16"	placeholder="비밀번호를 입력해주세요." title="비밀번호를 입력해주세요."	onfocusout="passValidity(this.value); return false;" autocomplete="off">
						<button type="button" class="btIco icDel" style="display: none;">삭제</button>
					</div>
					<p class="txtErr" style="display: none" passTxtErr>최소 8자 이상	입력해주세요.</p>
				</div>
			</fieldset>
		</div>
<h1 class="col-sm-offset-2 col-sm-10">로그인</h1>
  <form class="form-horizontal" 
        action="/member/login"
        method="post">
    <input type="hidden" name="rurl" value="${param.rurl}">    
    <input type="hidden" name="contentsno" value="${param.contentsno}">  
    <input type="hidden" name="nPage" value="${param.nPage}">   
    <!-- input type="hidden" name="nowPage" value="${param.nowPage}" -->  
    <!--input type="hidden" name="col" value="${param.col}" -->
    <!--input type="hidden" name="word" value="${param.word}"  -->        
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="id" 
        placeholder="Enter id" name="id" required="required" 
        value='${c_id_val}'>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">비밀번호</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="pwd" 
        placeholder="Enter password" name="passwd" required="required">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <div class="checkbox">
          <label>
          <c:choose>
          <c:when test="${c_id =='Y'}">
          	<input type="checkbox" name="c_id" value="Y" checked="checked"> Remember ID
          </c:when>
          <c:otherwise>
            <input type="checkbox" name="c_id" value="Y" > Remember ID
          </c:otherwise>
          </c:choose>
          </label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">로그인</button>
        <button type="button" class="btn btn-default" onclick="location.href='agree'">회원가입</button>
        <button type="button" class="btn btn-default" onclick="location.href='findid'">아이디 찾기</button>
        <button type="button" class="btn btn-default" onclick="location.href='findpw'">패스워드 찾기</button>
      </div>
    </div>
  </form>

</div>
</body>
</html>