<%@page import="java.util.List"%>
<%@page import="service.LoginService"%>
<%@page import="java.util.Date"%>
<%@page import="service.NewWalletService"%>
<%@page import="model.User"%>
<%@page import="model.Wallet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <link rel="stylesheet" type="text/css" href="css/style.css"/> 
	 	<link type="text/css" href="./css/bootstrap.css" rel="stylesheet" />
	 
	 <title>Result Page</title>	
</head>
<body>
<center>
	 <div id="container">
		 <h1>Result Page</h1>
			 <b>This is Sample Result Page</b><br/>
			 <%=new Date()%></br>
			 <%
				 User user = (User) session.getAttribute("user");

			 	 Wallet wallet = (Wallet) session.getAttribute("wallet");
			 %>		
			 <b>Welcome <%= user.getFirstName() + " " + user.getLastName() %></b>
				
			 <br/>
			 <a href="logout.jsp">Logout</a>
		 </p>

		 <table>
			 <thead>
				 <tr>
					 <th>Nazwa</th>
					 <th>Opis</th>	
					 <th>zz</th>			
				 </tr>
			 </thead>
			 <tbody>
				 <%
				 NewWalletService newWalletService = new NewWalletService();
				 List<Wallet> list = newWalletService.getListOfWallets();
					 for (Wallet w : list) {
				 %>
				 <tr>
					 <td><%=w.getWalletName()%></td>
					 <td><%=w.getWalletDesc()%></td>
					 <td><a href="walletlogin.jsp?walletId=<%=w.getId()%>" class="btn btn-primary" role="button">Edytuj portfel</a></td>
				 </tr>
				 <%}%>
			 <tbody>
		 </table>		
		 <br/>
		 <a href="newwallet.jsp" class="btn btn-primary" role="button">Stwórz portfel</a>
		 <a href="walletlogin.jsp" class="btn btn-primary" role="button">Edytuj portfel</a>
	 </div>
	</center>	
	
</body>
</html>
