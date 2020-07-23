<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<script>
/*
$(function() {
	$(".delete-form").hide();
	$(".btn-delete").click(function(){
		$(".delete-form").show();
		var messageId = $(this).attr("data-message-id");
		$("#delete-input-id").val(messageId);
	});
});
*/
$(function() {
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget);
		var recipient = button.data('message-id');
		var modal = $(this);
		modal.find('#recipient-name').val(recipient);
	});
});
</script>
</head>
<body class="bg-light">
<%-- 
<div>
${info }
</div>
<c:remove var="info" />
<div>
<form action="write" method="post">
이름: <input type="text" name="name" required="required"/> <br />
암호: <input type="password" name="password" required="required"/> <br />
메시지: <textarea name="message" rows="3" required="required"></textarea>
<br />
<input type="submit" value="등록"/>
</form>
</div>
--%>

<div class="container my-3 shadow p-3">
<my:alert />
<h1>방명록</h1>
<form action="write" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">이름:</label>
    <input required="required" type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">암호:</label>
    <input required="required" type="password" name="password" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">메시지:</label>
    <textarea required="required" name="message" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
  <button type="submit" class="btn btn-primary">메시지 등록</button>
</form>
</div>

<hr />
<%-- 
<div>
	<c:forEach var="message" items="${list.messageList }">
		<div class="border">
			<h6>${message.id } : ${message.guestName }</h6>
			<p>${message.message }</p>
			<p><button data-message-id="${message.id}" class="btn btn-danger btn-delete">삭제하기</button></p>
		</div>
	</c:forEach>
</div>
--%>

<div class="container my-3 shadow p-3">
	<c:forEach var="message" items="${list.messageList }">
		<div class="media border p-3">
			<span class="mr-3">${message.id }</span>
			<div class="media-body">
				<h5 class="mt-0">${message.guestName }</h5>
				${message.message }
				
				<!--  <button data-message-id="${message.id}" class="btn btn-danger btn-delete">삭제하기</button> -->
				<a data-toggle="modal" href="#exampleModal"
						data-message-id="${message.id }" class="btn-delete">삭제하기</a>
			</div>
		</div>
	</c:forEach>
</div>

<%-- 
<div>
	<c:forEach begin="1" end="${list.pageTotalCount }" var="i">
		<a href="main?page=${i }">${i }</a>
	</c:forEach>
</div>
--%>
<div class="container my-3 p-3">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
	<c:forEach begin="1" end="${list.pageTotalCount }" var="i">  
    	<li class="page-item">
    		<a class="page-link" href="main?page=${i }">${i }</a>
    	</li>
    </c:forEach>
  </ul>
</nav>
</div>

<%-- 
<div class="delete-form">
<form action="delete" method="post">
id: <input id="delete-input-id" type="text" name="id" value="" /> <br />
암호: <input type="password" name="password" /> <br />
<input type="submit" value="삭제"/>
</form>
</div>
--%>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">암호 확인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="delete-form" action="delete" method="post">
						<input type="text" class="d-none form-control" name="id"
							id="recipient-name">

						<div class="form-group">
							<label for="message-text" class="col-form-label">암호:</label> <input
								type="password" name="password" class="form-control"
								id="message-text">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<input class="btn btn-danger" type="submit" form="delete-form"
						value="삭제" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>