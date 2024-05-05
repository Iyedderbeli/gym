package gym;

import java.sql.Date;

public class Client {
    private String name;
    private String address;
    private String phone;
    private String email;
    private String password;
    private String membership_type;
    private Date registrationdate; 

    public Client() {
    }

    public Client(String name, String address, String phone, String email, String password,String membership_type,Date registrationdate) {
        this.name = name;
        this.address = address;
        this.phone= phone;
        this.email = email;
        this.password=password;
        this.membership_type = membership_type;
        this.registrationdate=registrationdate;
    }

    public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMembership_type() {
        return membership_type;
    }

    public void setMembership_type(String membership_type) {
        this.membership_type = membership_type;
    }
    public String getName() {
        return name;
    }
    public String getAddress() {
        return address;
    }
    public void setName(String name) {
		this.name = name;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegistrationdate() {
		return registrationdate;
	}

	public void setRegistrationdate(Date registrationdate) {
		this.registrationdate = registrationdate;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
        return phone;
    }
    public String getEmail() {
        return email;
    }
}
