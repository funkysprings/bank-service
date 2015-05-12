package od.myaskov.mvc.repository;

import od.myaskov.mvc.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by myaskov on 20.01.2015.
 */

public interface ClientRepository extends JpaRepository<Client,Integer> {

}
