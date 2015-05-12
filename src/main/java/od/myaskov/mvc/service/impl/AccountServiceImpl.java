package od.myaskov.mvc.service.impl;

import od.myaskov.mvc.model.Account;
import od.myaskov.mvc.repository.AccountRepository;
import od.myaskov.mvc.service.IAccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by myaskov on 23.01.2015.
 */

@Service
public class AccountServiceImpl implements IAccountService{

    @Resource
    private AccountRepository accountRepository;

    @Override
    public Account addAccount(Integer clientId) {
        Account newAccount = new Account();
        newAccount.setClient_id(clientId);
        newAccount.setAmountOfMoney(0);
        accountRepository.saveAndFlush(newAccount);
        return newAccount;
    }

    @Override
    public Account getAccount(Integer accountId) {
        return accountRepository.findOne(accountId);
    }

    @Override
    public void deleteAccount(Integer accountId) {
        Account deletedAccount = getAccount(accountId);
        accountRepository.delete(deletedAccount);
    }

    @Override
    public void deleteAllAccountsByClient(Integer clientId) {
        List<Account> accountsToDelete = getAccountsByClientId(clientId);
        for (Account account : accountsToDelete) {
            deleteAccount(account.getAccountId());
        }
        accountRepository.flush();
    }

    @Override
    public List<Account> getAccounts() {
        return accountRepository.findAll();
    }

    @Override
    public List<Account> getAccountsByClientId(Integer clientId) {
        return accountRepository.findByClient_ClientId(clientId);
    }

    @Override
    public void updateAccount(Account account) {
        accountRepository.saveAndFlush(account);
    }
}
