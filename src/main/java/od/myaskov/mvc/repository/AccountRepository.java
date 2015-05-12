package od.myaskov.mvc.repository;

import od.myaskov.mvc.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by myaskov on 23.01.2015.
 */

public interface AccountRepository extends JpaRepository<Account,Integer> {

    @Query("select a from Account a where a.idClient = :clientID")
    List<Account> findByClient_ClientId(@Param("clientID")Integer clientID);

}
