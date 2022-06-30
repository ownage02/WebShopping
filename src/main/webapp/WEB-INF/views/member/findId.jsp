<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function findid(mname, email) {
		if (mname == '') {
			alert("이름을 입력하세요");
			document.frm.mname.focus();
		} else if (email == '') {
			alert("이메일을 입력하세요");
			document.frm.email.focus();
		} else {
			var url = "searchid";
			url += "?mname=" + mname;
			url += "&email=" + email;
		
			$.get(url, function(data, textStatus) {
				$("#searchid").text(data.str);
			})
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">아이디 찾기</h2>
		<form class="form-horizontal" action="findid" method="post" name='frm' enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="mname">이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mname"
						placeholder="이름을 입력해 주세요" name="mname">
				</div>				
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">이메일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email"
						placeholder="이메일 주소를 정확하게 입력해 주세요" name="email">
				</div>
			</div>
			<div class="col-sm-offset-2 col-sm-6">
				<button type="button" class="btn btn-default" onclick="findid(document.frm.mname.value, document.frm.email.value)">ID 찾기</button>
				<button type="reset" class="btn btn-default">취소</button>
				<div id="searchid"></div>
			</div>
		</form>
	</div>	
</body>
</html>