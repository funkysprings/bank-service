package od.myaskov.mvc.repository;

import od.myaskov.mvc.model.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by myaskov on 29.01.2015.
 */
public interface TransactionRepository extends JpaRepository<Transaction,Long> {
}
