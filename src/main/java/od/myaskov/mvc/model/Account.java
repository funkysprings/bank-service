package od.myaskov.mvc.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by myaskov on 23.01.2015.
 */

@Entity
@Table(name = "ACCOUNT")
public class Account implements Serializable{

    @Id
    @GeneratedValue(generator = "increment")
    @org.hibernate.annotations.GenericGenerator(name= "increment", strategy= "increment")
    @Column(name = "IDACCOUNT")
    private Integer accountId;

    @Column(name = "CLIENT_ID")
    private Integer idClient;

    @Column(name = "AMOUNT_MONEY")
    private Integer amountOfMoney;

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getAmountOfMoney() {
        return amountOfMoney;
    }

    public void setAmountOfMoney(Integer amountOfMoney) {
        this.amountOfMoney = amountOfMoney;
    }

    public Integer getClient_id() {
        return idClient;
    }

    public void setClient_id(Integer client_id) {
        this.idClient = client_id;
    }
}
