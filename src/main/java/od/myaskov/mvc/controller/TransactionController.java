package od.myaskov.mvc.controller;

import od.myaskov.mvc.model.Client;
import od.myaskov.mvc.model.Transaction;
import od.myaskov.mvc.service.IClientService;
import od.myaskov.mvc.service.ITransactionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * Created by myaskov on 29.01.2015.
 */

@Controller
public class TransactionController {

    @Autowired
    private ITransactionService transactionService;

    @Resource
    private IClientService clientService;

    @RequestMapping(value = "/transactions", method = RequestMethod.GET)
    public String listTransactions(ModelMap modelMap) {
        modelMap.addAttribute("transaction", new Transaction());
        modelMap.addAttribute("transactions", transactionService.getTransactions());
        return "list_of_transactions";
    }

    @RequestMapping(value = "/transfer")
    public String getTransferView( ModelMap model) {
        model.addAttribute("client", new Client());
        model.addAttribute("clients", clientService.getClients());
        model.addAttribute("transaction", new Transaction());
        return "transfer";
    }

    @RequestMapping(value = "/transfer/newacc/{clientId}")
    public String createNewAccountIfHaveNone(@PathVariable("clientId") Integer clientId) {
        return "redirect:/clients/accounts/"+clientId.toString();
    }

    @RequestMapping(value = "/transfer/do", method = RequestMethod.POST)
    public String doTransfer(@ModelAttribute("transaction") Transaction transaction, ModelMap model) {
        transactionService.createTransferTransaction(transaction);
        return "redirect:/transfer";
    }

    @RequestMapping(value = "/payment/{operation}")
    public String getPaymentView(@PathVariable("operation") String operation,
                                 ModelMap model) {
        if (operation.equals("deposit") || operation.equals("withdraw")) {
            StringBuilder op = new StringBuilder(operation);
            op.replace(0,1,String.valueOf(Character.toUpperCase(operation.charAt(0))));
            model.addAttribute("operation", op);
            model.addAttribute("client", new Client());
            model.addAttribute("clients", clientService.getClients());
            model.addAttribute("transaction", new Transaction());
            return "payment";
        }
        return null; //return error 404: page not found
    }

    @RequestMapping(value = "/payment/{operation}/do")
    public String doPayment(@PathVariable("operation") String operation,
                            @ModelAttribute("transaction") Transaction transaction) {
        StringBuilder op = new StringBuilder(operation);
        op.replace(0,1,String.valueOf(Character.toLowerCase(operation.charAt(0))));
        operation = String.valueOf(op);
        if (operation.equals("deposit") || operation.equals("withdraw")) {
            transactionService.createPaymentTransaction(transaction, operation);
            return "redirect:/payment/" + operation;
        }
        return null; //return error 404: page not found
    }
}
