package od.myaskov.mvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by myaskov on 09.03.2015.
 */

@Entity
@Table(name = "BANK_ACCOUNT")
public class BankAccount implements Serializable{
    
    @Id
    @Column(name = "IDBANKACCOUNT")
    private Integer accountId;

    @Column(name = "AMOUNT_MONEY")
    private Long amountOfMoney;

    @Column(name = "IS_FOR_OPERATIONS")
    private boolean isForOperations;

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Long getAmountOfMoney() {
        return amountOfMoney;
    }

    public void setAmountOfMoney(Long amountOfMoney) {
        this.amountOfMoney = amountOfMoney;
    }

    public boolean isForOperations() {
        return isForOperations;
    }

    public void setForOperations(boolean isForOperations) {
        this.isForOperations = isForOperations;
    }
}
