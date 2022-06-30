<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function findpw(mname, id) {
		if (mname == '') {
			alert("이름을 입력하세요");
			document.frm.mname.focus();
		} else if (id == '') {
			alert("ID를 입력하세요");
			document.frm.id.focus();
		} else {
			var url = "searchpw";
			url += "?mname=" + mname;
			url += "&id=" + id;
		
			$.get(url, function(data, textStatus) {
				$("#searchpw").text(data.str);
			})
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">비밀번호 찾기</h2>
		<form class="form-horizontal" action="findpw" method="post" name='frm' enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="mname">이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mname"
						placeholder="이름을 입력해 주세요" name="mname">
				</div>				
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="id"
						placeholder="ID를 입력해 주세요" name="id">
				</div>
			</div>
			<div class="col-sm-offset-2 col-sm-6">
				<button type="button" class="btn btn-default" onclick="findpw(document.frm.mname.value, document.frm.id.value)">비밀번호 찾기</button>
				<button type="reset" class="btn btn-default">취소</button>
				<div id="searchpw"></div>
			</div>
		</form>
	</div>	
</body>
</html>