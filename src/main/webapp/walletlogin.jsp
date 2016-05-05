<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Wallet"%>
<%@page import="java.util.List"%>
<%@page import="service.NewWalletService"%>
<%@page import="java.util.Date"%>
<%@page import="model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link type="text/css" href="./css/bootstrap.css" rel="stylesheet" />
<title>Edit your waller</title>
</head>
<body>
	<div id=container">
		<h3>
			<%=new Date()%></br>
			 <%
				 User user = (User) session.getAttribute("user");
			 %>		
			 <b>Welcome <%= user.getFirstName() + " " + user.getLastName()%></b>
		</h3>
		<table class="table table-bordered table-condensed">
			<thead>
				<tr class="active">
				</tr>
			</thead>
				 <%
					 NewWalletService newWalletService = new NewWalletService();
					 List<Wallet> list = newWalletService.getWallet();
					 for (Wallet w : list) {
				 %>			
			<tbody>
				<tr class="success">
					<td>Pensja</td>
					<td><%=w.getWalletDesc() %></td>
					<td>200</td>
				</tr>
				<%}%>
				<tr class="danger">
					<td>Samochód</td>
					<td>20</td>
				</tr>
				<tr class="warning">
					<td>Żywność</td>
					<td>20</td>
				</tr>
				<tr class="info">
					<td>Rozrywka</td>
					<td>20</td>
				</tr>
				<tr class="success">
					<td>Inne</td>
					<td>10</td>
				</tr>				
			</tbody>
		</table>
	</div>
</body>
</html>