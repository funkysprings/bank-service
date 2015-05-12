package od.myaskov.mvc.repository;

import od.myaskov.mvc.model.BankAccount;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by myaskov on 09.03.2015.
 */

public interface BankAccountRepository extends JpaRepository<BankAccount,Integer> {
}
