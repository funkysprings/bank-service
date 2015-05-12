package od.myaskov.mvc.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by myaskov on 17.01.2015.
 */

@Entity
@Table(name = "CLIENT")
public class Client implements Serializable {

    @Id
    @Column(name = "IDCLIENT")
    @GeneratedValue(generator = "increment")
    @org.hibernate.annotations.GenericGenerator(name= "increment", strategy= "increment")
    private Integer clientId;

    @Column(name = "FNAME")
    private String firstName;

    @Column(name = "LNAME")
    private String lastName;

    @Column(name = "ADRESS")
    private String address;

    @Column(name = "AGE")
    private Integer age;

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

}

