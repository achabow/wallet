package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Wallet;
import service.NewWalletService;


public class NewWalletServlet extends HttpServlet{
	
	public void response() {
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	 response.setContentType("text/html;charset=UTF-8");
	 PrintWriter out = response.getWriter();
	 String walletName = request.getParameter("walletName");
	 String walletDesc = request.getParameter("walletDesc");
	 Long walletBalance = Long.parseLong(request.getParameter("walletBalance"));
	 //Long clientId = Long.getLong(request.getParameter("clientId"));
	//Long clientId=(long) 3;
	 Long clientId = LoginServlet.id; //!!!
	 
	 Wallet wallet = new Wallet(walletName,walletDesc,walletBalance,clientId);
			
	 try {	
		 NewWalletService newWalletService = new NewWalletService();
		 boolean result = newWalletService.register(wallet);		
		 out.println("<html>");
		 out.println("<head>");		
		 out.println("<title>Registration Successful</title>");
		 out.println("</head>");
		 out.println("<body>");
		 out.println("<center>");
		 if(result){
			 response.sendRedirect("walletlogin.jsp");
			 out.println("<h1>Thanks for Registering with us :</h1>");
			 out.println("To login with new UserId and Password<a href=login.jsp>Click here</a>");
		 }else{
			 out.println("<h1>Registration Failed</h1>");
			 out.println("To try again<a href=register.jsp>Click here</a>");
		 }
		 out.println("</center>");
		 out.println("</body>");
		 out.println("</html>");
	 } finally {		
		 out.close();
	 }
}

}
