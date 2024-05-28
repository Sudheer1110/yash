package mvc;

import org.springframework.stereotype.Service;

@Service
public class user {
	public user() {
	}

	String username, usermail, userphone, userpincode;
	int usertypeid;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsermail() {
		return usermail;
	}

	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public int getUsertypeid() {
		return usertypeid;
	}

	public void setUsertypeid(int usertypeid) {
		this.usertypeid = usertypeid;
	}

	public String getUserpincode() {
		return userpincode;
	}

	public void setUserpincode(String userpincode) {
		this.userpincode = userpincode;
	}

	int userid;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

}
