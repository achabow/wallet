package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WALLET_TABLE")
public class Wallet implements Serializable {
    
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String walletName;
    private String walletDesc;
    private Long walletBalance;
    private Long clientId;

    public Wallet() {
    }

    
    public Wallet(String walletName, String walletDesc, Long walletBalance, Long clientId) {
        this.walletName = walletName;
        this.walletDesc = walletDesc;
        this.walletBalance = walletBalance;
        this.clientId = clientId;
        
    }


	public Long getId() {
		return id;
	}


	public String getWalletName() {
		return walletName;
	}


	public String getWalletDesc() {
		return walletDesc;
	}


	public Long getWalletBalance() {
		return walletBalance;
	}


	public Long getClientId() {
		return clientId;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public void setWalletName(String walletName) {
		this.walletName = walletName;
	}


	public void setWalletDesc(String walletDesc) {
		this.walletDesc = walletDesc;
	}


	public void setWalletBalance(Long walletBalance) {
		this.walletBalance = walletBalance;
	}


	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}
    

       
}