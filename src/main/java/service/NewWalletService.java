package service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import controller.LoginServlet;
import hibernate.util.HibernateUtil;
import hibernate.util.HibernateUtilWallet;
import model.Wallet;

public class NewWalletService {

	public boolean register(Wallet wallet) {
		Session session = HibernateUtilWallet.openSession();
//		if (isWalletExists(wallet))
//			return false;

		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			session.saveOrUpdate(wallet);
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return true;
	}
	
	
	//lista do wyswietania portfela do wykorzystania w .jsp
	public List<Wallet> getListOfWallets(){
		List<Wallet> list = new ArrayList<Wallet>();
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			list = session.createQuery("from Wallet where clientId ='" + LoginServlet.id + "'").list();
			tx.commit();
		} catch (Exception e){
			if (tx != null){
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public boolean isWalletExists(Wallet wallet) {
		Session session = HibernateUtilWallet.openSession();
		boolean result = false;
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();					      
			Query query = session.createQuery("select id from User where clientId ='" + wallet.getClientId() + "'");
			System.out.println(wallet.getClientId());
			Wallet u = (Wallet) query.uniqueResult();
			tx.commit();
			if (u != null)
				result = true;
		} catch (Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}
}
