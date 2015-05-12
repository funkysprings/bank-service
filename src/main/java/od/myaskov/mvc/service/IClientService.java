package od.myaskov.mvc.service;

import od.myaskov.mvc.model.Client;

import java.util.List;

/**
 * Created by myaskov on 23.01.2015.
 */
public interface IClientService {

    public Client addClient(Client client);
    public Client getClient(Integer clientId);
    public void deleteClient(Integer clientId);
    public Client editClient(Client client);
    public List<Client> getClients();
}
