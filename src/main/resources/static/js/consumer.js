$(function () {//페이지가 로딩될때
   showList();
   showPage();
});//page loading function end  
 
let reviewUL = $(".chat");
let reviewPageFooter = $(".panel-footer");
 
function showList() {
    getList({ contentsno: contentsno, sno: sno, eno: eno })
    .then(list => {
      let str = ""
 			
 			if(list.length == 0) {
				str += "<li class='list-group-item'>";
				str += "<div class='header'><span>작성된 후기가 없습니다. 첫번째 후기를 작성해 주세요!</span></div></li>";
				$(".chat").off("click");
				}
 			
      for (var i = 0; i < list.length ; i++) {
        str += "<li class='list-group-item' data-rnum='" + list[i].rnum + "'>";
        str += "<div><div class='header'><strong class='primary-font'>" + list[i].id + "</strong>";
        str += "<small class='pull-right text-muted'>" + list[i].regdate + "</small></div>";
        str += replaceAll(list[i].content, '\n', '<br>') + "</div></li>";
      }
 
      reviewUL.html(str);
    });
 
}//showList() end
 
function replaceAll(str, searchStr, replaceStr) {
  return str.split(searchStr).join(replaceStr);
}
 
let param = '';
    param = "nPage=" + nPage;
    param += "&contentsno=" + contentsno;
 
function showPage(){
    getPage(param)
    .then(paging => {
      console.log(paging);
      let str = "<div><small class='text-muted'>" + paging + "</small></div>";
 
      reviewPageFooter.html(str);
});
}

let modal = $(".modal");
let modalInputContent = modal.find("textarea[name='content']");
 
let modalModBtn = $("#modalModBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalRegisterBtn = $("#modalRegisterBtn");
 
$("#modalCloseBtn").on("click", function (e) {
   modal.modal('hide');
});
  
$("#addReviewBtn").on("click", function (e) {
	if(id == null || id == ""){
		if(confirm("먼저 로그인을 하세요.")){
			let url = "/member/login?rurl=/contents/detail/"+contentsno+"&"+param;
			location.href=url;
			return;
		}
	} else {			
	  modalInputContent.val("");
	  modal.find("button[id !='modalCloseBtn']").hide();
	 
	  modalRegisterBtn.show();
	  $(".modal").modal("show");
	} 
});
 
modalRegisterBtn.on("click", function (e) {
 
  if (modalInputContent.val() == '') {
    alert("댓글을 입력하세요")
    return;
  }
 
  let review = {
    content: modalInputContent.val(),
    id: id,
    contentsno: contentsno
  };
  
  add(review)
    .then(result => {
      modal.find("input").val("");
      modal.modal("hide");
 
      showList();
      showPage();
 
    }); //end add
 
}); //end modalRegisterBtn.on
 
//댓글 조회 클릭 이벤트 처리 
$(".chat").on("click", "li", function (e) {
  let rnum = $(this).data("rnum");
   get(rnum)
    .then(review => {
			if($("#user_id").val()==review.id) {
				modalInputContent.val(review.content).prop("readOnly", false);
			} else {
				modalInputContent.val(review.content).prop("readOnly", true);
			};			
			
      modal.data("rnum", review.rnum);
 
      modal.find("button[id !='modalCloseBtn']").hide();

 			if($("#user_id").val()==review.id) {
	      modalModBtn.show();
      	modalRemoveBtn.show();
      	}      
      //alert($("#user_id").val());
 			//alert(review.id);
      	
      $(".modal").modal("show");
    });
});

//댓글 수정
modalModBtn.on("click", function (e) { 
  let review = { rnum: modal.data("rnum"), content: modalInputContent.val() };
  update(review)
    .then(result => {
      modal.modal("hide");
      showList();
      showPage();
    }); 
});//modify
 
//댓글 삭제
modalRemoveBtn.on("click", function (e) { 
  let rnum = modal.data("rnum"); 
  remove(rnum)
    .then(result => {
      modal.modal("hide");
      showList();
      showPage();
    }); 
});//remove


let cartBtn = $("#cartBtn");
/*
let cart = {
  count: 1,
  contentsno: contentsno,
  id: 'user1',
  size: $("#size1 option:selected").val()
};*/
//상품 담기
cartBtn.on("click", function (e) {
	if(id == null || id == ""){
		if(confirm("먼저 로그인을 하세요.")){
			let url = "/member/login?rurl=/contents/detail/"+contentsno+"&"+param;
			location.href=url;
			return;
		}
	} else {			
		let cart = {
			count:$("#count").val(),
			contentsno:contentsno,
			id:id,
			size:$("#size option:selected").val()
		};
		add2(cart)
			.then(result => {	
				alert("장바구니에 상품이 담겼습니다.");
		});	
	}
});