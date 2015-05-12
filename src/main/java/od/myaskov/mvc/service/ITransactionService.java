package od.myaskov.mvc.service;

import od.myaskov.mvc.model.Transaction;

import java.util.List;

/**
 * Created by myaskov on 29.01.2015.
 */
public interface ITransactionService {

    public Transaction addTransaction(Transaction transaction);
    public Transaction getTransaction(Long transactionId);
    public void deleteTransaction(Long transactionId);
    public List<Transaction> getTransactions();
    public boolean createTransferTransaction(Transaction transaction);
    public boolean createPaymentTransaction(Transaction transaction, String typeOfOperation);
}
