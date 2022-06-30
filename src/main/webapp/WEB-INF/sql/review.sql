create table `webtest`.`review`(
   rnum int not null auto_increment primary key,
   content varchar(500) not null,
   regdate date not null,
   id varchar(10) not null,
   contentsno int(7) not null,
   foreign key (`contentsno`) references contents(`contentsno`)
);

select * from review;

insert into review(content, regdate, id, contentsno)
values('의견입니다.',sysdate(),'user1',1) ;

-- create(댓글등록)
select * from contents;
 
insert into review(content, regdate, id, contentsno)
values('의견입니다.',sysdate(), 'user1', 1) ;

-- read(댓글 내용)
select * from review
where rnum=1;

-- update(댓글 수정)
update reply
set content = '새로운 의견을 올립니다.'
where rnum = 1;
 
-- delete(댓글 삭제)
delete from REPLY
where rnum = 1;