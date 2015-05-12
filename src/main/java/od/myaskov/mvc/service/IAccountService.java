package od.myaskov.mvc.service;

import od.myaskov.mvc.model.Account;

import java.util.List;

/**
 * Created by myaskov on 23.01.2015.
 */
public interface IAccountService {

    public Account addAccount(Integer clientId);
    public Account getAccount(Integer accountId);
    public void deleteAccount(Integer accountId);
    public void deleteAllAccountsByClient(Integer clientId);
    public List<Account> getAccounts();
    public List<Account> getAccountsByClientId(Integer clientId);
    public void updateAccount(Account account);

}
