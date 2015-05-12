package od.myaskov.mvc.controller;

import od.myaskov.mvc.model.Account;
import od.myaskov.mvc.service.IAccountService;
import od.myaskov.mvc.service.IClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by myaskov on 23.01.2015.
 */

@EnableWebMvc
@Controller
@RequestMapping(value = "/clients/accounts")
public class AccountController {

    @Autowired
    private IAccountService accountService;

    @Autowired
    private IClientService clientService;

    @RequestMapping(value = "/{clientId}", method = RequestMethod.GET)
    public String getClientAccounts(@PathVariable("clientId") Integer clientId,
                                    ModelMap model) {
        model.addAttribute("client", clientService.getClient(clientId));
        model.addAttribute("account", new Account());
        model.addAttribute("accounts", accountService.getAccountsByClientId(clientId));
        return "accounts";
    }

    @RequestMapping(value = "/create_new_account/{clientId}", method = RequestMethod.POST)
    public String createNewAccount(@PathVariable("clientId") Integer clientId) {
        accountService.addAccount(clientId);
        return "redirect:/clients/accounts/"+clientId.toString();
    }

    @RequestMapping(value = "/{clientId}/delete/{accountId}", method = RequestMethod.POST)
    public String deleteAccount(@PathVariable("accountId") Integer accountId,
                                @PathVariable("clientId") Integer clientId) {
        accountService.deleteAccount(accountId);
        return "redirect:/clients/accounts/"+clientId.toString();
    }

    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public
    @ResponseBody
    List<Integer> getAccounts(@RequestParam final Integer id) {
        List<Integer> accountsId = new ArrayList<>();
        for (Account account : accountService.getAccountsByClientId(id)) {
            accountsId.add(account.getAccountId());
        }
        return accountsId;
    }
}