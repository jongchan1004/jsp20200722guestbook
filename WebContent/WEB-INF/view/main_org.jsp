<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
$(function() {
	$(".delete-form").hide();
	$(".btn-delete").click(function(){
		$(".delete-form").show();
		var messageId = $(this).attr("data-message-id");
		$("#delete-input-id").val(messageId);
	});
});
</script>
</head>
<body>

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
<hr />
<div>
	<c:forEach var="message" items="${list.messageList }">
		<div class="border">
			<h6>${message.id } : ${message.guestName }</h6>
			<p>${message.message }</p>
			<p><button data-message-id="${message.id}" class="btn btn-danger btn-delete">삭제하기</button></p>
		</div>
	</c:forEach>
</div>

<div>
	<c:forEach begin="1" end="${list.pageTotalCount }" var="i">
		<a href="main?page=${i }">${i }</a>
	</c:forEach>
</div>

<div class="delete-form">
<form action="delete" method="post">
id: <input id="delete-input-id" type="text" name="id" value="" /> <br />
암호: <input type="password" name="password" /> <br />
<input type="submit" value="삭제"/>
</form>
</div>

</body>
</html>