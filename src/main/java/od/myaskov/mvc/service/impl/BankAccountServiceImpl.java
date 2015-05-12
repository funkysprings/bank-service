package od.myaskov.mvc.service.impl;

import od.myaskov.mvc.model.BankAccount;
import od.myaskov.mvc.repository.BankAccountRepository;
import od.myaskov.mvc.service.IBankAccountService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by myaskov on 09.03.2015.
 */
public class BankAccountServiceImpl implements IBankAccountService {

    @Resource
    private BankAccountRepository bankAccountRepository;

    @Override
    public BankAccount getBankAccount(Integer accountId) {
        return bankAccountRepository.findOne(accountId);
    }

    @Override
    public void updateBankAccount(BankAccount bankAccount) {
        bankAccountRepository.saveAndFlush(bankAccount);
    }

    @Override
    public List<BankAccount> getBankAccounts() {
        return bankAccountRepository.findAll();
    }
}
