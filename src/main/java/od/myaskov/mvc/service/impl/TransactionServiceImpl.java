package od.myaskov.mvc.service.impl;

import od.myaskov.mvc.model.Account;
import od.myaskov.mvc.model.Transaction;
import od.myaskov.mvc.repository.AccountRepository;
import od.myaskov.mvc.repository.TransactionRepository;
import od.myaskov.mvc.service.IAccountService;
import od.myaskov.mvc.service.ITransactionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by myaskov on 29.01.2015.
 */

@Service
public class TransactionServiceImpl implements ITransactionService {

    @Resource
    private TransactionRepository transactionRepository;

    @Resource
    private IAccountService accountService;

    @Override
    @Transactional
    public Transaction addTransaction(Transaction transaction) {
        Transaction newTransaction = transaction;
        return transactionRepository.saveAndFlush(newTransaction);
    }

    @Override
    public Transaction getTransaction(Long transactionId) {
        return transactionRepository.findOne(transactionId);
    }

    @Override
    @Transactional
    public void deleteTransaction(Long transactionId) {
        Transaction deletedTransaction = getTransaction(transactionId);
        transactionRepository.delete(deletedTransaction);
    }

    @Override
    public List<Transaction> getTransactions() {
        return transactionRepository.findAll();
    }

    @Override
    public boolean createTransferTransaction(Transaction fromTransaction) {
        try {
            checkMoney(fromTransaction.getFromAccountId(), fromTransaction.getAmountOfMoneyToSend());
            fromTransaction.setDescription("write-of account");
            fromTransaction.setIsSuccess(true);
            fromTransaction.setDate(new Date());
            handlingMoney(fromTransaction); //withdraw and deposit of money
            Transaction newToTransaction = new Transaction();
            newToTransaction.setFromAccountId(fromTransaction.getToAccountId());
            newToTransaction.setToAccountId(fromTransaction.getFromAccountId());
            newToTransaction.setAmountOfMoneyToSend(fromTransaction.getAmountOfMoneyToSend());
            newToTransaction.setDescription("refill account");
            newToTransaction.setIsSuccess(true);
            newToTransaction.setDate(new Date());
            fromTransaction.setAmountOfMoneyToSend(-fromTransaction.getAmountOfMoneyToSend());
            addTransaction(fromTransaction);
            addTransaction(newToTransaction);
        } catch (MoneyAccountException e) {
            fromTransaction.setAmountOfMoneyToSend(-fromTransaction.getAmountOfMoneyToSend());
            fromTransaction.setDescription(e.getMessage());
            fromTransaction.setIsSuccess(false);
            fromTransaction.setDate(new Date());
            addTransaction(fromTransaction);
        }
        return fromTransaction.getIsSuccess();
    }

    private void handlingMoney(Transaction transaction) {
        Account accountFrom = accountService.getAccount(transaction.getFromAccountId());
        Account accountTo = accountService.getAccount(transaction.getToAccountId());
        accountFrom.setAmountOfMoney(accountFrom.getAmountOfMoney()-transaction.getAmountOfMoneyToSend());
        accountTo.setAmountOfMoney(accountTo.getAmountOfMoney()+transaction.getAmountOfMoneyToSend());
        accountService.updateAccount(accountFrom);
        accountService.updateAccount(accountTo);
    }

    private void checkMoney(Integer fromAccountId, Integer money) throws MoneyAccountException {
        if (money.equals(0)) {
            throw new MoneyAccountException("zero is not appropriate sum of money");
        } else {
            Account account = accountService.getAccount(fromAccountId);
            if (account.getAmountOfMoney().compareTo(money) == -1) {
                throw new MoneyAccountException("not enough money to write-of");
            }
        }
    }

    @Override
    public boolean createPaymentTransaction(Transaction transaction, String typeOfOperation) {
        transaction.setToAccountId(transaction.getFromAccountId());
        try {
            switch(typeOfOperation) {
                case "deposit":
                    checkDepositMoney(transaction.getAmountOfMoneyToSend());
                    handlingPaymentMoney(transaction);
                    transaction.setDescription("refill account");
                    transaction.setIsSuccess(true);
                    transaction.setDate(new Date());
                    break;
                case "withdraw":
                    checkMoney(transaction.getFromAccountId(), transaction.getAmountOfMoneyToSend());
                    transaction.setAmountOfMoneyToSend(-transaction.getAmountOfMoneyToSend());
                    handlingPaymentMoney(transaction);
                    transaction.setDescription("write-of account");
                    transaction.setIsSuccess(true);
                    transaction.setDate(new Date());
                    break;
                default: break;
            }
        } catch (MoneyAccountException e) {
            transaction.setAmountOfMoneyToSend(-transaction.getAmountOfMoneyToSend());
            transaction.setDescription(e.getMessage());
            transaction.setIsSuccess(false);
            transaction.setDate(new Date());
        } finally {
            addTransaction(transaction);
        }
        return transaction.getIsSuccess();
    }

    private void checkDepositMoney(Integer money) throws MoneyAccountException {
        if (money.equals(0)) {
            throw new MoneyAccountException("zero is not appropriate sum of money");
        }
    }

    private void handlingPaymentMoney(Transaction transaction) {
        Account account= accountService.getAccount(transaction.getFromAccountId());
        account.setAmountOfMoney(account.getAmountOfMoney() + transaction.getAmountOfMoneyToSend());
        accountService.updateAccount(account);
    }

    private class MoneyAccountException extends Exception {
        public MoneyAccountException(String message) {
            super("error: " + message);
        }
    }

}