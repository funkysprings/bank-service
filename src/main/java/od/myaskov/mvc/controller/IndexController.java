package od.myaskov.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by myaskov on 24.01.2015.
 */

@Controller
public class IndexController {

    @RequestMapping(value={"/", "index"}, method= RequestMethod.GET)
    public String index() {
        return "home";
    }

}
