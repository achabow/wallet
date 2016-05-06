package service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import hibernate.util.HibernateUtil;
import model.User;

public class LoginService {
	
	
	
    public boolean authenticateUser(String userId, String password) {
        User user = getUserByUserId(userId);          
        if(user!=null && user.getUserId().equals(userId) && user.getPassword().equals(password)){
            return true;
        }else{ 
            return false;
        }
    }

    public User getUserByUserId(String userId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        User user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from User where userId='"+userId+"'");
            user = (User)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }
    
    public List<User> getListOfUsers(){
        List<User> list = new ArrayList<User>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from User").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    //!!!
    public long getUserId(String userId) {
		Session session = HibernateUtil.openSession();
		long result = 0;
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("SELECT id FROM User where userId='" + userId + "'");
			//System.out.println((query.uniqueResult()).toString());
			result = Long.parseLong((query.uniqueResult()).toString());
			System.out.println(result);
			tx.commit();
			
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
