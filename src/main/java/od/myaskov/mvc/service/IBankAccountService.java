package od.myaskov.mvc.service;

import od.myaskov.mvc.model.BankAccount;

import java.util.List;

/**
 * Created by myaskov on 09.03.2015.
 */
public interface IBankAccountService {

    public BankAccount getBankAccount(Integer accountId);
    public void updateBankAccount(BankAccount bankAccount);
    public List<BankAccount> getBankAccounts();
}
