package od.myaskov.mvc.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by myaskov on 29.01.2015.
 */

@Entity
@Table(name = "TRANSACTION")
public class Transaction implements Serializable {

    @Id
    @GeneratedValue(generator = "increment")
    @org.hibernate.annotations.GenericGenerator(name= "increment", strategy= "increment")
    @Column(name = "IDTRANS")
    private Long transactionId;

    @Column(name = "FROM_ACCOUNT_ID")
    private Integer fromAccountId;

    @Column(name = "TO_ACCOUNT_ID")
    private Integer toAccountId;

    @Column(name = "SENDMONEY")
    private Integer amountOfMoneyToSend;

    @Column(name = "DESC")
    private String description;

    @Column(name = "IS_SUCCESS")
    private Boolean isSuccess;

    @Column(name = "DATE")
    private Date date;

    public Long getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Long transactionId) {
        this.transactionId = transactionId;
    }

    public Integer getFromAccountId() {
        return fromAccountId;
    }

    public void setFromAccountId(Integer fromAccountId) {
        this.fromAccountId = fromAccountId;
    }

    public Integer getToAccountId() {
        return toAccountId;
    }

    public void setToAccountId(Integer toAccountId) {
        this.toAccountId = toAccountId;
    }

    public Integer getAmountOfMoneyToSend() {
        return amountOfMoneyToSend;
    }

    public void setAmountOfMoneyToSend(Integer amountOfMoneyToSend) {
        this.amountOfMoneyToSend = amountOfMoneyToSend;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(Boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
