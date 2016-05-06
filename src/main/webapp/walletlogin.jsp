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
			  <b>Welcome <%= user.getFirstName() + " " + user.getLastName() + " " + request.getParameter("walletId") %></b>
		</h3>
		<table class="table table-bordered table-condensed">
			<thead>
				<tr class="active">
				</tr>
			</thead>
				 <%
 					 NewWalletService newWalletService = new NewWalletService();
				 	 Long id = Long.parseLong(request.getParameter("walletId"));
					 request.getSession().setAttribute("walletId", id);
					 List<Wallet> list = newWalletService.getWalletById(id);
					 for (Wallet w : list) {  
				 %>			
			<tbody>
				<h4>Nazwa portfela: <%=w.getWalletName() %></h4>
				<tr class="success">
					<td>Pensja</td>
					<td><%=w.getWalletBalance() + " PLN" %></td>
				</tr>
				<%}%>
				<tr class="danger">
					<td>Samochód</td>
					<td><input></input></td>
					<td>
						<button type="submit" name="buttonAdd" class ="btn btn-success">dodaj</button>
						<button type="buttonRemove" name="butonRemove" class ="btn btn-danger">usuń</button>
						</form>
					</td>				
				</tr>
				<tr class="warning">
					<td>Jedzenie</td>
					<td><input></input></td>
					<td><button type="button" class ="btn btn-success">dodaj</button><button type="button" class ="btn btn-danger">usuń</button></td>
				</tr>
				<tr class="info">
					<td>Rozrywka</td>
					<td><input></input></td>
					<td><button type="button" class ="btn btn-success">dodaj</button><button type="button" class ="btn btn-danger">usuń</button></td>
				</tr>
				<tr class="success">
					<td>Inne</td>
					<td><input></input></td>
					<td><button type="button" class ="btn btn-success">dodaj</button><button type="button" class ="btn btn-danger">usuń</button></td>
				</tr>				
			</tbody>
		</table>
	</div>
</body>
</html>