package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.Wallet;
import service.NewWalletService;

public class EditWalletServlet extends HttpServlet {
	
	public static Long walletId;
	

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		
		Long id = Long.parseLong(request.getParameter("walletId"));
		request.getSession().setAttribute("walletId", id);
		walletId = Long.parseLong(request.getParameter("walletId"));
		NewWalletService newWalletService = new NewWalletService();
		System.out.println("aaa" + id.toString());
		
	}
	

}

