package od.myaskov.mvc.controller;

import od.myaskov.mvc.model.Client;

import od.myaskov.mvc.service.IClientService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "clients")
public class ClientController {

    @Autowired
    private IClientService clientService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listClients(ModelMap model) {
        model.addAttribute("client", new Client());
        model.addAttribute("clients", clientService.getClients());
        return "all_clients";
    }

    @RequestMapping(value = "/new_client")
    public String addNewClient(@ModelAttribute("client") Client client) {
        return "new_client";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addingClient(@ModelAttribute("client") Client client) {
        clientService.addClient(client);
        return "redirect:/clients/";
    }

    @RequestMapping(value = "/delete/{clientId}", method = RequestMethod.GET)
    public String deleteClient(@PathVariable("clientId") Integer clientId) {
        clientService.deleteClient(clientId);
        return "redirect:/clients/";
    }


    @RequestMapping(value = "/edit/{clientId}")
    public String editClient(@PathVariable("clientId") Integer clientId,
                             ModelMap model) {
        Client editableClient = clientService.getClient(clientId);
        model.addAttribute("editableClient", editableClient);
        model.addAttribute("clients", clientService.getClients());
        return "edit_client";
    }

    @RequestMapping(value = "/edit/{clientId}/ok", method = RequestMethod.POST)
    public String editingClientOk(@PathVariable("clientId") Integer clientId,
                                @ModelAttribute("client") Client changedClient) {
        changedClient.setClientId(clientId);
        clientService.editClient(changedClient);
        return "redirect:/clients/";
    }

    @RequestMapping(value = "/edit/{clientId}/cancel")
    public String editingClientCancel(@PathVariable("clientId") Integer clientId) {
        return "redirect:/clients/";
    }

    @RequestMapping(value = "/api/", method = RequestMethod.GET)
    public
    @ResponseBody
    String listUsersJson() throws JSONException {
        JSONArray clientArray = new JSONArray();
        for (Client client : clientService.getClients()) {
            JSONObject clientJSON = new JSONObject();
            clientJSON.put("clientId", client.getClientId());
            clientJSON.put("firstName", client.getFirstName());
            clientJSON.put("lastName", client.getLastName());
            clientJSON.put("address", client.getAddress());
            clientJSON.put("age", client.getAge());
            clientArray.put(clientJSON);
        }
        return clientArray.toString();
    }

}
