<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.LinkedList" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<--종료가 제대로 먹도록 보완하고, 내부로직, session 초기화, css 까지 마무리해야함-->
</head>
<style>
	body{
		background-color : skyblue;
	}
</style>
<body>

	<form name = "mouseclick" method = "get" action = "../test/mouselocation.do" enctype = "multipart/form-data">
		<table border ="1" width = "80%">
			<tr>
				<td style="width: 40%; text-align: center; background-color: blue; color: white;">첫번째 좌표</td>
				<td colspan = "2" align = "center" style width="20%;">
   	  		    	<button type="button" onclick="delayedSubmit()">버튼</button>
   			    </td>
   			    <td style width="20%;" align = "center">
    		    	<div id="timer">0초</div>
    		    </td>
			</tr>

   			
		</table>
	</form>

	<script>
 		let time =0;
		const timerElement = document.getElementById("timer");
		function updateTimer() {
		    time += 1;
		    timerElement.innerText = time + "초";
		}
		
 		let time2 =0;
		const timerElement2 = document.getElementById("timer2");
		function updateTimer2() {
		    time2 += 1;
		    timerElement2.innerText = time2 + "초";
		}
		
 		let time3 =0;
		const timerElement3 = document.getElementById("timer3");
		function updateTimer3() {
		    time3 += 1;
		    timerElement3.innerText = time3 + "초";
		}
		
		
		
		function delayedSubmit() {
			setTimeout(function() {
				document.mouseclick.action = "../test/mouselocation.do";
				document.mouseclick.submit();
			}, 5000); // 5초 후에 실행되도록 지연
			setInterval(updateTimer, 1000);
		}
		function delayedSubmit2() {
			setTimeout(function() {
				document.mouseclick.action = "../test/mouselocation2.do";
				document.mouseclick.submit();
			}, 5000); // 5초 후에 실행되도록 지연
			setInterval(updateTimer2, 1000);
		}
		function delayedSubmit3() {
			setTimeout(function() {
				document.mouseclick.action = "../test/mouselocation3.do";
				document.mouseclick.submit();
			}, 5000); // 5초 후에 실행되도록 지연
			setInterval(updateTimer3, 1000);
		}
		function reset(){
			session.validate();
			alert("초기화되었습니다");
		}
	</script>



	<form name = "mouseclick2" method = "get" action = "../test/mouselocation2.do" enctype = "multipart/form-data">
		<table border ="1" width = "90%">
			<tr>
				<td>두번째 좌표</td>
				<td colspan = "2" align = "center">
   	  		    <button type="button" onclick="delayedSubmit2()">버튼</button>
   			    </td>
   			    <td>
    		    <div id="timer2">0초</div>
    		    </td>   			    
			</tr>
		</table>
	</form>

	<form name = "mouseclick3" method = "get" action = "../test/mouselocation3.do" enctype = "multipart/form-data">
		<table border ="1" width = "90%">
			<tr>
				<td>세번째 좌표</td>
				<td colspan = "2" align = "center">
   	  		    <button type="button" onclick="delayedSubmit3()">버튼</button>
   			    </td>
   			    <td>
    		    <div id="timer3">0초</div>
    		    </td>   			    
			</tr>
		</table>
	</form>

	<form>
		<input type = "button" value = "session 초기화" onclick = "reset()">
	</form>

</body>
</html>