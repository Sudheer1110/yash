package mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class yasDemo {

	@Autowired
	DAObridge obj;

	@RequestMapping(value = "/")
	public String yas() {
		return "home";
	}

	@RequestMapping(value = "/addhouse")
	public String addHouse() {
		return "houseregi";
	}

	@RequestMapping(value = "/gotohome")
	public String gotohome() {
		return "home";
	}

	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/goforregi", method = RequestMethod.POST)
	public String goForRegi() {
		return "userregi";
	}

	@RequestMapping(value = "/goforlogin", method = RequestMethod.POST)
	public String goForLogin(int userType, HttpSession session) {
		session.setAttribute("userType", userType);
		return "login";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(user u) {
		userDao.insertUser(u.getUsername(), u.getUsermail(), u.getUserphone(), u.getUsertypeid(), u.getUserpincode());
		return "success";
	}

	@RequestMapping(value = "/dataOfHouseToAdd", method = RequestMethod.POST)
	public String addHouseData(String houseName, int houseType, int rooms, String doornumber, double latitude,
			double longitude, String pincode, boolean availability_status, HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		obj.insertHouse(userId, houseName, houseType, rooms, doornumber, latitude, longitude, availability_status,
				pincode);
		return "success";
	}

	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "/sendOtp", method = RequestMethod.POST)
	public String sendOtp(int userId, HttpSession session, Model model) {
		int typeId = (int) session.getAttribute("userType");
		List<user> u = obj.getEmployeeByNo(userId, typeId);
		String email = null;
		String name = null;
		String phone = null;
		String pinCode = null;
		for (user obj : u) {
			email = obj.getUsermail();
			name = obj.getUsername();
			phone = obj.getUserphone();
			pinCode = obj.getUserpincode();
		}
		if (email != null) {
			int otp = emailService.generateOTP(session);
			emailService.sendEmail(email, otp);
			session.setAttribute("userId", userId);
			session.setAttribute("username", name);
			session.setAttribute("usermail", email);
			session.setAttribute("userphone", phone);
			session.setAttribute("userpincode", pinCode);
			System.out.println(otp);
			return "otpverification";
		} else {
			return "usernotexist";
		}
	}

	@RequestMapping("/verifyOtp")
	public String verifyOtp(String otp, HttpSession session, Model model) {
		int storedOtp = (int) session.getAttribute("otp");

		if (otp.equals(String.valueOf(storedOtp))) {
			model.addAttribute("message", "OTP Verification Successful!");
		} else {
			model.addAttribute("error", "Invalid OTP. Please try again.");
		}
		int typeId = (int) session.getAttribute("userType");
		if (typeId == 1) {
			return "redirect:getHousesInCustomerView";
		} else {
			return "redirect:getHouses";
		}
	}

	String username, usermail, userphone, usertypeid, userpincode;

	@RequestMapping("/setUpdate")
	public String setUpdateData(String username, String usermail, String userphone, String userpincode,
			HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		user user = new user();
		user.setUsername(username);
		user.setUserid(userId);
		user.setUsermail(usermail);
		user.setUserphone(userphone);
		user.setUserpincode(userpincode);
		obj.updateEmployee(user);
		return null;
	}

	@RequestMapping("/getHouses")
	public String getHousesData(HttpSession session, Model model) {
		int userId = (int) session.getAttribute("userId");
		List<HouseDetails> u = obj.getHouseByUserNo(userId);

		for (HouseDetails hd : u) {
			System.out.println(hd.getNameofapartment());
		}
		System.out.println(u);
		model.addAttribute("houseDetailsList", u);
		return "Owner";

	}

	@RequestMapping("/getHousesInCustomerView")
	public String getRentHousesData(HttpSession session, Model model) {
		String Pincode = (String) session.getAttribute("userpincode");
		List<HouseDetails> u = obj.getHouseByPincode(Pincode);

		for (HouseDetails hd : u) {
			System.out.println(hd.getNameofapartment());
		}
		System.out.println(u);
		model.addAttribute("rentHouseDetailsList", u);
		return "customerview";

	}

	@RequestMapping(value = "/housedelete", method = RequestMethod.POST)
	public String deleteHouseData(int houseId, HttpSession session) {
		obj.deleteEmployee(houseId);
		return "successDelete";
	}

}
