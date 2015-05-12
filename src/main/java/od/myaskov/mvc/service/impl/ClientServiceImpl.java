package od.myaskov.mvc.service.impl;

import od.myaskov.mvc.model.Account;
import od.myaskov.mvc.model.Client;
import od.myaskov.mvc.repository.AccountRepository;
import od.myaskov.mvc.repository.ClientRepository;
import od.myaskov.mvc.service.IAccountService;
import od.myaskov.mvc.service.IClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by myaskov on 23.01.2015.
 */

@Service
public class ClientServiceImpl implements IClientService{

    @Resource
    private ClientRepository clientRepository;

    @Autowired
    private IAccountService accountService;

    @Override
    @Transactional
    public Client addClient(Client client) {
        Client newClient = client;
        return clientRepository.saveAndFlush(newClient);
    }

    @Override
    public Client getClient(Integer clientId) {
        return clientRepository.findOne(clientId);
    }

    @Override
    @Transactional
    public void deleteClient(Integer clientId) {
        Client deletedClient = getClient(clientId);
        accountService.deleteAllAccountsByClient(clientId);
        clientRepository.delete(deletedClient);
    }

    @Override
    @Transactional
    public Client editClient(Client client) {
        return clientRepository.saveAndFlush(client);
    }

    @Override
    public List<Client> getClients() {
        return clientRepository.findAll();
    }

}
